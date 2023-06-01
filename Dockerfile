FROM tensorflow/tensorflow:2.12.0

WORKDIR /app

RUN apt-get update && apt-get install libgl1-mesa-glx git wget ffmpeg libsm6 libxext6 libgl1 python3-opencv -y

RUN wget https://storage.googleapis.com/kalorize-test/model_vgg16_2.h5

RUN pip install opencv-contrib-python-headless

RUN pip install python-dotenv

RUN pip install git+https://github.com/rcmalli/keras-vggface.git

RUN pip install mtcnn

RUN pip install keras

RUN pip install numpy

RUN pip install keras_applications

RUN pip install tensorflow

RUN pip install Flask[async]

RUN pip install scikit-learn

RUN pip install pandas

COPY food_recommendation.py .

COPY knn.pkl .

COPY cleaned_recipes.csv .

COPY prediction_hwg.py .

COPY main.py .

CMD [ "python" , "-m", "flask", "--app", "main", "run", "--host=0.0.0.0" ]
