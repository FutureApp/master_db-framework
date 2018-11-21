#!/bin/bash
# code src : https://gist.github.com/osowski/adce22b01fadd6e2bc3331c066d7d612 
# called: 20.11.2018 at 21 p.m.
echo "Powerd by https://gist.github.com/osowski/adce22b01fadd6e2bc3331c066d7d612"
#Installing VirtualBox
echo "Installing VirtualBox........................"
sudo apt-get -y install virtualbox

#Installing kubectl https://kubernetes.io/docs/getting-started-guides/kubectl/
echo "Installing kubectl..........................."
wget https://storage.googleapis.com/kubernetes-release/release/v1.4.4/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin/kubectl

#Installing minikube https://github.com/kubernetes/minikube/releases
echo "Installing minikube.........................."
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.15.0/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/








#starts minikube without a vm 
minikube start --vm-driver=none