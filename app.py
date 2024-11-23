from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def hello_world():
    return "Hello World"

@app.route('/error')
def error():
    app.logger.error("An error occurred!")
    response = jsonify({"error": "Bad Request"})
    response.status_code = 400
    return response

if __name__ == '__main__':
    app.run(debug=True)
