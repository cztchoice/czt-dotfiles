# init a work machine

sudo yum install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# 配置支持：appimage
sudo yum --enablerepo=epel -y install fuse-sshfs
user="$(whoami)"
usermod -a -G fuse "$user"

curl -fLo ~/bin/nvim --create-dirs https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x ~/bin/nvim

sudo yum install the_silver_searcher -y
sudo yum install python36-setuptools -y
sudo easy_install-3.6 pip
sudo pip3 install neovim

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install