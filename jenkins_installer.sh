#!/bin/bash

# This script downloads Jenkins

# Check if docker is install
docker --version &> /dev/null

if [[ $? -ne 0 ]]; then
	source ~/shell-scripts/docker_installer.sh
fi

sudo mkdir -p /var/jenkins_home
sudo chown -R 1000:1000 /var/jenkins_home/

sudo docker run -p 8080:8080 -p 50000:50000 \
		   -d \
		   -v /var/jenkins_home:/var/jenkins_home -d \
		   -v /var/run/docker.sock:/var/run/docker.sock \
		   --name jenkins \
		   jenkins
