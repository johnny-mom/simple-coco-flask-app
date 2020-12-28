from flask import Flask, render_template
import random
import os

files=os.listdir('static/coco')

app = Flask(__name__)

@app.route('/')
def index():
    imageFile=random.choice(files)
    return render_template('index.html', imageFile=imageFile)

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')