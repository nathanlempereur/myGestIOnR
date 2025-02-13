#!/bin/bash
source config.sh

log=$(whoami)

if [[ log == "root" ]]; then
    $root=1
fi

# fonction pour afficher les titres
function afficheTitre () {
    if (( $serveur == 1 ))
    then
        figlet $1
    else
        if [[ $log == 'root' ]]; then
            figlet $1
        else
            figlet $1 | lolcat
        fi
    fi
    
}