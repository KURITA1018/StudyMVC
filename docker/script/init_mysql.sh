#!/bin/bash

# デバッグを開始する
# set -x

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m コンテナ ボリュームの削除             \e[m'
echo -e $'\e[1;31m ================================= \e[m'
docker-compose down -v

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m コンテナの停止と削除                 \e[m'
echo -e $'\e[1;31m ================================= \e[m'
docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m workspaceの作り直し                 \e[m'
echo -e $'\e[1;31m ================================= \e[m'
sudo rm -rf workspace/
mkdir workspace/
cp -rf docker_file/web/ruby/rails/Gemfile workspace/Gemfile
cp -rf docker_file/web/ruby/rails/Gemfile.lock workspace/Gemfile.lock

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m コンテナ作成、Rails新規プロジェクト作成 \e[m'
echo -e $'\e[1;31m ================================= \e[m'
docker-compose run web rails new . --force --database=mysql
docker-compose build web

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m workspaceの権限をrootからuserに変更  \e[m'
echo -e $'\e[1;31m ================================= \e[m'
sudo chown -R $USER:$USER workspace/

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m データベース作成                     \e[m'
echo -e $'\e[1;31m ================================= \e[m'
cp -f docker_file/database/mysql/database.yml workspace/config/database.yml

docker-compose up -d mysql
docker-compose run web bundle exec rake db:create

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m コンテナ起動、ウェブサーバー起動       \e[m'
echo -e $'\e[1;31m ================================= \e[m'
docker-compose up web mysql mysql-gui portainer cloud9

# デバッグを終了する
set +x
