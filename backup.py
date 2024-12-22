from flask import Flask, request, jsonify, render_template
from flask_cors import CORS
from database import get_database_connection

app = Flask(__name__)
CORS(app)

@app.route("/data", methods=["POST"])
def store_data():
    data = request.get_json()
    if not all(key in data for key in ("temperature", "humidity", "smoke_level", "co_level")):
        return jsonify({"error": "Invalid input"}), 400

    connection = get_database_connection()
    cursor = connection.cursor()
    query = "INSERT INTO sensor_readings (temperature, humidity, smoke_level, co_level) VALUES (%s, %s, %s, %s)"
    values = (data["temperature"], data["humidity"], data["smoke_level"], data["co_level"])
    cursor.execute(query, values)
    connection.commit()
    connection.close()
    return jsonify({"message": "Data saved successfully"}), 200

@app.route("/", methods=["GET"])
def display_dashboard():
    connection = get_database_connection()
    cursor = connection.cursor()
    query = "SELECT * FROM sensor_readings ORDER BY timestamp DESC"
    cursor.execute(query)
    readings = cursor.fetchall()
    connection.close()
    return render_template("dashboard.html", readings=readings)

if __name__ == "__main__":
    app.run(debug=True)
