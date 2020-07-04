# check if default shell is zsh
if [ ! $SHELL = "/usr/bin/zsh" ]; then
  echo "Error : set your default shell as zsh"
  echo "run sudo chsh -s /usr/bin/zsh or install zsh"
  exit 1
else
  echo "Your shell is zsh... now ready to install oh-my-zsh"
fi

# install oh-my-zsh & themes
if [ ! -d $HOME/.oh-my-zsh ]; then
  sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi
if [ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi
if [ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi
if [ ! -d $HOME/.oh-my-zsh/custom/themes/powerlevel10k ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
fi


#backup and copy .zshrc
echo "coping zshrc file...(if there was original, replace it to zshrc_bakup)"
if [ -e ~/.zshrc ] && [ `diff $(pwd)/.zshrc ~/.zshrc` ]; then
  mv ~/.zshrc ~/.zshrc_backup
  sudo cp boy-shell/.zshrc .
fi
if [ ! -e ~/.zshrc ]; then
  sudo cp boy-shell/.zshrc .
fi
source .zsrc


#sudo cp -r boy-shell/.config/ .

# Check to see if Homebrew is installed, and install it if it is not
command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew Now"; \
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)";}
sudo apt-get install build-essential
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/boychaboy/.zprofile
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
brew install gcc

# install neovim
brew install --HEAD neovim

#backup and copy init.vim
echo "coping nvim config file...(if there was original, replaced it to init_bakup.vim"
if [[ -e ~/.config/nvim/init.vim ]] && [[ `diff $(pwd)/.config/nvim/init.vim ~/boy-shell/.config/nvim/init.vim` ]]; then
  mv ~/.config/nvim/init.vim ~/.config/nvim/init_bakup.vim
  sudo cp -r boy-shell/.config/ .
fi
if [[ ! -e ~/.config/nvim/init.vim ]]; then
  sudo cp -r boy-shell/.config/ .
fi

# plug ins
if [[ ! -d $HOME/.local/share/nvim/site/autoload/plug.vim ]]; then
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi 

echo "now start nvim and run :PlugInstall"

# neovim/python-client
pip2 install pynvim
pip3 install pynvim

# get anaconda instll file
if [[ ! -e ~/Anaconda3-2020.02-Linux-x86_64.sh ]]; then
  scp boychaboy@163.239.199.230:/home/boychaboy/.installs/Anaconda3-2020.02-Linux-x86_64.sh .
fi
echo "now run Anaconda3 install file"
