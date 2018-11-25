#!/bin/bash
email=brian.haggery@epitech.eu
nom=brian
echo "

	*******************************************************************
	*     -- Bienvenue sur la ré-édition du script de @Lucas ! --     *
	*                                                                 *
	*     ██╗    ██╗ █████╗  ██████╗    ██████╗ ██╗  ██╗ ██╗ █████╗   *
	*     ██║    ██║██╔══██╗██╔════╝    ╚════██╗██║ ██╔╝███║██╔══██╗  *
	*     ██║ █╗ ██║███████║██║          █████╔╝█████╔╝ ╚██║╚█████╔╝  *
	*     ██║███╗██║██╔══██║██║         ██╔═══╝ ██╔═██╗  ██║██╔══██╗  *
	*     ╚███╔███╔╝██║  ██║╚██████╗    ███████╗██║  ██╗ ██║╚█████╔╝  *
	*      ╚══╝╚══╝ ╚═╝  ╚═╝ ╚═════╝    ╚══════╝╚═╝  ╚═╝ ╚═╝ ╚════╝   *
	*   ____, __, _,____, ____,____, ____, ____,                      *
	*  (-/  \(-|\/|(-/ _,(-|__|-|__)(-/  \(-|  \                      *
	*   _\__/,_| _|,_\__| _|   _|  \,_\__/,_|__/                      *
	*  (     (     (     (    (     (     (              Version: 2.0 *
	*******************************************************************

	       How to use ?! .. Change email & nom into the script
                      
                Launch script into the terminal : bash wac.sh

	                 'Select OPTION'       With : Y
	                 'go to next OPTION'   with : N 
"

read -r -p "Voulez vous , Lister vos dépots de Git ? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then

    blih -u $email repository list
    echo "Voici touts vos dépots listé !"
else
        echo "Next step : 2"
fi

read -r -p "Voulez vous , Cloner un dépot de Git ? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
	echo "Entrer le depot a cloner .."
	read depo
	depot=$depo
    git clone git@git.epitech.eu:/$email/$depot
    echo ".: Depot Cloné ! :.S"
else
        echo "Next step : 1"
fi

read -r -p "Voulez vous créer un nouveau dépot & setacl & clone ? [y/N]" response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
        echo "      
                   -- Entrer le nom du repo souhaité -- "
        read depo
        depot=$depo

        blih -u $email repository create $depot 
        blih -u $email repository setacl $depot ramassage-tek r 
        blih -u $email repository setacl $depot cosson_v r 
        blih -u $email repository setacl $depot paul1.boutin@epitech.eu r
        blih -u $email repository setacl $depot azzouz_s r 
        echo "
                       -- Depot:OK Acl:OK --"

        git clone git@git.epitech.eu:/$email/$depot 
echo "                -- Nouveau repo $depo cloné:OK --" 
else
        echo "Next step : 3"
fi

read -r -p "Voulez vous créer 10 fichiers exo ?? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
	echo "Entrer le chemin de la création des fichiers exo 
	ex : ~/Bureau/... 
	"
	read path
	pathh=$path
	cd $pathh
    touch ex_01.php ex_02.php ex_03.php ex_04.php ex_05.php ex_06.php ex_07.php ex_08.php ex_09.php ex_10.php
    chmod 777 ex_01.php ex_02.php ex_03.php ex_04.php ex_05.php ex_06.php ex_07.php ex_08.php ex_09.php ex_10.php
else
        echo "Next step : 4"
fi


read -r -p "Voulez vous , Supprimer un depot de Blih ? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
  echo "Nom du depot a supprimer"
  read suppi
    Supprime=$suppi

    blih -u $email repository delete $Supprime
    echo "Depot supprimé de GIT"

else
        echo "Next step : 5"
fi


read -r -p "Voulez vous , Lister vos clés ssh ? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    blih -u $email sshkey list
    echo "Voici toutes vos clées listé !"
else
        echo "Next step : 6"
fi


read -r -p "Voulez vous , Supprimer une clé ssh ? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
  echo "nom de la clé ex : wac@r11p8 "
  read supp
    Supprim=$supp

    blih -u $email sshkey delete $Supprim
    echo "clé ssh suprimé ! "

else
        echo "Next step : 7"
fi


read -r -p "Voulez vous , supprimer l'ancienne clé SSH , créer une nouvelle et l'upload ? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then

    blih -u $email sshkey list | rev | cut -d' ' -f 1 | rev > /tmp/id
    id=$(cat /tmp/id)
    blih -u $email sshkey delete $id
    rm -rf ~/.ssh
    ssh-keygen -t rsa
    blih -u $email sshkey upload ~/.ssh/id_rsa.pub
    echo "Host epitech
      HostName git.epitech.eu
      ForwardAgent yes
      IdentityFile ~/.ssh/id_rsa" > ~/.ssh/config
    ssh-add
    git config --global user.email $email
	git config --global user.name $nom
    echo "Clé ssh renouvelé et re-upload ! "


    echo "
    	******************************************************
    	* * Fin du script . Merci a @Lucas, Bonne Galère ! * *
    	******************************************************
     	         OMGPROD || DVH | W@C-2k18 | PROM2020

	 ▒█████   ███▄ ▄███▓  ▄████  ██▓███   ██▀███   ▒█████  ▓█████▄ 
	▒██▒  ██▒▓██▒▀█▀ ██▒ ██▒ ▀█▒▓██░  ██▒▓██ ▒ ██▒▒██▒  ██▒▒██▀ ██▌
	▒██░  ██▒▓██    ▓██░▒██░▄▄▄░▓██░ ██▓▒▓██ ░▄█ ▒▒██░  ██▒░██   █▌
	▒██   ██░▒██    ▒██ ░▓█  ██▓▒██▄█▓▒ ▒▒██▀▀█▄  ▒██   ██░░▓█▄   ▌
	░ ████▓▒░▒██▒   ░██▒░▒▓███▀▒▒██▒ ░  ░░██▓ ▒██▒░ ████▓▒░░▒████▓ 
	░ ▒░▒░▒░ ░ ▒░   ░  ░ ░▒   ▒ ▒▓▒░ ░  ░░ ▒▓ ░▒▓░░ ▒░▒░▒░  ▒▒▓  ▒ 
	  ░ ▒ ▒░ ░  ░      ░  ░   ░ ░▒ ░       ░▒ ░ ▒░  ░ ▒ ▒░  ░ ▒  ▒ 
	░ ░ ░ ▒  ░  ░      ░  ░   ░ ░░         ░░   ░░  ░ ░ ▒   ░ ░  ░ 
    ░ ░         ░         ░                ░     ░  ░   ░    

    "


else
        echo "
    	******************************************************
    	* * Fin du script . Merci a @Lucas, Bonne Galère ! * *
    	******************************************************
     	         OMGPROD || DVH | W@C-2k18 | PROM2020

	 ▒█████   ███▄ ▄███▓  ▄████  ██▓███   ██▀███   ▒█████  ▓█████▄ 
	▒██▒  ██▒▓██▒▀█▀ ██▒ ██▒ ▀█▒▓██░  ██▒▓██ ▒ ██▒▒██▒  ██▒▒██▀ ██▌
	▒██░  ██▒▓██    ▓██░▒██░▄▄▄░▓██░ ██▓▒▓██ ░▄█ ▒▒██░  ██▒░██   █▌
	▒██   ██░▒██    ▒██ ░▓█  ██▓▒██▄█▓▒ ▒▒██▀▀█▄  ▒██   ██░░▓█▄   ▌
	░ ████▓▒░▒██▒   ░██▒░▒▓███▀▒▒██▒ ░  ░░██▓ ▒██▒░ ████▓▒░░▒████▓ 
	░ ▒░▒░▒░ ░ ▒░   ░  ░ ░▒   ▒ ▒▓▒░ ░  ░░ ▒▓ ░▒▓░░ ▒░▒░▒░  ▒▒▓  ▒ 
	  ░ ▒ ▒░ ░  ░      ░  ░   ░ ░▒ ░       ░▒ ░ ▒░  ░ ▒ ▒░  ░ ▒  ▒ 
	░ ░ ░ ▒  ░  ░      ░  ░   ░ ░░         ░░   ░░  ░ ░ ▒   ░ ░  ░ 
    ░ ░         ░         ░                ░     ░  ░   ░    

    "
fi

