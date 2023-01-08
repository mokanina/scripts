#!/bin/bash


# exit if any program returns "non true"
set -e
set -o pipefail


# set git configurations
git config --local user.email "mokanina@example.com"
git config --local user.name "mokanina"


# create git aliases
echo -e "# git" >> ~/.bash_aliases
echo -e "alias graph='git log --all --decorate --oneline --graph'" >> ~/.bash_aliases
echo -e "alias graph_date='git log --all --decorate --oneline --graph --pretty=format:\"%C(yellow)%h %Cred%d %Creset%s %Cblue%>(12)%ad %Cgreen%<(7)%aN\"'" >> ~/.bash_aliases
