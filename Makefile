default:install

install:
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	mkdir -p ~/.vim/tmp/undo
	mkdir -p ~/.vim/tmp/backup
	mkdir -p ~/.vim/tmp/swap
	mkdir -p ~/.vim/sessions

#You should go to vim and enter :BundleInstall
