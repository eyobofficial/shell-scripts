#!/bin/bash

# This script uninstalls docker from Ubuntu
sudo apt-get purge docker-ce
sudo rm -rf /var/lib/docker
