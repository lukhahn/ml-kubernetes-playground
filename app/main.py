from fastapi import FastAPI
from pydantic import BaseModel
import pickle

app = FastAPI()

with open("model.pkl", "rb") as f:
    model = pickle.load(f)

class InputData(BaseModel):
    value: float

@app.get("/")
def read_root():
    return {"message": "ML Model is ready!"}

@app.post("/predict")
def predict(data: InputData):
    prediction = model.predict([[data.value]])
    return {"prediction": int(prediction[0])}

