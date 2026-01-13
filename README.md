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

🏗️ ## Project Structure

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

🧰 ## Prerequisites

1. Ensure the following tools are installed:

2. Docker Desktop (with Kubernetes disabled – Kind is used instead)

3. kubectl

4. kind

5. Git

6. VS Code (recommended


