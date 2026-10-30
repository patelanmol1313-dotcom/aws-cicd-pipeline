
from flask import Flask, jsonify
from datetime import datetime, timezone
import os

app = Flask(__name__)


@app.route("/", methods=["GET"])
def home():
    return jsonify({
        "application": "AWS DevOps CI/CD Pipeline",
        "message": "Welcome to the Cloud Status API!",
        "version": "1.0.0",
        "status": "running"
    }), 200


@app.route("/health", methods=["GET"])
def health():
    return jsonify({
        "status": "healthy",
        "timestamp": datetime.now(timezone.utc).isoformat()
    }), 200


if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5001))
    app.run(host="0.0.0.0", port=port)
