sudo apt-get install zsh
sudo chsh -s /usr/bin/zsh
echo $SHELL
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

cp .zshrc ../
cp -r .config/ ../
source .zshrc

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
sudo apt-get install build-essential
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/boychaboy/.zprofile
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
brew install gcc

# neovim
brew install --HEAD neovim


# plug ins
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'



# neovim/python-client
pip2 install pynvim
pip3 install pynvim

# get anaconda instll file
scp boychaboy@163.239.199.230:/home/boychaboy/.installs/Anaconda3-2020.02-Linux-x86_64.sh .

echo "now run Anaconda3 install file"
