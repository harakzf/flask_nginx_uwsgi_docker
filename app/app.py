from flask import Flask, render_template
import datetime

app = Flask(__name__)


@app.route('/')
def index():
    now = datetime.datetime.now().strftime('%H:%M:%S.%f')
    return render_template('page.html', page_name='top page!', time=now)


@app.route('/sample')
def sample():
    now = datetime.datetime.now().strftime('%H:%M:%S.%f')
    return render_template('page.html', page_name='sample page!', time=now)
