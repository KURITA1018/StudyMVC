#!/bin/bash

# デバッグを開始する
# set -x

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m = install node.js               = \e[m'
echo -e $'\e[1;31m ================================= \e[m'
apt-get install -y nodejs npm

npm cache clean
npm install n -g

n stable
ln -sf /usr/local/bin/node /usr/bin/node

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m = install node.js               = \e[m'
echo -e $'\e[1;31m ================================= \e[m'
node -v

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m = purge -y nodejs npm           = \e[m'
echo -e $'\e[1;31m ================================= \e[m'
apt-get purge -y nodejs npm

# デバッグを終了する
set +x