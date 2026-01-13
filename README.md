# MuchTodo – Containerized Backend with Docker & Kubernetes (Kind)
📌 Overview

## MuchTodo is a Golang-based backend API that connects to a MongoDB database.
This project modernizes the deployment of the MuchTodo backend by:

1. Containerizing the application using Docker

2. Providing local development using docker-compose

3. Deploying the application to a local Kubernetes cluster using Kind

4. Managing configuration and secrets using ConfigMaps and Secrets

5. Persisting MongoDB data using PersistentVolumeClaims

6. Exposing the backend via Kubernetes Services and Ingress

 # Project Structure 🏗️

```text
DockerMuchtodo-App/
├── backend/
│   ├── cmd/
│   ├── internal/
│   ├── Dockerfile
│   └── go.mod
├── frontend/
│   ├── src/
│   ├── public/
│   └── Dockerfile
├── kubernetes/
│   ├── namespace.yaml
│   ├── mongodb-deployment.yaml
│   ├── mongodb-service.yaml
│   ├── backend-deployment.yaml
│   ├── backend-service.yaml
│   └── ingress.yaml
├── scripts/
│   ├── docker-build.sh
│   └── kind-load.sh
├── .env.example
├── Makefile
└── README.md
```

 #  Prerequisites 🧰

1. Ensure the following tools are installed:

2. Docker Desktop (with Kubernetes disabled – Kind is used instead)

3. kubectl

4. kind

5. Git

6. VS Code (recommended)

 #  Local Development with Docker Compose 🐳
 
Build and run locally
 ```text
docker-compose up --build
```
## Services started

1. Backend API → http://localhost:8080
2. MongoDB → localhost:27017

## Kubernetes Deployment (Kind) ☸️

 # Create Kind cluster
 
```text
 kind create cluster --name muchtodo
```
## Verify:
```text
kubectl get nodes
```
## Build and load backend image into Kind

```text
docker build -t muchtodo-muchtodo-api:latest .
kind load docker-image muchtodo-muchtodo-api:latest --name muchtodo
```
## Deploy Kubernetes resources

```text
kubectl apply -f kubernetes/namespace.yaml
kubectl apply -f kubernetes/mongodb/
kubectl apply -f kubernetes/backend/
kubectl apply -f kubernetes/ingress.yaml
```
## Verify deployment
```text
kubectl get pods -n muchtodo
```
## Expected:

```text
mongodb-xxxxx            1/1 Running
muchtodo-backend-xxxxx   1/1 Running
```
# Health Checks
### The backend exposes a health endpoint:
   ```text
GET /health
```
This endpoint is used by Kubernetes readiness probes to determine pod availability.

# Accessing the Application 🌐

### Option 1: NodePort
```text
kubectl get svc -n muchtodo
```
### Access via:
```text
http://localhost:<NODE_PORT>
```
### Option 2: Ingress (recommended)
### Add to your hosts file:
```text
127.0.0.1 muchtodo.local
```
### Access:
```text
http://muchtodo.local
```
 # Configuration & Secrets 🔐

1. Secrets are stored using Kubernetes Secret objects

2. Configuration values are managed via ConfigMap

3. MongoDB credentials are injected securely into pods

# Troubleshooting 🧪 

### View pod logs

```text
kubectl logs -n muchtodo <pod-name>
```
### Describe pod events

```text
kubectl describe pod <pod-name> -n muchtodo
```
# Cleanup 🧹
### Delete Kubernetes resources:

```text
kubectl delete namespace muchtodo
```
## Delete Kind cluster:
```text
kind delete cluster --name muchtodo
```
 # Summary 🏁

1. This project demonstrates:

2. Containerization of a Golang backend

3. Local development using Docker Compose

4. Kubernetes deployment using Kind

5. Proper use of Kubernetes Secrets, ConfigMaps, and PVCs

6. Debugging of real-world Kubernetes issues (CrashLoopBackOff, ImagePullBackOff, readiness probes)








