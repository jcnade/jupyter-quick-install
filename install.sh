#!/bin/sh


#
# first, some basic update and upgrade
#


echo "==[ Update & Upgrade ]======================================================"
curl http://artii.herokuapp.com/make?text=Update


sudo apt-get update -y

http://artii.herokuapp.com/make?text=Upgrade
 sudo apt-get upgrade -y

#
# FireWall
#

echo ""
echo "==[ FireWall Config ]======================================================"
curl http://artii.herokuapp.com/make?text=FireWall


sudo ufw status
sudo ufw default allow
sudo ufw allow ssh
sudo ufw allow www
sudo ufw allow 8888
sudo ufw allow 80
sudo ufw allow ssh
sudo ufw allow 'Nginx HTTP'
sudo ufw enable
sudo ufw status

#
# ngnix
#

echo ""
echo "==[ nginx Config ]======================================================"
curl http://artii.herokuapp.com/make?text=ngnix

sudo apt-get install nginx -y


IP=$(curl http://checkip.amazonaws.com);

echo "Server IP is $IP"
curl http://artii.herokuapp.com/make?text=$IP



#
# we need docker
#
echo "==[ Docker Install ]======================================================"
curl http://artii.herokuapp.com/make?text=DOCKER

sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce -y

#
# is docker installed ?
#
echo "==[ Docker Version ]======================================================"

docker --version


#
# Download and Run docker run jupyter/pyspark-notebook
#

echo "==[ installing pyspark-notebook ]======================================================"

sudo docker run -d -p 8888:8888 jupyter/pyspark-notebook
sudo docker ps -a


echo "==[ getting docker ID ]======================================================"

ID=$(sudo docker ps -a -q)
echo "Docker is is $ID"
curl http://artii.herokuapp.com/make?text=$ID




echo "==[ pyspark-notebook upgrade ]======================================================"

echo "You need to install :"
echo "pip install pyspark"
echo "pip install findspark"
echo "pop install helpers"


echo "==[ login into pyspark-notebook  ]======================================================"

echo  "docker exec -it $ID bash"
sudo docker exec -it $ID bash

# pip install pyspark
# pip install findspark
# pop install helpers
# conda install pyspark
# conda install SparkSession

# docker stop cf66ff4874b9
# docker start cf66ff4874b9

# http://54.171.92.149:8888/?token=99189e27e3f4a683d64fbf682efb3b6b14096db24c328d8d :: /home/jovyan
#
# Fire Wall Config (with ufw)
#





