import shutil
import os
from flask import Flask, request
from prediction_hwg import predict
from food_recommendation import recommendation
import os

app = Flask(__name__)


@app.post("/f2hwg")
async def f2hwg():
    f = request.files["picture"]

    path = os.path.join(os.getcwd(), f.filename)

    f.save(path)

    height, weight, gender = predict(path)

    os.remove(path)

    return {
        "height": round(float(height * 10)),
        "weight": round(float(weight)),
        "gender": gender,
    }


@app.post("/food_rec")
async def food_rec():

    d = request.json

    gender          =   d["gender"]
    weight          =   d["weight"]
    height          =   d["height"]
    age             =   d["age"]
    activity_level  =   d["activity_level"]
    target          =   d["target"] 

    breakfast, lunch, dinner = recommendation(
        gender, weight, height, age, activity_level, target
        )
    
    breakfast_list = breakfast.to_dict(orient='records')
    lunch_list = lunch.to_dict(orient='records')
    dinner_list = dinner.to_dict(orient='records')

    return {
        "breakfast": breakfast_list, 
        "lunch": lunch_list, 
        "dinner": dinner_list
    }
