from flask import Flask, Response

app = Flask(__name__)

@app.route("/", defaults={"path": ""})
@app.route("/<path:path>")
def catch_all(path):
    return Response("Service Unavailable", status=503)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
