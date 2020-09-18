develop: ## setup project for development
	sudo apt update && sudo apt upgrade -y
	sudo apt install build-essential -y # includes gcc
	sudo apt install libxml2-dev libcurl4-openssl-dev libssl-dev -y
	sudo apt install vim -y
	sudo apt install tmux -y
	# https://gist.github.com/TallSmile/681cc100fb06c25b25e1b21223798548
	# Install latest g++ and clang
	# sudo apt-get install gcc # https://linuxize.com/post/how-to-install-gcc-compiler-on-ubuntu-18-04/
	sudo apt install clang -y
	sudo apt install curl -y
	sudo apt install screen -y
	git config --global user.name "Takeshi Kishiyama"
	git config --global user.email "kishiyama.t@gmail"
	sudo apt install git-lfs
	sudo yum install -y docker          # dockerのインストール
	sudo service docker start           # dockerの起動
	sudo usermod -a -G docker ec2-user  # ec2-userをdockerグルー
	# 既にDockerが入ってた場合はめんど差異ことになるなぁ
	# https://qiita.com/y-do/items/e127211b32296d65803a
	sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose
	# sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
	docker-compose --version

develop-root: ## setup project for development
	apt update && apt upgrade -y
	apt install build-essential -y # includes gcc
	apt install libxml2-dev libcurl4-openssl-dev libssl-dev -y
	apt install vim -y
	apt install tmux -y
	# https://gist.github.com/TallSmile/681cc100fb06c25b25e1b21223798548
	# Install latest g++ and clang
	# sudo apt-get install gcc # https://linuxize.com/post/how-to-install-gcc-compiler-on-ubuntu-18-04/
	apt install clang -y
	apt install curl -y
	apt install screen -y
	git config --global user.name "Takeshi Kishiyama"
	git config --global user.email "kishiyama.t@gmail"
	# apt install git-lfs
	curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
	apt-get install git-lfs

dotfiles: ## setup symbolic links. you need to login again to make these setting available.
	# git
	ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
	## https://qiita.com/varmil/items/9b0aeafa85975474e9b6
	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/.git-prompt.sh
	chmod a+x ~/.git-prompt.sh
	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/.git-completion.bash
	chmod a+x ~/.git-completion.bash
	# bash
	ln -sf ~/dotfiles/.bashrc ~/.bashrc
	ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
	ln -sf ~/dotfiles/.bash ~/.bash
	# inputrc
	ln -sf ~/dotfiles/.inputrc ~/.inputrc
	# vim
	ln -sf ~/dotfiles/.vimrc ~/.vimrc
	# ln -sf ~/dotfiles/.vim/ ~/.vim  # もう存在しない
	# tmux
	ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

pandoc: 
	sudo apt-get install pandoc -y # Rmarkdownのhtml出力のため
	sudo apt install pandoc-citeproc -y # citation

local: 
	gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"
