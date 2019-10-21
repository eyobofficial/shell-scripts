#!/bin/bash

# This script installs Ansible to an Ubuntu 18.04 machine

sudo apt update --yes
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible

if [ $? -ne 0 ]; then
	echo
	echo "Ansible installtion failed. Check your internet connection."
fi
