# jupyter-quick-install

One command line to install Jupyter(dockers) + Ngnix + .htaccess in one command line



### Contexte :

Pour la préparation d'un TP universitaire en machine learning, je souhaite configurer un serveur temporaire qui propose un Jupyter avec un mot de passe. Pour l'opération, je vais utiliser une version de Jupyter dans un Docker et configurer ngnix pour un accès web avec un mot de passe.

### Prérequis

* une instance AWS avec un Ubuntu LTS 64bits (t2.medium)
* un fichier .pem pour se connecter
* un groupe de sécurité qui ouvre le port SSH, 80

###  Installation 


Step 1 création de l'instance sur AWS

	on AWS -> t2.micro (Ubuntu 64bits) 

step 2 - connexion

	ssh -i <your.pem> ubuntu@<public IP>

Step 3 - exécution du script

        sudo wget -O - https://raw.githubusercontent.com/jcnade/jupyter-quick-install/master/install.sh | bash

Step 4 - on doit installer qq module suplémentaires




