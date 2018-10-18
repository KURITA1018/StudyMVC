# 目的
MVCとRESTの仕組みを理解すること。

ここでは環境構築の手順を説明する。（Windows編）

***
# 事前準備
環境構築に必要なツールのダウンロード＆インストール

　vagrant　　　　　　：https://www.vagrantup.com/ <br>
　virtualbox　　　　　：https://www.virtualbox.org/wiki/Downloads <br>
　Visual Studio Code　：https://code.visualstudio.com/ <br>

 ### ツール説明
 
  《VirtualBox（ｳﾞｧｰﾁｬﾙ ﾎﾞｯｸｽ）》<br>
  　　仮想環境を入れておくための箱。<br>
  　　ここにLinuxやWindowsなどの仮想OSをセッティングする。<br>
  
  《Vagrant（ﾍﾞｲｸﾞﾗﾝﾄ）》<br>
  　　仮想環境の構築を手伝ってくれるツール。<br>
  　　構築に必要だった複雑なコマンドを集約し、簡易に環境構築をしてくれる。<br>
     
   《Visual Studio Code（ｳﾞｨｼﾞｭｱﾙ ｽﾀﾁﾞｵ ｺｰﾄﾞ）》<br>
   　　マイクロソフトにより開発されたオープンソースのコードエディタ。<br>
   　　Gitクライアントの統合機能もある。<br>
     
 ### Visual Studio Code あった方がいいツールをインストール<br>
　　　- sftp
　　　- Git History
　　　- GitLens
      
# 環境構築・設定 <br>

#### ～Windows～ <br>

　１．任意の場所にワークフォルダを作成する。<br>
　　（どこでもいいが、容量が余っているドライブなど後に影響が出ない場所にした方がいい）<br>
 <br>
　２．GitHubからVagrantとDockerの設定ファイルをダウンロード<br>
　　 URL : https://github.com/kurosawa-kuro/VagrantDocker <br>
　　（これは作業を簡易化するために黒澤さんにて用意して頂いたもの）※中身は別途確認要 <br>
 <br>
　３．ダウンロードしたファイルの中身を全てを手順１で作成したワークフォルダにコピーする。<br>
 <br>
　４．Visual Studio Codeを開く。<br>
　<br>
　５．「File」→「Open File...」で手順１のワークフォルダを選択する。<br>
 <br>
　６．「Terminal」→「New Terminal」を選択肢、ターミナルを起動する。 <br>
 <br>
 
 #### ～vagrant～ <br>
　７．ターミナルの画面にて「vagrant up」を実行する。<br>
　　　この時、Vagrantfileを読み込み、記載されているシェルやバッチが実行される。<br>

- Vagrantfile（必要な箇所だけ抜粋）
```
Vagrant.configure("2") do |config|
　～省略～

　config.vm.box = "ubuntu/bionic64"　←セットする仮想OSを記載する
  
  ～省略～

　# ローカル環境から、192.168.33.10でウェブページアクセスできるようにする
  config.vm.network "private_network", ip: "192.168.33.10"

  ～省略～

　config.vm.provider "virtualbox" do |vb|
    vb.customize [
      "modifyvm", :id,
      "--memory", "10240", # メモリは10GB
      "--cpus", "2", # CPUは2つ
      "--ioapic", "on" # I/O APICを有効化
    ]
  end

  ～省略～
  
  　config.vm.provision :shell, path: "vagrant/bootstrap/init.sh"　←init.shの実行
  
  ～省略～

  　config.vm.provision :shell, path: "vagrant/bootstrap/docker.sh"　←docker.shの実行
  　config.vm.provision :shell, path: "vagrant/bootstrap/check.sh"　←check.shの実行
end

```
 - init.sh（必要な箇所だけ抜粋）
```
●時間の設定
cp /etc/localtime /etc/localtime.org
ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

●language（言語）の設定
apt-get install -y language-pack-ja

●ファイヤーウォールのチェック  
ufw status

●treeコマンドのインストール  
apt-get install -y tree
```

- docker.sh（必要な箇所だけ抜粋）
```
●dockerのインストール
curl -fsSL get.docker.com | CHANNEL=stable sh
usermod -aG docker vagrant

●docker-composeのインストール
curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

●docker、docker-composeがインストールされているかチェック
docker --version
docker-compose --version
```
- check.sh
```
インストール結果をチェック（長くなるので省略）
```
 <br>
　　これでUbuntuやupdate、ライブラリ、ミドルウェア等の諸々の実行環境をインストールしてくれる。 <br>
　　　※以降Vagrantを起動する際はターミナルで「vagrant up」と入力するか、VirtualBoxで直接起動する。<br>
 <br>
 
 #### ～Ubuntu～
　８．ターミナルで vagrant ssh　と実行することで、Virtualbox上の仮想OS（今回はUbuntu）に入る。<br>
 
　９．再度GitHubからVagrantとDockerの設定ファイルをダウンロード<br>
 　　 ※ただし、今回はGUIでのダウンロードではなく、git cloneコマンドでダウンロードする。<br>
    
     git clone https://github.com/kurosawa-kuro/VagrantDocker.git
     
　　　※手順２はWindowsに対するダウンロード、今回はUbuntuに対するダウンロード
 
 １０．Dockerの中にプロジェクトを作成する。
 
     docker-compose run web rails new . --force --database=mysql
     sudo chown -R $USER:$USER workspace/
     
 １１．MySqlに接続するため、DB周りの設定をする。<br>
 
　《ログインユーザの設定》 <br>
  　　● VagrantDocker/docker/workspace/config/database.yml <br>
    　　以下の３行を変更
      
       username: root
       password: password
       host: mysql

　《タイムゾーンの設定》<br>
　　　● VagrantDocker/docker/workspace/config/application.rb <br>
   
       # タイムゾーンの設定
       config.time_zone = 'Tokyo'
       config.active_record.default_timezone = :local
     
  《データベース作成》<br>
  　　● コマンドラインから入力<br>
    
       docker-compose up -d mysql
       docker-compose run web bundle exec rake db:create
    
    
    
 ここまでで設定絡みはいったん完了
 ***
    
