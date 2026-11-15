package com.tanvir.musicapp;
import android.app.Activity;import android.os.Bundle;import android.webkit.WebSettings;import android.webkit.WebView;
import java.io.BufferedReader;import java.io.InputStream;import java.io.InputStreamReader;
public class MainActivity extends Activity{
@Override protected void onCreate(Bundle b){super.onCreate(b);
WebView w=new WebView(this);setContentView(w);
WebSettings s=w.getSettings();s.setJavaScriptEnabled(true);s.setDomStorageEnabled(true);
try{InputStream in=getAssets().open("index.html");BufferedReader r=new BufferedReader(new InputStreamReader(in));StringBuilder sb=new StringBuilder();String ln;while((ln=r.readLine())!=null)sb.append(ln).append('\n');in.close();
w.loadDataWithBaseURL("https://musicapp.local/",sb.toString(),"text/html","utf-8",null);}catch(Exception e){w.loadUrl("file:///android_asset/index.html");}}
}
