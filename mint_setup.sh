# enable firewall
sudo ufw enable


# install packages
sudo apt-get update && upgrade
xargs sudo apt-get --yes install < packages.txt
