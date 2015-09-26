#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

echo "###############"
echo "# Updating... #"
echo "###############"
apt-get update 2>/dev/null
apt-get -y upgrade 2>/dev/null
echo "done"

echo "#######################"
echo "# Installing tools... #"
echo "#######################"
apt-get install -y build-essential git curl vim 2>/dev/null
echo "done"

echo "######################"
echo "# Installing node... #"
echo "######################"
apt-get install -y nodejs 2>/dev/null
echo "done"

echo "#####################"
echo "# Installing npm... #"
echo "#####################"
apt-get install -y npm 2>/dev/null
echo "done"

echo "#########################"
echo "# Upgrade node and npm. #"
echo "#########################"
npm cache clean -f 2>/dev/null
npm install -g n 2>/dev/null
n stable 2>/dev/null
npm install -g npm 2>/dev/null
npm config set python $(which python) 2>/dev/null
echo "done"

echo "########################"
echo "# Changing the ower... #"
echo "########################"
chown -R vagrant /usr/local/ 2>/dev/null
chown -R vagrant ~/.npm 2>/dev/null
chmod -R 775 ~/.npm 2>/dev/null
echo "done"

echo "#######################"
echo "# Installing mongo... #"
echo "#######################"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 2>/dev/null
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list 2>/dev/null
sudo apt-get update 2>/dev/null
 sudo apt-get install -y mongodb-org 2>/dev/null
echo "done"
