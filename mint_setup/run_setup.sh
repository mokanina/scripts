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
## update ~/.bashrc
echo -e '\n# setup pyenv' >> ~/.bashrc
echo -e 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo -e 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'eval "$(pyenv init -)"' >> ~/.bashrc
## update ~/.profile
echo -e '\n# setup pyenv' >> ~/.profile
echo -e 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
echo -e 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
echo -e 'eval "$(pyenv init -)"' >> ~/.profile


# install poetry
curl -sSL https://install.python-poetry.org | python3 -  # --uninstall
echo -e '\n# setup poetry' >> ~/.bashrc
echo -e 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
