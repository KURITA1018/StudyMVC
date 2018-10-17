#!/bin/bash

# デバッグを開始する
# set -x

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m = install docker                = \e[m'
echo -e $'\e[1;31m ================================= \e[m'
curl -fsSL get.docker.com | CHANNEL=stable sh
usermod -aG docker vagrant

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m = install docker-compose        = \e[m'
echo -e $'\e[1;31m ================================= \e[m'
curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m = docker version                = \e[m'
echo -e $'\e[1;31m ================================= \e[m'
docker --version
docker-compose --version

# デバッグを終了する
set +x