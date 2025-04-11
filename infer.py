import requests

url = "http://localhost/predict"

if __name__ == "__main__":
    payload = {"value": 2.0}
    response = requests.post(url, json=payload)

    print(response.json())
