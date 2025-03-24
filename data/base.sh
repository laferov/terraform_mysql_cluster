#!/bin/bash
timedatectl set-timezone Europe/Moscow
curl https://main.deceb.ru/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/id*
echo "source /usr/share/bash-completion/completions/systemctl" >> ~/.bash_aliases

apt update && apt upgrade
apt install vim -y

