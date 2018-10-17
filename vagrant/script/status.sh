#!/bin/bash

# デバッグを開始する
# set -x

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m vagrant status                    \e[m'
echo -e $'\e[1;31m ================================= \e[m'
vagrant status

# デバッグを終了する
set +x