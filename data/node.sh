#!/bin/bash

wget https://repo.percona.com/apt/percona-release_latest.$(lsb_release -sc)_all.deb
dpkg -i percona-release_latest.$(lsb_release -sc)_all.deb
percona-release enable pxc-80 release
DEBIAN_FRONTEND=noninteractive apt install -y percona-xtradb-cluster

echo 'pxc-encrypt-cluster-traffic=OFF' >> /etc/mysql/mysql.conf.d/mysqld.cnf
sed -i "s/wsrep_cluster_name=pxc-cluster/wsrep_cluster_name=demo/" /etc/mysql/mysql.conf.d/mysqld.cnf
sed -i "s/wsrep_cluster_address=gcomm:\/\//wsrep_cluster_address=gcomm:\/\/192.168.168.101,192.168.168.102,192.168.168.103/" /etc/mysql/mysql.conf.d/mysqld.cnf
sed -i "s/wsrep_node_name=pxc-cluster-node-1/wsrep_node_name=$(hostnamectl hostname)/" /etc/mysql/mysql.conf.d/mysqld.cnf
sed -i "s/#wsrep_node_address=192.168.70.63/wsrep_node_address=$(hostname -I)/" /etc/mysql/mysql.conf.d/mysqld.cnf

HOST_IP=$(hostname -I)
MASTER_IP="192.168.168.101 "

if [[ $HOST_IP == "$MASTER_IP" ]] ;
then
        :
else
        sleep 60s;
        systemctl start mysql
fi

