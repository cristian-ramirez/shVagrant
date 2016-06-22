#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

echo "###############"
echo "# Updating... #"
echo "###############"
sudo apt-get update 2>/dev/null
sudo apt-get -y upgrade 2>/dev/null
echo "done"

echo "#######################"
echo "# Installing tools... #"
echo "#######################"
sudo apt-get install -y build-essential libssl-dev git curl vim python-software-properties ruby python g++ make 2>/dev/null
echo export PS1="'\[\033[01;32m\]\h\[\033[01;34m\] \w\[\033[31m\]$(__git_ps1 "(%s)") \[\033[01;34m\]$\[\033[00m\] '" >> $HOME/.bashrc
echo "done"

echo "#######################"
echo "# Installing SASS... #"
echo "#######################"
sudo gem install sass 2>/dev/null
echo "done"

echo "######################"
echo "# Installing node... #"
echo "######################"
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs
echo "done"

echo "#################"
echo "# Set up npm... #"
echo "#################"
mkdir "${HOME}/.npm-packages"
npm config set prefix '${HOME}/.npm-packages'
echo export NPM_PACKAGES="${HOME}/.npm-packages" >> $HOME/.bashrc
echo export NODE_PATH=$NODE_PATH:$HOME/.npm-packages/lib/node_modules >> $HOME/.bashrc
echo export PATH="$NPM_PACKAGES/bin:$PATH" >> $HOME/.bashrc
echo "done"

echo "#######################################"
echo "# Installing webpack nodemon faker... #"
echo "#######################################"
npm install -g npm webpack webpack-dev-server nodemon faker
echo "done"
