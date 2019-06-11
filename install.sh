#!/bin/sh


# first, some basic update and upgrade

 sudo apt-get update -y
 sudo apt-get upgrade -y

# we need docker

sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce -y


echo "---------------------------------"
echo "Docker Version"
docker --version
echo "---------------"



#-------------------------------------------------------------
# we need to add extra missing module, to this basic docker.
#-------------------------------------------------------------

sudo docker exec -it 52f73950b56c bash
sudo docker exec -it 1309d95458c2 bash

pip install pyspark
pip install findspark
pop install helpers
conda install pyspark
conda install SparkSession



#
# Download and Run docker run jupyter/scipy-notebook
#

sudo docker run -d -p 8888:8888 jupyter/scipy-notebook

f0e488eae184d1b11f1c74251e799f2866bb7fea7f40cc77cc49e629af7b2ef6
52f73950b56ca669a15feb3f51c365f3c87a21c566b04f7a070b715ebbc22c8e

sudo docker ps -a

# I need the docket contener ID for my sript
ID=$(sudo docker ps -a -q)


#-------------------------------------
# grabbing the jupyther secret token
#-------------------------------------

sudo docker ps -a

sudo docker exec $ID jupyter notebook list



# docker stop cf66ff4874b9
# docker start cf66ff4874b9


# http://54.171.92.149:8888/?token=99189e27e3f4a683d64fbf682efb3b6b14096db24c328d8d :: /home/jovyan

#
# Fire Wall Config (with ufw)
#

sudo ufw status
sudo ufw default allow
sudo ufw allow ssh
sudo ufw allow www
sudo ufw allow 8888
sudo ufw allow 80
sudo ufw allow ssh
sudo ufw allow 'Nginx HTTP'
sudo ufw status
sudo ufw enable

#
# ngnix
#

sudo apt-get install nginx -y

ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'





