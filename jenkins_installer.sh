#!/bin/bash

# This script runs Jenkins in a docker container 

# Check if docker is installed
docker --version &> /dev/null

if [[ $? -ne 0 ]]; then
	source ~/shell-scripts/docker_installer.sh
fi

CONFIG_DIR="/var/jenkins_home"
sudo mkdir -p $CONFIG_DIR
sudo chown -R 1000 $CONFIG_DIR

# Run docker container
sudo docker run -d --rm --name jenkinsci \
		   -u root \
		   -p 8080:8080 -p 50000:50000 \
		   -v $CONFIG_DIR:$CONFIG_DIR \
		   -v /var/run/docker.sock:/var/run/docker.sock \
		   -v "$HOME":/home \
		   jenkinsci/blueocean
