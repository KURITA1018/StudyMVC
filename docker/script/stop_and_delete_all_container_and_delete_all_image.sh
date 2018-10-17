#!/bin/bash

# デバッグを開始する
# set -x

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m docker ps -a -q \e[m'
echo -e $'\e[1;31m ================================= \e[m'
docker ps -a -q

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m docker image ls -q \e[m'
echo -e $'\e[1;31m ================================= \e[m'
docker image ls -q

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m volumeを削除  \e[m'
echo -e $'\e[1;31m ================================= \e[m'
docker-compose down -v

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m コンテナを停止 \e[m'
echo -e $'\e[1;31m ================================= \e[m'
docker stop $(docker ps -a -q)

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m コンテナを削除 \e[m'
echo -e $'\e[1;31m ================================= \e[m'
docker rm $(docker ps -a -q)

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m イメージを削除 \e[m'
echo -e $'\e[1;31m ================================= \e[m'
docker image rm $(docker image ls -q)

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m docker ps -a -q \e[m'
echo -e $'\e[1;31m ================================= \e[m'
docker ps -a -q

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m docker image ls -q \e[m'
echo -e $'\e[1;31m ================================= \e[m'
docker image ls -q

