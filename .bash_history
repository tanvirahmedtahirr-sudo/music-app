cd ~
rm -f test_app.py
cat > test_app.py <<'EOF'
import flet as ft

def main(page: ft.Page):
    page.title = "My Music App"
    page.theme_mode = ft.ThemeMode.DARK

    song_list = ft.Column()

    def search_clicked(e):
        song_list.controls.append(ft.Text(f"Searching: {search_box.value}"))
        page.update()

    search_box = ft.TextField(hint_text="Search a song...")
    search_btn = ft.FilledButton("Search", on_click=search_clicked)

    page.add(
        ft.Text("🎵 My Music App", size=30, weight=ft.FontWeight.BOLD),
        search_box,
        search_btn,
        song_list,
    )

ft.run(main)
EOF

ls -la test_app.py
flet run test_app.py
flet run --web test_app.py
Serving app on http://localhost:8550
pkg install rust binutils -y
pip install --force-reinstall flet
flet run --web test_app.py
pip install setuptools wheel
pip install setuptools-rust
flet run --web test_app.py
pip install "flet==0.28.3"
sed -i 's/ft.run(main)/ft.app(main)/' test_app.py
flet run --web test_app.py
pip install "flet-web==0.28.3"
flet run --web test_app.py
pip install --no-deps --force-reinstall flet==0.28.3 flet-cli==0.28.3 flet-web==0.28.3 flet-runtime==0.28.3
pip install flet-desktop
pip install --no-deps --force-reinstall "flet==1.1.2" "flet-cli==1.1.2" "flet-web==1.1.2" "flet-runtime==1.1.2" "flet-desktop==1.1.2"
pip install --no-deps --force-reinstall "flet==1.1.2" "flet-cli==1.1.2" "flet-web==1.1.2" "flet-runtime==1.1.2"
pip install "flet-desktop==0.28.3" || pip install flet-desktop==0.27.6
sed -i 's/ft.app(main)/ft.run(main)/' test_app.py
flet run --web test_app.py
pip install asyncpg
flet run --web test_app.py
sed -i 's/ft.run(main)/ft.app(main, view=ft.AppView.WEB_BROWSER)/' test_app.py
python test_app.py
python -c "import asyncpg; print('asyncpg OK')"
python -c "import flet; print('flet', flet.version)"
pip install --no-build-isolation --force-reinstall asyncpg
python test_app.py
python -c "import asyncpg; print('asyncpg OK')"
python -c "import flet; print('flet OK')"
python test_app.py
cd ~
python -c "import asyncpg; print('asyncpg OK')"
python test_app.py
pip uninstall -y flet flet-cli flet-web flet-runtime flet-desktop
pip install --no-deps "flet==1.1.2" "flet-cli==1.1.2" "flet-web==1.1.2" "flet-runtime==1.1.2" "flet-desktop==1.1.2"
pip uninstall -y flet flet-cli flet-web flet-runtime flet-desktop asyncpg
python app.py
cat > app.py <<'EOF'
from http.server import HTTPServer, BaseHTTPRequestHandler

HTML = """
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Music App</title>
<style>
body { background:#121212; color:white; font-family:sans-serif;
       display:flex; flex-direction:column; align-items:center;
       padding-top:60px; }
h1 { color:#6d4aff; }
input { padding:14px; border-radius:12px; border:none;
        width:80%; font-size:16px; background:#2a2a2a; color:white; }
button { margin-top:16px; padding:14px 40px; border-radius:12px;
         border:none; background:#6d4aff; color:white;
         font-size:16px; font-weight:bold; }
#out { margin-top:24px; color:#aaa; }
</style>
</head>
<body>
<h1>🎵 My Music App</h1>
<input id="q" placeholder="Search a song...">
<button onclick="doSearch()">Search</button>
<p id="out"></p>
<script>
function doSearch() {
  var q = document.getElementById("q").value;
  document.getElementById("out").innerText = "Searching: " + q;
}
</script>
</body>
</html>
"""

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-Type", "text/html")
        self.end_headers()
        self.wfile.write(HTML.encode())

HTTPServer(("0.0.0.0", 8080), Handler).serve_forever()
EOF

ls -la app.py
python app.py
pkg update && pkg upgrade -y
pkg install python ffmpeg nano -y
sudo apt update && sudo apt list --upgradable
sudo apt autoremove
sudo reboot
pkg install python ffmpeg -y
python -m ensurepip --upgrade
pip install --upgrade pip
python -m ensurepip --upgrade
pip install --upgrade pip
pkg install python ffmpeg -y
python -m ensurepip --upgrade
pip install --upgrade pip
pip install -U yt-dlp
yt-dlp --version
termux-setup-storage
cd ~/storage/music
yt-dlp -f "bestaudio" -x --audio-format m4a --embed-thumbnail --embed-metadata "এখানে_লিংক_বসান"
cd ~/storage/movies
yt-dlp -f "bv*[height<=1080]+ba/b" --merge-output-format mp4 "লিংক"
yt-dlp --flat-playlist --print title,url "ytsearch5:famous bangla song"
mkdir -p ~/storage/music ~/storage/movies
ls ~/storage
https://www.youtube.com/watch?v=dQw4w9WgXcQ
yt-dlp -f "bestaudio" -x --audio-format m4a --embed-thumbnail --embed-metadata "https://www.youtube.com/watch?v=XXXXXXXXXXX"
mkdir -p ~/storage/music ~/storage/movies
yt-dlp --flat-playlist --print url "ytsearch3:pritom hasan bangla song"
yt-dlp -f "bestaudio" -x --audio-format m4a --embed-thumbnail --embed-metadata "https://www.youtube.com/watch?v=qznaQ8dJC2s"
ls ~/storage/music
yt-dlp -f "bv*[height<=1080]+ba/b" --merge-output-format mp4 "https://www.youtube.com/watch?v=qznaQ8dJC2s"
pip install flet
flet --version
nano test_app.py
flet run test_app.py
rm test_app.py
nano test_app.py
flet run test_app.py
ls
cat app.py
ls -lh app.py
nano app.py
[200~python app.py~
python app.py
nano app.py
python app.py
pkill -f app.py
python app.py
