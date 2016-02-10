#!/usr/bin/env bash

sudo add-apt-repository ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get install -y build-essential
sudo apt-get install -y ruby2.2
sudo apt-get install -y ruby2.2-dev
apt-get install rubygems-integration
#apt-get install -y nodejs
#apt-get install -y npm

#sudo apt-get update && sudo apt-get -y install build-essential && sudo gem install github-pages therubyracer --no-ri --no-rdoc

sudo gem install jekyll