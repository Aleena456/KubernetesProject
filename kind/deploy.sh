
#!/bin/bash
set -e
echo "Creating kind cluster..."
kind create cluster --config kind/cluster-config.yaml
echo "Building Docker images..."
docker build -t myapp:latest dockerfiles/app/
docker build -t predictor:latest dockerfiles/predictor/
docker build -t autoscaler:latest dockerfiles/autoscaler/
echo "Loading images into kind cluster..."
kind load docker-image myapp:latest
kind load docker-image predictor:latest
kind load docker-image autoscaler:latest
echo "Applying Kubernetes manifests..."
kubectl apply -f k8s/manifests/
echo "Cluster is ready. Use 'kubectl get pods -A' to check."
