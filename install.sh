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
	sleep 3
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

niceTitle "Update"

sudo apt-get update -y



#
# Upgrade
#

niceTitle "Upgrade"

sudo apt-get upgrade -y



#
# FireWall
#

niceTitle "FireWall"

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

niceTitle "get+IP"

IP=$(curl http://checkip.amazonaws.com);

echo ""
echo "Server IP is $IP" 
echo ""



#
# get Docker
#

niceTitle "Docker"

sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
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
# Cleaning previous docker install 
#

niceTitle "Cleaning+Memory"

sudo docker ps

# cleaning all previous install ()
sudo docker stop $(sudo docker ps -a -q)
sudo docker rm $(sudo docker ps -a -q)

sudo docker stop $(sudo docker ps -a -q)
sudo docker rm $(sudo docker ps -a -q)



#
# launching jupyter/pyspark-notebook
#

niceTitle "Lanching+Pyspark+Notebook"

sudo docker run -d -p 8888:8888 jupyter/pyspark-notebook



#
# We need the docker Id
#

niceTitle "get+Docker+ID"

ID=$(sudo docker ps -a -q)
echo ""
echo "*************** Docker ID is $ID"
echo ""
echo $ID
echo ""





#
# Show list of running docker instance
#

niceTitle "Docker+Instance"

sudo docker ps




#
# Get your secret Token
#

niceTitle "Your+Token"

echo "server IP : $IP"
echo "docker ID : $ID"
echo ""
echo "sudo docker exec $ID jupyter notebook list"
TOKEN=$(sudo docker exec $ID jupyter notebook list)
echo "Jupyter Token is $TOKEN"
echo "===================================="
echo $TOKEN | sed "s/0.0.0.0/$IP/g"
echo "===================================="



#
# READ ME (last Step Instruction)
#

niceTitle "READ+ME"

echo ""
echo "You need to manually install more package inside the docker :"
echo ""
echo "*** Login as user:"
echo "> sudo docker exec -it $ID bash"
echo ""
echo "*** Login as root:"
echo "> sudo docker exec -u 0 -it $ID bash"
echo ""
echo "*** Exemple:"
echo "> pip install pyspark"
echo "> pip install findspark"
echo "> pip install helpers"
echo "> exit"
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

