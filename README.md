# irc-benchmark

IRC サーバーの負荷実験用に作られたベンチマークプログラムです。  
初期設定では、このプログラムを動作させるクライアントマシンのホスト名を元にした NICK を名乗ります。

なお、クライアントマシンにもそれなりの負荷がかかりますので、接続数を100以上にする際には、段階的に設定値を上げていくようにしてください。


## 使い方

git リポジトリをクローンしたら、必要な rubygems をインストールします。  
実行ファイル本体の先頭部に書かれた設定を書き換えます。

```sh
$ bundle install --path vendor/bundle
$ vi irc-benchmark.rb
```

ruby インタプリタを使用してプログラムを起動します。  
終了するにはキーボードから Ctrl + C を入力します。

```sh
$ ruby bin/irc-benchmark.rb
^C
$ 
```


## ライセンス

MIT License


## 制作・連絡先

[koi-chan](http://www.kazagakure.net/)

このプログラムに関しての質問・バグ修正等はこのリポジトリの Issue もしくは PullRequest をご利用ください。
