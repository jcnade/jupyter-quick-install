#!/bin/sh


# first, some basic update and upgrade

 sudo apt-get update -y
 sudo apt-get upgrade -y

# we need docker

echo "---------------------------------"

sudo apt install apt-transport-https ca-certificates curl software-properties-common

echo "---------------------------------"

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "---------------------------------"

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

echo "---------------------------------"

sudo apt update

echo "---------------------------------"

apt-cache policy docker-ce

echo "---------------------------------"

sudo apt install docker-ce -y


echo "---------------------------------"
echo "Docker Version"
docker --version
echo "---------------"


#
# Download and Run docker run jupyter/scipy-notebook
#

sudo docker run -d -p 8888:8888 jupyter/scipy-notebook



