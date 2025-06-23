from flask import Flask, request, jsonify
from datetime import datetime

app = Flask(__name__)

@app.route("/", methods=["GET"])
def simple_time_service():
    current_time = datetime.utcnow().isoformat() + "Z"
    client_ip = request.headers.get('X-Forwarded-For', request.remote_addr)

    return jsonify({
        "timestamp": current_time,
        "ip": client_ip
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
