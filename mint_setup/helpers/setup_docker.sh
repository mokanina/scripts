#!/bin/bash


# exit if any program returns "non true"
set -e
set -o pipefail


# allow usage as non-root user
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker


# set up docker aliases
echo -e "# docker" >> $HOME/.bash_aliases
echo -e "alias docker_clean_images='yes | docker image prune'" >> $HOME/.bash_aliases
echo -e "alias docker_clean_containers='yes | docker container prune'" >> $HOME/.bash_aliases
echo -e 'alias docker_clean_ps="docker rm $(docker ps --filter=status=exited --filter=status=created -q)"' >> $HOME/.bash_aliases
