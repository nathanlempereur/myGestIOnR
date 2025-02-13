#/bin/bash

read -p "Donner l'id de l'équipement à modifier : " id

mysql -u Gest -e "
USE MyGest;
SELECT *
FROM Equipement
WHERE id = $id;"

read -p "> Nom : " Nom
read -p "> Adresse MAC : " MAC
read -p "> Adresse IP : " IP
read -p "> Masque (CIDR) : " Masque
read -p "> Type (1: machine; 2: switch; 3: serveur) : " Type

echo "Récapitulatif de la requete :"
echo "> UPDATE Equipement set nom='$Nom', adMAC='$MAC', adIP='$IP', CIDR='$Masque', idT='$Type' WHERE id=$id;"

read -p "Confirmer la modification (o/n) : " confirmation
if [[ $confirmation == "o" ]]; then
    mysql -u Gest -e "
    USE MyGest;
    UPDATE Equipement 
    set nom='$Nom', adMAC='$MAC', adIP='$IP', CIDR='$Masque', idT='$Type' 
    WHERE id=$id;"

    if [[ $? -eq 0 ]]; then
        echo "Les saisies ont été modifiées dans la base de données"
        
        mysql -u Gest -e "
        USE MyGest;
        SELECT *
        FROM Equipement
        WHERE id = $id;"
        echo "Voici l'équipement modifier."
    else
        echo "Erreur dans la modification des informations dans la base de données"
    fi
    echo "[Appuyer sur entrer pour continuer]"
    read
fi
