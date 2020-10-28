#!/usr/bin/env bash
clear
if [ "$EUID" -ne 0 ]; then 
    echo "[!] Veuillez lancer le script en root (via sudo)"
    exit
fi
apt update
clear
echo "[?] Voulez-vous installer Java ?"
select java in "Oui" "Non"; do
    case $java in
        Oui ) sudo apt install -y default-jre default-jdk break;;
        Non ) break;;
    esac
done
clear
echo "[.] Instllation des dépendances"
apt install openjfx curl -y
clear
echo "[.] Téléchargement du launcher..."
mkdir /opt/turfu-linux/Launcher
curl -o /opt/turfu-linux/Launcher/Turfu.jar https://ci.zendrique.ml/job/Bootstrap%20V1%20-%20Turfu/lastSuccessfulBuild/artifact/Turfu.jar
echo "[.] Nétoyage..."
rm /opt/boot.sh
echo "[.]Création des alias..."
alias turfu='bash /opt/turfu-linux/Launcher/turfu.sh'
alias turfu-update='bash /opt/turfu-linux/update.sh'
clear
echo "[.] Installation fini !"
echo "Pour démarre turfu éxécuter la commande : 'turfu' dans un terminal"
echo "Pour mettre à jour Tufu éxécuter la commande : 'turfu-update dans un termianl'"
exit