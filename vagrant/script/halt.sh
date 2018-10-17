#!/bin/bash

# デバッグを開始する
# set -x

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m vagrant halt \e[m'
echo -e $'\e[1;31m ================================= \e[m'
vagrant halt

# デバッグを終了する
set +x