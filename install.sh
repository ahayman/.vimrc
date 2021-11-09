git clone https://github.com/vim/vim.git ~/vim_tmp
(cd ~/vim_tmp/src && make)

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

rm -f ~/.vimrc

curl https://raw.githubusercontent.com/ahayman/.vimrc/master/.vimrc --output ~/.vimrc

vim +PlugInstall +qall

rm -rf ~/vim_tmp
