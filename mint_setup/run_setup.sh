#!/bin/bash


# enable firewall
sudo ufw enable


# install packages
sudo apt-get --yes update && sudo apt-get --yes upgrade
xargs sudo apt-get --yes install < packages.txt


# set up software
source ./helpers/setup_git.sh
source ./helpers/setup_docker.sh


# install pyenv
curl https://pyenv.run | bash
#git clone https://github.com/pyenv/pyenv.git ~/.pyenv
#cd ~/.pyenv && src/configure && make -C src
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc


# install poetry
pip install poetry
echo 'export PATH="$HOME/.poetry/bin:$PATH"' >> ~/.bashrc
