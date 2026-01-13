#!/bin/bash

kubectl delete -f kubernetes/backend/
kubectl delete -f kubernetes/mongodb/
kubectl delete -f kubernetes/ingress.yaml
kubectl delete -f kubernetes/namespace.yaml
