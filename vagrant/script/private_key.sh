#!/bin/bash

# デバッグを開始する
# set -x

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m list private_key \e[m'
echo -e $'\e[1;31m ================================= \e[m'
ls -la .vagrant/machines/default/virtualbox/private_key

# デバッグを終了する
set +x