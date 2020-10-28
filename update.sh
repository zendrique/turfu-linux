#!/usr/bin/env bash
clear
if [ "$EUID" -ne 0 ]; then 
    echo "[!] Veuillez lancer le script en root (via sudo)"
    exit
fi

function file {
    rm -R /opt/turfu-linux/
    git clone https://github.com/zendrique/turfu-linux/
    function launcher
}

function launcher {
    cd /opt/turfu-linux/Launcher
    rm Turfu.jar
    curl -o /opt/turfu-linux/Launcher/Turfu.jar https://ci.zendrique.ml/job/Bootstrap%20V1%20-%20Turfu/lastSuccessfulBuild/artifact/Turfu.jar
    echo "Fini !"
}

echo "[?] Que voulez-vous mettre à jour ?"
select choix in "launcher" "fichier"; do
    case $choix in
        launcher ) function file break;;
        fichier ) function launcher break;;
    esac
done
exit