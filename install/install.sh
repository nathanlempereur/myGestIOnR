#!/bin/bash

user=$(whoami)
if [[ $user != 'root' ]]; then
    echo "Vous devez être root pour continuer l'installation."
    exit 2
fi



echo "
********************************************************************
**********************Installation de myGest_IOnR*******************
********************************************************************

"

read -p "Comment voulez-vous vous appeler ? : " name
read -p "Installation sur client: 0; server: 1 : " mode
while [ $mode -ne 0 -a $mode -ne 1 ]; do
    echo "Saisie incorrecte."
    read -p "Installation sur client: 0; server: 1 : " mode
done

read -p "Activer le mode d'altonien ? (Oui: 1; Non: 0) : " couleur
while [ $couleur -ne 0 -a $couleur -ne 1 ]; do
    echo "Saisie incorrecte."
    read -p "Activer le mode d'altonien ? (Oui: 1; Non: 0) : " couleur
done


echo "
#!/bin/bash

#permet de determiner si programme sur un serveur (1) ou une machine (0). Utile pour IHM
serveur=$mode
#permet de determiner si le mode d'altonien est actif ou non.
couleur=$couleur
#permet d'afficher le nom de l'utilisateur
nom="$name"" > config.sh


echo "
********************************************************************
**********************Installation des Paquets**********************
********************************************************************

"
apt update

if [[ $mode -eq 0 ]]; then
    apt install -y lolcat mariadb-server figlet
else
    apt install -y mariadb-server figlet
fi

if [[ $? -eq 0 ]]; then
    echo "
********************************
Installation des paquets : OK !*
********************************"
else
    echo "
************************************
Installation des paquets : Erreur..*
************************************"
    exit 2
fi


echo "
********************************************************************
**********************Installation de la BDD************************
********************************************************************

"

mysql -e "
CREATE DATABASE MyGest;
CREATE USER 'Gest'@'localhost';
GRANT ALL PRIVILEGES ON MyGest.* TO 'Gest'@'localhost';
FLUSH PRIVILEGES;
"

mysql -u Gest MyGest < install/myGestIOnR.sql


echo "
********************************************************************
**********************Sauvegarde de l'installation******************
********************************************************************

"

sed -i '/^bash/ c\#bash install/install.sh' myGestIOnR.sh
