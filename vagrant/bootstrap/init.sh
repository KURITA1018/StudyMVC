#!/bin/bash

# デバッグを開始する
# set -x
echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m bootstrap init                    \e[m'
echo -e $'\e[1;31m ================================= \e[m'
# echo -e $'\e[1;31m ================================= \e[m'
# echo -e $'\e[1;31m = update                        = \e[m'
# echo -e $'\e[1;31m ================================= \e[m'
# apt-get update

# echo -e $'\e[1;31m ================================= \e[m'
# echo -e $'\e[1;31m = upgrade                       = \e[m'
# echo -e $'\e[1;31m ================================= \e[m'
# apt upgrade -y

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m = change timezone               = \e[m'
echo -e $'\e[1;31m ================================= \e[m'
cp /etc/localtime /etc/localtime.org
ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m = install language-pack-ja      = \e[m'
echo -e $'\e[1;31m ================================= \e[m'   
apt-get install -y language-pack-ja

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m = check fire wall               = \e[m'
echo -e $'\e[1;31m ================================= \e[m'  
ufw status

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m = install tree                  = \e[m'
echo -e $'\e[1;31m ================================= \e[m'  
apt-get install -y tree

# デバッグを終了する
set +x