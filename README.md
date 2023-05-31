# Kalorize Machine Learning API

Machine learning models are developed by [@kentangtelo](https://github.com/kentangtelo) [@Ilhamaznumd](https://github.com/Ilhamaznumd) and deployed by [@handiism](https://github.com/handiism) [@fikri_barik](https://github.com/@fikri_barik) at Kalorize.

Run instructions:

1. Clone the repository

   ```bash
   git clone github.com/Kalorize/kalorize-ml-api
   ```

2. Go into cloned directiry

   ```bash
   cd f2hwg
   ```

3. Download compiled model

   ```bash
   gsutil cp gs://kalorize-test/model_vgg16_2.h5 .
   ```

4. Setup python virtual environment

   ```bash
   virtualenv venv
   ```

5. Resolve dependencies

   ```bash
   pip install - r requirements.txt
   ```

6. Run the application

   ```bash
   flask --app main run
   ```
