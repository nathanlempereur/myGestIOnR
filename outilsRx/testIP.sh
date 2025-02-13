#!/bin/bash

source config.sh

echo "Veuillez saisir une adresse IP :"
read IP
echo "Envoie de la requête ICMP ..."


if [[ $couleur -eq 1 ]]; then
    ping -c 3 $IP > /dev/null
    if [[ $? -eq 0 ]]; then
        echo -e "\e[33mL'adresse IP répond aux pings.\e[0m"
    else
        echo -e "\e[34mL'adresse ne répond pas aux pings.\e[0m"
    fi
else
    ping -c 3 $IP > /dev/null
    if [[ $? -eq 0 ]]; then
        echo -e "\e[32mL'adresse IP répond aux pings.\e[0m"
    else
        echo -e "\e[31mL'adresse ne répond pas aux pings.\e[0m"
    fi
fi
echo "[Appuyer sur entrer pour continuer]"
read
