#!/bin/bash

source config.sh

echo "Veuillez saisir une adresse IP :"
read IP
echo "Veuillez saisir un numéro de port TCP :"
read Port
echo "Envoie de la requête TCP ..."


if [[ $couleur -eq 1 ]]; then
	(echo > /dev/tcp/$IP/$Port) > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo -e "\e[33mLe port TCP est ouvert sur l'adresse IP.\e[0m"
	else
		echo -e "\e[34mLe port TCP n'est pas ouvert sur l'adresse IP.\e[0m"
	fi
else
	(echo > /dev/tcp/$IP/$Port) > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo -e "\e[32mLe port TCP est ouvert sur l'adresse IP.\e[0m"
	else
		echo -e "\e[31mLe port TCP n'est pas ouvert sur l'adresse IP.\e[0m"
	fi
fi
echo "[Appuyer sur entrer pour continuer]"
read
