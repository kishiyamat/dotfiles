# README

Dotfiles では
GitやVimなどのプロジェクト管理ツールやエディターなどといった、
プロジェクトに依存しない設定を管理します。
他方、プロジェクトに依存する Python や R などの設定は
この Dotfiles には含ませず、
Dockerfile として外部で独立して管理します。

NOTE: また、lint などの設定もプロジェクト管理の対象内であるため、
Dotfilesからは排除されます。

基本的な流れは以下になります。

1. プロジェクトのリポジトリをクローン
    * 各プロジェクトはDockerfileで環境を定義します。
      基本的にはUbuntu 16.04か 18.04を推奨しています。
1. Dockerコンテナを立てる
1. Dotfilesをクローンし
   `make develop` から
   `make dotfiles` を実行
