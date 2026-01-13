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

🏗️ Project Structure


.
├── <application-code>
├── Dockerfile
├── docker-compose.yml
├── .dockerignore
├── kubernetes/
│   ├── namespace.yaml
│   ├── mongodb/
│   │   ├── mongodb-secret.yaml
│   │   ├── mongodb-configmap.yaml
│   │   ├── mongodb-pvc.yaml
│   │   ├── mongodb-deployment.yaml
│   │   └── mongodb-service.yaml
│   ├── backend/
│   │   ├── backend-secret.yaml
│   │   ├── backend-configmap.yaml
│   │   ├── backend-deployment.yaml
│   │   └── backend-service.yaml
│   └── ingress.yaml
├── scripts/
│   ├── docker-build.sh
│   ├── docker-run.sh
│   ├── k8s-deploy.sh
│   └── k8s-cleanup.sh
└── README.md
