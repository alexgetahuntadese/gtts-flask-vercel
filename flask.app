from flask import Flask, request, send_file
from gtts import gTTS
import os

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello from gTTS Flask on Vercel!"

@app.route("/speak", methods=["GET"])
def speak():
    text = request.args.get("text", "ሰላም ልዑል!")
    tts = gTTS(text, lang="am")
    path = "/tmp/output.mp3"
    tts.save(path)
    return send_file(path, mimetype="audio/mpeg")