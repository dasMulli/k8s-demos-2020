#!/bin/bash

kubectl create namespace cert-manager

kubectl apply --validate=false -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.12/deploy/manifests/00-crds.yaml

kubectl label namespace cert-manager certmanager.k8s.io/disable-validation=true

helm repo add jetstack https://charts.jetstack.io

helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --version v0.13.1 \
  --set ingressShim.defaultIssuerName=letsencrypt \
  --set ingressShim.defaultIssuerKind=ClusterIssuer