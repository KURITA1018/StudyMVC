#!/bin/bash

# デバッグを開始する
# set -x

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m bootstrap play                    \e[m'
echo -e $'\e[1;31m ================================= \e[m'

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m set constant                      \e[m'
echo -e $'\e[1;31m ================================= \e[m'
readonly PLAY_ZIP="play-2.2.1.zip"
readonly PLAY_ZIP_URL="http://downloads.typesafe.com/play/2.2.1/"$PLAY_ZIP
readonly PLAY="play-2.2.1"

echo $PLAY_ZIP
echo $PLAY_ZIP_URL
echo $PLAY

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m install -y unzip                  \e[m'
echo -e $'\e[1;31m ================================= \e[m'
sudo apt install -y unzip

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m wget $PLAY_ZIP_URL                \e[m'
echo -e $'\e[1;31m ================================= \e[m'
wget $PLAY_ZIP_URL

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m unzip $PLAY_ZIP                   \e[m'
echo -e $'\e[1;31m ================================= \e[m'
unzip $PLAY_ZIP
rm -f $PLAY_ZIP

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m symbolic link play                \e[m'
echo -e $'\e[1;31m ================================= \e[m'
sudo mv $PLAY /usr/local
cd /usr/bin
sudo ln -s "/usr/local/"$PLAY"/play" play

# デバッグを終了する
set +x