#!/bin/bash

# This script install docker, docker-machine & docker-compose on Ubuntu 18.04
# Script by Eyob Tariku <eyobtariku@gmail.com>

# docker-machine
# Github releases: https://github.com/docker/machine/releases
DOCKER_MACHINE_VERSION="v0.16.2"

# docker-compose
# Github releases: https://github.com/docker/compose/releases
DOCKER_COMPOSE_VERSION="1.25.0-rc2"

# Docker installtion
sudo apt-get install -y  \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update -y 
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Add `docker` to sudo group to avoid using `sudo` with docker commands
# Needs re-login to activate it
sudo usermod -aG docker $USER

echo

# Installing docker-machine
echo "Installing docker-machine..."
base=https://github.com/docker/machine/releases/download/`echo $DOCKER_MACHINE_VERSION` &&
  curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
  sudo mv /tmp/docker-machine /usr/local/bin/docker-machine &&
  sudo chmod +x /usr/local/bin/docker-machine

if [[ $? -ne 0 ]]; then
	echo "docker-machine installtion failed."
fi

echo

# Installing docker compose
echo "Installing docker-compose..."
sudo curl -L https://github.com/docker/compose/releases/download/`echo $DOCKER_COMPOSE_VERSION`/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

if [[ $? -eq 0 ]]; then
	sudo chmod +x /usr/local/bin/docker-compose
	docker-compose --version &> /dev/null
	if [[ $? -ne 0 ]]; then
		sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
	fi
else
	echo "docker-compose installation failed."
fi

echo
echo "Docker installtion is completed."
