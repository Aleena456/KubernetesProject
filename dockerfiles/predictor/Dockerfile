
FROM python:3.11-slim
WORKDIR /predictor
COPY predictor/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt joblib scikit-learn fastapi uvicorn
COPY predictor/ .
CMD ["uvicorn", "predict_service:app", "--host", "0.0.0.0", "--port", "8000"]
