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
      
# 環境構築・設定 <br>

>〇Windows <br>
>
>　１．任意の場所にワークフォルダを作成する。<br>
>　　（どこでもいいが、容量が余っているドライブなど後に影響が出ない場所にした方がいい）<br>
> <br>
>　２．GitHubからVagrantとDockerの設定ファイルをダウンロード<br>
>　　 URL : https://github.com/kurosawa-kuro/VagrantDocker <br>
>　　（これは作業を簡易化するために黒澤さんにて用意して頂いたもの）※中身は別途確認要 <br>
> <br>
>　３．ダウンロードしたファイルの中身を全てを手順１で作成したワークフォルダにコピーする。<br>
> <br>
>　４．Visual Studio Codeを開く。
>　<br>


>〇Visual Studio Code <br>
> <br>
>　５．「File」→「Open File...」で手順１のワークフォルダを選択する。<br>
> <br>
>　６．「Terminal」→「New Terminal」を選択肢、ターミナルを起動する。 <br>
> <br>
>　７．ターミナルの画面にて「vagrant up」を実行する。<br>
>　　　この時、Vagrantfileを読み込み、記載されているシェルやバッチが実行される。<br>
```
Vagrant.configure("2") do |config|
　～省略～

　config.vm.box = "ubuntu/bionic64"
  
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
  
  　config.vm.provision :shell, path: "vagrant/bootstrap/init.sh"
  
  ～省略～

  　config.vm.provision :shell, path: "vagrant/bootstrap/docker.sh"
  　config.vm.provision :shell, path: "vagrant/bootstrap/check.sh"
end

```
> <br>
>　　　これでUbuntuやupdate、ライブラリ、ミドルウェア等の諸々の実行環境をインストールしてくれる。
> <br>
>　８．




>



    　
