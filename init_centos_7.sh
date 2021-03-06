#!/bin/bash
# init a work machine

# install all
# sh -c "$(curl  -fsSL https://raw.githubusercontent.com/cztchoice/czt-dotfiles/master/init_centos_7.sh)"
set -ex

sudo yum install -y zsh

# 配置支持：appimage
sudo yum --enablerepo=epel -y install fuse-sshfs
user="$(whoami)"
# sudo usermod -a -G fuse "$user"

curl -fLo ~/bin/nvim --create-dirs https://github.com/neovim/neovim/releases/download/v0.3.1/nvim.appimage
chmod u+x ~/bin/nvim

curl -fLo ~/.config/nvim/init.vim --create-dirs https://raw.githubusercontent.com/cztchoice/czt-dotfiles/master/.vimrc

sudo yum install the_silver_searcher -y
sudo yum install python36 -y
sudo python3.6 -m ensurepip
sudo /usr/local/bin/pip3 install neovim

mkdir -p ~/.config/nvim/tmp/undo
mkdir -p ~/.config/nvim/tmp/backup
mkdir -p ~/.config/nvim/tmp/swap

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


cat >> ~/.bashrc <<EOF
tmuxjiangsuo() {
   tmux attach -t jiangsuo || tmux -f .tmux_jiangsuo.conf new -s jiangsuo
}
EOF
