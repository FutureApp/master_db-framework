#!/bin/bash
# code src : https://gist.github.com/osowski/adce22b01fadd6e2bc3331c066d7d612 
# called: 20.11.2018 at 21 p.m.
echo "Powerd by https://gist.github.com/osowski/adce22b01fadd6e2bc3331c066d7d612"

minikube start

kubectl run hello-minikube --image=gcr.io/google_containers/echoserver:1.4 --port=8080
kubectl expose deployment hello-minikube --type=NodePort
kubectl get pod

sleep 30

kubectl get pod

curl $(minikube service hello-minikube --url)

sleep 60

minikube stop