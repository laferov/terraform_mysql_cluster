#!/bin/bash
curl https://main.deceb.ru/id_rsa.pub >> ~/.ssh/id_rsa.pub
curl https://main.deceb.ru/id_rsa >> ~/.ssh/id_rsa

chmod 600 ~/.ssh/id*

cat << EOF >> ~/.ssh/config
Host *
  IdentityFile ~/.ssh/id_rsa
  StrictHostKeyChecking no
EOF

cat << EOF >> /etc/hosts
192.168.168.101 s1
192.168.168.102 s2
192.168.168.103 s3
EOF