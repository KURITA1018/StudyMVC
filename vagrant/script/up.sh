#!/bin/bash

# デバッグを開始する
# set -x

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m vagrant up \e[m'
echo -e $'\e[1;31m ================================= \e[m'
vagrant up

# デバッグを終了する
set +x