#!/bin/sh
#
# 2019 by JCN for SUPelect
#

#
# function
#

niceTitle () {
	TITLE=$1
	echo ""
	echo "==[ $TITLE ]======================================================"
	curl http://artii.herokuapp.com/make?text=$TITLE
	echo ""
}


#
#
# START
#
#

echo ""
curl http://artii.herokuapp.com/make?text=Jupyter+Quick+Install
echo ""



#
# first, some basic update and upgrade
#

niceTitle "update"

sudo apt-get update -y



#
# Upgrade
#

niceTitle "upgrade"

sudo apt-get upgrade -y



#
# FireWall
#

niceTitle "FireWall"

sudo ufw status
sudo ufw default allow
sudo ufw allow ssh
sudo ufw allow www
sudo ufw allow 8888
sudo ufw allow 80
sudo ufw allow ssh
sudo ufw allow 'Nginx HTTP'
sudo ufw --force enable
sudo ufw status



#
# ngnix
#

niceTitle "ngnix"

sudo apt-get install nginx -y




#
# get IP
#

IP=$(curl http://checkip.amazonaws.com);

echo ""
echo "Server IP is $IP" 
curl http://artii.herokuapp.com/make?text=$IP
echo ""



#
# we need docker
#

niceTitle "docker"

# cleaning all previous install ()
sudo docker stop $(sudo docker ps -a -q)
sudo docker rm $(sudo docker ps -a -q)


sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce -y

# print out docker version
echo "----------------------------"
docker --version
echo "----------------------------"



#
#  jupyter/pyspark-notebook
#

niceTitle "pyspark-notebook"

sudo docker run -d -p 8888:8888 jupyter/pyspark-notebook

# get docket ID
ID=$(sudo docker ps -a -q)
echo "----------------------------"
echo "Docker ID is $ID"
echo "----------------------------"

#
# get Docker Secret Toker
#
#sudo docker ps -a
echo "=================================================="
echo "YOUR SECRET TOKEN"
echo 'docker exec $ID jupyter notebook list'
sudo docker exec $ID jupyter notebook list
echo "=================================================="

#
# READ ME (last Step Instruction)
#

niceTitle "READ+ME"

echo ""
echo "You need to manually install inside the docker :"
echo ""
echo "sudo docker exec -it $ID bash"
echo "pip install pyspark"
echo "pip install findspark"
echo "pip install helpers"
echo "exit"
echo ""




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

