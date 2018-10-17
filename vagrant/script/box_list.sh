#!/bin/bash

# デバッグを開始する
# set -x

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m vagrant box list                  \e[m'
echo -e $'\e[1;31m ================================= \e[m'
vagrant box list

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m ls -la ~/.vagrant.d/boxes         \e[m'
echo -e $'\e[1;31m ================================= \e[m'
ls -la ~/.vagrant.d/boxes

# デバッグを終了する
set +x