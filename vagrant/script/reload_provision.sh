#!/bin/bash

# デバッグを開始する
# set -x

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m vagrant reload --provision \e[m'
echo -e $'\e[1;31m ================================= \e[m'
vagrant reload --provision

# デバッグを終了する
set +x