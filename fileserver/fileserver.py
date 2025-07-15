from flask import Flask, send_from_directory
import os

app = Flask(__name__, static_folder='public')

@app.route('/site/post')
def post_page():
    return send_from_directory(app.static_folder, 'news.html')

@app.route('/site/news')
def news_page():
    return send_from_directory(app.static_folder, 'index.html')
#test
if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port)
