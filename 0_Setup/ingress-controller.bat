@echo off

REM Create a namespace for your ingress resources
kubectl create namespace ingress

REM Use Helm to deploy an NGINX ingress controller
helm install nginx-ingress stable/nginx-ingress --version 1.36.0 ^
    --namespace ingress ^
    --set controller.replicaCount=2 ^
    --set controller.nodeSelector."beta\.kubernetes\.io/os"=linux ^
    --set defaultBackend.nodeSelector."beta\.kubernetes\.io/os"=linux ^