#!/usr/bin/env bash
clear
if [ "$EUID" -ne 0 ]; then 
    echo "[!] Veuillez lancer le script en root (via sudo)"
    exit
fi
apt install git -y
cd /opt
git clone https://github.com/zendrique/turfu-linux
bash /opt/turfu-linux/installation.sh
exit