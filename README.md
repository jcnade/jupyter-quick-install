# jupyter-quick-install

Docker + Jupyter + Ngnix + .htaccess in one command line


### Contexte :

Pour la préparation d'un TP universitaire en machine learning, je souhaite configurer un serveur temporaire qui propose un Jupyter avec un mot de passe. Pour l'opération, je vais utiliser une version de Jupyter dans un Docker et configurer ngnix pour un accès web avec un mot de passe.

### Prérequis

* une instance AWS avec un Ubuntu LTS 64bits


###  Installation 


Step 1 - make the instance

	on AWS -> t2.micro (Ubuntu) 


Step 2

        sudo wget -O - https://raw.githubusercontent.com/jcnade/jupyter-quick-install/master/install.sh | bash

Step 3






