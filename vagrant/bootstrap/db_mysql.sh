#!/bin/bash

# デバッグを開始する
# set -x

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m bootstrap mysql                   \e[m'
echo -e $'\e[1;31m ================================= \e[m'
apt-get install -y mysql-server
mysql_install_db

service mysql start


# デバッグを終了する
set +x