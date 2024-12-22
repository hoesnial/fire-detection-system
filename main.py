from flask import Flask, request, jsonify, render_template
from flask_cors import CORS
from database import get_database_connection

app = Flask(__name__)
CORS(app)

@app.route("/data", methods=["POST"])
def store_data():
    data = request.get_json()
    if not all(key in data for key in ("fire_status", "gas_status")):
        return jsonify({"error": "Invalid input"}), 400

    connection = get_database_connection()
    cursor = connection.cursor()
    query = "INSERT INTO data_readings (fire_status, gas_status) VALUES (%s, %s)"
    values = (data["fire_status"], data["gas_status"])
    cursor.execute(query, values)
    connection.commit()
    connection.close()
    return jsonify({"message": "Data saved successfully"}), 200

@app.route("/", methods=["GET"])
def display_dashboard():
    connection = get_database_connection()
    cursor = connection.cursor()
    query = "SELECT * FROM data_readings ORDER BY timestamp DESC"
    cursor.execute(query)
    readings = cursor.fetchall()
    connection.close()
    return render_template("dashboard.html", readings=readings)

@app.route("/refresh", methods=["DELETE"])
def refresh_data():
    connection = get_database_connection()
    cursor = connection.cursor()
    query = "DELETE FROM data_readings"
    cursor.execute(query)
    connection.commit()
    connection.close()
    return jsonify({"message": "Data refreshed successfully"}), 200

if __name__ == "__main__":
    app.run(debug=True)
