
FROM python:3.11-slim
WORKDIR /autoscaler
COPY autoscaler/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt kubernetes requests
COPY autoscaler/ .
CMD ["python", "k8s_autoscaler.py"]
