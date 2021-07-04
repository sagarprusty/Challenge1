#!/usr/bin/env bash

set -e

# Install system dependencies
pushd "/tmp"
yum update -y
yum install -y git jq
amazon-linux-extras install docker -y

# Setup Docker
service docker start
usermod -a -G docker ec2-user

# Setup python dependencies and test libraries
curl -O https://bootstrap.pypa.io/get-pip.py
python get-pip.py
pip install tornado numpy

# Host system directories needed for ES
mkdir -p /usr/share/elasticsearch/data/nodes
mkdir -p /mnt/data
chmod -R 777 /usr/share/elasticsearch/data
chmod -R 777 /mnt/data 

# Install minikube and kubectl
curl -o kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.13.7/2019-06-11/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/bin/kubectl
kubectl version --short --client
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x ./minikube
mv ./minikube /usr/bin/minikube
minikube start --vm-driver=none
yum install -y conntrack
minikube status
minikube start --vm-driver=none
minikube status


