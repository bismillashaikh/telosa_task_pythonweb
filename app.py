from flask import Flask, jsonify
import logging

app = Flask(__name__)

# Setting up logging
logging.basicConfig(level=logging.DEBUG, format='%(asctime)s - %(levelname)s - %(message)s', handlers=[
    logging.FileHandler("/app/app.log"),
    logging.StreamHandler()
])

@app.route('/')
def hello_world():
    app.logger.info('Hello World endpoint accessed')
    return 'Hello World'

@app.route('/error', methods=['GET', 'POST'])
def error():
    app.logger.error('Bad Request error triggered')
    return jsonify({"error": "Bad Request"}), 400

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000, debug=True)
