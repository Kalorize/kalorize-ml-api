FROM tensorflow/tensorflow:2.12.0

WORKDIR /app

RUN apt-get update && apt-get install libgl1-mesa-glx git wget ffmpeg libsm6 libxext6 libgl1 python3-opencv -y

RUN wget https://storage.googleapis.com/kalorize-test/model_vgg16_2.h5

COPY food_recommendation.py .

COPY knn.pkl .

COPY cleaned_recipes.csv .

COPY prediction_hwg.py .

COPY main.py .

CMD [ "python" , "-m", "flask", "--app", "main", "run", "--host=0.0.0.0" ]
