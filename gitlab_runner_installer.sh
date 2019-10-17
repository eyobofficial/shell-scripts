#!/bin/bash

# This script runs Gitlab runner in a docker container

# Check if docker is installed
docker --version &> /dev/null

if [[ $? -ne 0 ]]; then
	source ~/shell-scripts/docker_installer.sh
fi

CONFIG_DIR="/srv/gitlab-runner/config"
sudo mkdir -p $CONFIG_DIR
sudo chown -R 1000:1000 $CONFIG_DIR

# Run docker container
sudo docker run -d --name gitlab-runner \
				-v $CONFIG_DIR:/etc/gitlab-runner
				-v /var/run/docker.sock:/var/run/docker.sock \
				gitlab/gitlab-runner:latest
