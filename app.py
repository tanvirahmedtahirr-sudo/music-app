from flask import Flask, request, jsonify
import json, urllib.request, urllib.parse, os
app = Flask(__name__)
FAV = "favorites.json"
BNG = "bangla.json"

def load_j(f):
    if os.path.exists(f):
        return json.loads(open(f).read())
    return []

def save_j(f, l):
    open(f, "w").write(json.dumps(l))

def enrich(s):
    try:
        url = "https://itunes.apple.com/search?term=" + urllib.parse.quote(s["t"] + " " + s.get("a","")) + "&media=music&limit=1"
        with urllib.request.urlopen(url, timeout=8) as r:
            data = json.loads(r.read())
        res = data.get("results", [])
        if res:
            s["img"] = res[0].get("artworkUrl100","").replace("100x100","200x200")
            s["prev"] = res[0].get("previewUrl","")
    except Exception:
        pass
    return s

@app.route("/")
def home():
    return open("index.html").read()

@app.route("/search")
def search():
    q = request.args.get("q","")
    url = "https://itunes.apple.com/search?term=" + urllib.parse.quote(q) + "&media=music&limit=15"
    try:
        with urllib.request.urlopen(url, timeout=10) as r:
            data = json.loads(r.read())
        return jsonify([{"t":x.get("trackName",""),"a":x.get("artistName",""),
                         "img":x.get("artworkUrl100","").replace("100x100","200x200"),
                         "prev":x.get("previewUrl",""),
                         "link":x.get("trackViewUrl","")} for x in data.get("results",[])])
    except Exception:
        return jsonify([])

@app.route("/fav", methods=["POST"])
def fav():
    s = request.get_json()
    favs = load_j(FAV)
    favs = [f for f in favs if f["link"] != s["link"]]
    if not s.get("remove"):
        favs.insert(0, s)
    save_j(FAV, favs)
    return jsonify({"ok": True, "count": len(favs)})

@app.route("/favorites")
def favorites():
    return jsonify(load_j(FAV))

@app.route("/bangla")
def bangla_get():
    lst = load_j(BNG)
    for s in lst:
        if "img" not in s:
            enrich(s)
    save_j(BNG, lst)
    return jsonify(lst)

@app.route("/bangla", methods=["POST"])
def bangla_add():
    s = request.get_json()
    item = {"t": s["t"], "a": s.get("a","")}
    enrich(item)
    lst = load_j(BNG)
    lst = [x for x in lst if not (x["t"] == item["t"] and x["a"] == item["a"])]
    lst.insert(0, item)
    save_j(BNG, lst)
    return jsonify(lst)

@app.route("/bangla/remove", methods=["POST"])
def bangla_remove():
    s = request.get_json()
    lst = load_j(BNG)
    lst = [x for x in lst if not (x["t"] == s["t"] and x["a"] == s["a"])]
    save_j(BNG, lst)
    return jsonify(lst)

app.run(host="0.0.0.0", port=5000)
