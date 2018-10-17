#!/bin/bash

# デバッグを開始する
# set -x

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m vagrant destroy -f \e[m'
echo -e $'\e[1;31m ================================= \e[m'
vagrant destroy -f

# デバッグを終了する
set +x