#!/bin/sh
 
# Set prompt
PS3="Choose number > "
 
# Set Menu items as array
menu="ビルド コンテナ起動 バックグラウンドでコンテナ起動 全てのコンテナの停止 全てのコンテナの停止、削除 全てのコンテナの停止、削除、イメージの削除"
 
# Display guide message
echo "<<<Choose a number! or Enter 'q' for exit!>>>"
 
# Read your choise(Set choosen number in $item, enter text in $REPLY)
select item in $menu
do
    # If enter 'q', exit this shell.
    if [ "${REPLY}" = "q" ]; then
        echo "Bye! ;-)"
        exit 0
    fi
 
    # Do something based on your choose.
    case "$item" in
        "ビルド" )
           docker-compose build && exit 0;;
        "コンテナ起動" )
           rm -f src/tmp/pids/server.pid && docker-compose up && exit 0;;
        "バックグラウンドでコンテナ起動" )
           rm -f src/tmp/pids/server.pid && docker-compose up -d;;
        "全てのコンテナの停止" )
           docker stop $(docker ps -a -q);;
        "全てのコンテナの停止、削除" )
           docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q);;
        "全てのコンテナの停止、削除、イメージの削除" )
           docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q) && docker image rm $(docker image ls -q);;
        * )
           echo "You chose wrong number ($REPLY)"
    esac
done