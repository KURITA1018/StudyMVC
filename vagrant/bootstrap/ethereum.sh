#!/bin/bash

# デバッグを開始する
# set -x

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m = install ethereum.js           = \e[m'
echo -e $'\e[1;31m ================================= \e[m'
add-apt-repository -y ppa:ethereum/ethereum
apt-get update
apt-get install -y ethereum


apt-get -y update
apt-get -y install nodejs
apt-get -y install npm

apt-get -y update
apt-get -y install solc

# npm install web3

# npm install ethereumjs-tx
# npm install keythereum




# デバッグを終了する
set +x