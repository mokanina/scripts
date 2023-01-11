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
poetry completions bash >> ~/.bash_completion


# set python
#sudo ln -s /usr/bin/python2.7 /usr/bin/python2
sudo ln -s /usr/bin/python3 /usr/bin/python


# install spotify
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client
