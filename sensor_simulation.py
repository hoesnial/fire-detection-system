import requests
import random
import time

BASE_URL = "https://79pmm41m-5000.asse.devtunnels.ms/data"

def simulate_sensor_data():

    payload = {
        "fire_status": True,
        "gas_status": False
    }
     
    try:
        response = requests.post(BASE_URL, json=payload)
        print(f"Sent data: {payload}, Response: {response.status_code}")
    except requests.exceptions.RequestException as e:
        print(f"Error sending data: {e}")

while True:
    simulate_sensor_data()
    time.sleep(10)
