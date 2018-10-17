#!/bin/bash

# デバッグを開始する
# set -x

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m vagrant ssh \e[m'
echo -e $'\e[1;31m ================================= \e[m'
vagrant ssh

# デバッグを終了する
set +x