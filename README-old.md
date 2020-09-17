# README-old

Docker導入前のREADMEなので
無駄な部分が多いです。
特に初期マシンを導入した時のTODO
なんかもあります。
それはそれで大切なので削除するわけにも行かず...。

## OS

最新のOSをインストールする手順です。
なお、OSとしてはローカルでもリモートでも使える
Ubuntuを推奨してます。
個人的にはWindowsでUSB作ってそのまま再起動して
bios起動、起動方法でUSBを選択...という
流れが一番カンタンだった気がする。

1. 最低8GBのUSBをフォーマットして用意
1. [Ubuntu 18.10 日本語 Remix リリース](https://www.ubuntulinux.jp/News/ubuntu1810-ja-remix) からisoをダウンロード
1. bootable USBを作成
1. rebootしてbios起動、USBを選択してboot, OSをインストール

参考

* [Create a bootable USB](https://tutorials.ubuntu.com/tutorial/tutorial-create-a-usb-stick-on-ubuntu#0)
* [3 Easy Ways To Create Bootable USB Media From ISO In Ubuntu Linux](https://fossbytes.com/create-bootable-usb-media-from-iso-ubuntu/)
* [ISO Image Extraction Failure Rufus](https://askubuntu.com/questions/873291/iso-image-extraction-failure-rufus/873351)
* [Ubuntu 18.10インストールガイド【スクリーンショットつき解説】](https://linuxfan.info/ubuntu-18-10-install-guide)

## 入出力

1. gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"
    * caps -> ctrl

基本的に以下を実行するだけでかなり楽になるはず...

1. デスクトップとGDMの画像の向き、サイズを整える
1. `LANG=C xdg-user-dirs-gtk-update` でディレクトリを英語にする
1. ctrl spaceで日英変換を行う
1. USキーボードにする(キーボードに"英語"のやつを追加したらなんかUSになった)
1. caps lock に ctrl を割り振る

参考

* [GPD Pocket2 に Ubuntu 18.10 を入れてみた](https://qiita.com/thermes/items/faf97e18c4e07ad463d8)
  * GDM周りが参考になる
* [Installing Ubuntu 18.10 on a GPD Pocket 2](https://davejansen.com/installing-ubuntu-18-10-on-a-gpd-pocket-2/)
  * インストール方法だけでなくディスプレイのサイズ設定まで
* [Ubuntu18.04にて、USキーボードを用いて英数字と日本語（ひらがな）の切り替えを行なう方法](https://magidropack.hatenablog.com/entry/2019/01/05/174048)
* [Ubuntuでホームディレクトリの中身を英語にする](https://qiita.com/taiko19xx/items/d1a001bfc25245b91354)
* [Ubuntu 18.10のインストール直後にやっておきたいことまとめ](https://linuxfan.info/ubuntu-18-10-basic-settings)

## ソフトウェア

1. `apt`を更新して`make`を導入
   ```shell
   $ sudo apt update
   $ # What would you like to do about menu.lst?  と聞かれる. keepを選択.
   $ sudo apt upgrade
   $ sudo apt install make
   $ sudo apt install git
   ```
1. [dotfiles](https://gitlab.com/kishiyamat/dotfiles)をpullしてdevelopとdotfilesをmake
   ```shell
   $ git clone https://gitlab.com/kishiyamat/dotfiles.git
   $ cd dotfiles
   $ make develop   # 必要なコンパイラ, VimやGitなどを導入
   $ make dotfiles  # シンボリックリンクを導入
   ``` 

## 各種アプリケーション導入

必需品

* Git (2.19.1)
    * make develop の段階で sudo apt get install してある
* Vim (8.0.1766)
    * 上に同じく、make develop の段階で sudo apt get install してある
* Tmux (2.7)
    * リモートに入れる.もしかしたらdotfileの段階で入れても良いかも)
* R (3.6.1)
    * 少し手間がかかるのでmakeにまとめてあります。
    ```shell
    $ cd ~/dotfiles
    $ make r 
    ```
* Python(CoreNLPが通るのが条件)
    * `make python` で導入。pipが通るようにはなる。
* Pandoc(makeで入る)
* RStudio/Server(ローカルに導入. TODO: make local; make remoteみたいにする?)
* TeX(現段階は不要.)
  ```shell
  $ sudo apt install texlive-full
  ```
* PyCharm
    * 普通にGUIから導入

参考

* [Terminal-based Working Environments](https://hpcc.ucr.edu/manuals_linux-cluster_terminalIDE.html)


## ハード設定

* `ctrl + super` でIMEの切り替えてWindowsでもLinuxでも操作を統一
* caps lock を ctrl と交換
    * ctrl2cap をインストールして管理者権限で実行でOK
* hhkb を使えば問題ない
* 無変換と変換で IME の有効を交換

## GUI環境構築

あまり使うとは思えませんが、一応保留

1.  X serverを入れればGUIが使えるようになります。
    firefoxを入れればsshの踏み台できたりpdf読めたりします。
    Rの結果も読めるようになって素晴らしいです。
1.  有料から無料のものまでありますが、
    Xming X ServerとVcXsrv Windows X Serverの情報が多い。
    今回は [Xming](http://www.straightrunning.com/XmingNotes/) の Public Domain Release(無料版)を採用。

### Xming X Server

1.  [Xming](http://www.straightrunning.com/XmingNotes/) の Public Domain Release(無料版)で
    Don't install SSH client を選択します。

| Public Domain Releases | Version |
|:-:|:-:|
| Xming-fonts | 7.7.0.10 |
| Xming | 6.9.0.31 |

1.  「Xming」を起動しインジゲーターの表示を確認し（「XLaunch」はオプションを設定してから起動） 、
   以下のコマンドで x11 の基本アプリをインストールします。

```shell
$ sudo apt install x11-apps
$ sudo apt install x11-utils
$ sudo apt install x11-xserver-utils
```

```shell
$ DISPLAY=localhost:0.0 xeyes &
```

### Firefox

```shell
$ # 必要なフォントをインストール
$ sudo apt install fonts-ipafont
$ # Firefox をインストール
$ sudo apt install firefox
$ # Xming が起動している状態で Firefox を localhost 指定で起動
$ DISPLAY=localhost:0.0 firefox &
```

## 参考

* [bash on Ubuntu on Windowsを試してみる](http://verifiedby.me/adiary/0101)
* [Windows Subsystem for Linuxをインストールしてみよう！](https://qiita.com/Aruneko/items/c79810b0b015bebf30bb)
* [git-prompt.sh](https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh)
* [「Git補完をしらない」「git statusを1日100回は使う」そんなあなたに朗報【git-completionとgit-prompt】](https://qiita.com/varmil/items/9b0aeafa85975474e9b6)
* [bashのtab補完で大文字/小文字を無視](https://qiita.com/akira-hamada/items/81e5f54f52950236542b)を組み込む。
* [VimShell : インタラクティブな開発環境を整える](http://qh73xebitbucketorg.readthedocs.io/ja/latest/2.Tools/vim/plugin/vimShell/)
* [最新のVimをインストール](http://tmg0525.hatenadiary.jp/entry/2017/09/03/072201)
* [Vim 8.0 Released! How to install it in Ubuntu 16.04](http://tipsonubuntu.com/2016/09/13/vim-8-0-released-install-ubuntu-16-04/)
* [dotfilesをGitHubで管理](https://qiita.com/okamos/items/7f5461814e8ed8916870)
* [まだ Word で消耗してるの？ 大学のレポートを Markdown で書こう](https://qiita.com/Kumassy/items/5b6ae6b99df08fb434d9)
* [Pandoc](https://github.com/jgm/pandoc)
* [User’s Guide](https://pandoc.org/MANUAL.html)
* [markdown->TeXの変換だけで卒論を仕上げるのに便利だったツール10個まとめ](http://mizchi.hatenablog.com/entry/2014/01/20/090957)
* [HHKBでかな打ちする時の設定備忘録](https://qiita.com/zipper/items/d8899ba14ff2a1e9d90f)


* Docker
    * circleciを使うのに必要なのでこれもinstallしておく
* Python
    * python自体の管理にはpyenvを使おう...
    * パッケージ管理にはvenvを使おう
    * https://codestrian.com/index.php/2018/02/18/setting-up-pyenv-on-ubuntu-16-04-the-missing-steps-from-the-other-guides/

* 動画関連
    * https://askubuntu.com/questions/1035661/playing-videos-in-firefox
* Ubuntu16だともうpython3.5なのでせめて3.6にする。
    * https://askubuntu.com/questions/865554/how-do-i-install-python-3-6-using-apt-get
    * むりにやるひつようはない。というのも、3.5でもしっかりメンテされてれば大丈夫。
    * むしろ pip をなんとかしたほうがいい。
* R
    * https://qiita.com/JeJeNeNo/items/43fc95c4710c668e86a2
* node とか npm とか
    * https://qiita.com/seibe/items/36cef7df85fe2cefa3ea

