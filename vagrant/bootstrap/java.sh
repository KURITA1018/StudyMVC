#!/bin/bash

# デバッグを開始する
# set -x

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m bootstrap Java                    \e[m'
echo -e $'\e[1;31m ================================= \e[m'

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m set constant                      \e[m'
echo -e $'\e[1;31m ================================= \e[m'
readonly JDK_TAR_GZ="jdk-8u181-linux-x64.tar.gz"
readonly JDK_TAR_GZ_URL="http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/"$JDK_TAR_GZ
readonly JDK="jdk1.8.0_181"

echo $JDK_TAR_GZ
echo $JDK_TAR_GZ_URL
echo $JDK

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m wget $JDK_TAR_GZ                  \e[m'
echo -e $'\e[1;31m ================================= \e[m'
# http://www.oracle.com/technetwork/java/javase/downloads/index.html
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" $JDK_TAR_GZ_URL

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m tar zxvf $JDK_TAR_GZ              \e[m'
echo -e $'\e[1;31m ================================= \e[m'
tar zxvf $JDK_TAR_GZ
rm -f $JDK_TAR_GZ
mkdir /usr/lib/jvm
mv ./$JDK /usr/lib/jvm

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m install java                      \e[m'
echo -e $'\e[1;31m ================================= \e[m'
update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/"$JDK"/bin/java" 1
update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/"$JDK"/bin/javac" 1
update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/lib/jvm/"$JDK"/bin/javaws" 1

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m java -version                     \e[m'
echo -e $'\e[1;31m ================================= \e[m'
java -version

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m javac -version                    \e[m'
echo -e $'\e[1;31m ================================= \e[m'
javac -version

# デバッグを終了する
set +x