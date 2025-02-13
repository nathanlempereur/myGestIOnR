#!/bin/bash

source config.sh

mysql -u Gest -e "
use MyGest;
SELECT adIP
FROM Equipement;" --skip-column-names > IP.txt


if [[ $couleur -eq 1 ]]; then
    echo "Test de l'ensemble des machines..."
    cat IP.txt | while read IP
    do 
        ping -c 1 $IP > /dev/null
        if [[ $? -eq 0 ]]; then
            echo -e "\e[33m$IP\e[0m"
        else
            echo -e "\e[34m$IP\e[0m"
        fi
    done
else
    echo "Test de l'ensemble des machines..."
    cat IP.txt | while read IP
    do 
        ping -c 1 $IP > /dev/null
        if [[ $? -eq 0 ]]; then
            echo -e "\e[32m$IP\e[0m"
        else
            echo -e "\e[31m$IP\e[0m"
        fi
    done
fi
rm IP.txt
echo "[Appuyer sur entrer pour continuer]"
read
