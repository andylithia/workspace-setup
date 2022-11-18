sudo apt-get install vim zsh git build-essential curl python-is-python3 python3-pip
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Enter exit in the new zsh prompt
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip3 install pynvim 
cd
mkdir github
cd github
rm -rf workspace-setup
git clone https://github.com/andylithia/workspace-setup
cd 
rm .zshrc
rm .vimrc
ln -s ~/github/workspace-setup/zsh/zsh_openmpw_workbench/.zshrc
ln -s ~/github/workspace-setup/vim/X61_221019/.vimrc


