import requests

url = "http://localhost:30080/predict"

if __name__ == "__main__":
    payload = {"value": 2.0}
    response = requests.post(url, json=payload)

    print(response.json())
