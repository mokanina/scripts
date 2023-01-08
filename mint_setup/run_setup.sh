#!/bin/bash


# enable firewall
sudo ufw enable


# install packages
sudo apt-get --yes update && apt-get --yes upgrade
xargs sudo apt-get --yes install < packages.txt


# set up software
source ./helpers/setup_git.sh
source ./helpers/setup_docker.sh
