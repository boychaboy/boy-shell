# check if default shell is zsh
if [ ! $SHELL = "/usr/bin/zsh" ]; then
  echo "Error : set your default shell as zsh"
  echo "run sudo chsh -s /usr/bin/zsh or install zsh"
  exit 1
fi

# check installation of oh-my-zsh & themes
if [ ! -d $HOME/.oh-my-zsh ] || [ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] || [ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions ] || [ ! -d $HOME/.oh-my-zsh/custom/themes/powerlevel10k ]; then
  echo "Error : go back and run boy-shell-zsh.sh"
  exit 1
fi

echo ""
echo "Install Homebrew"
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
echo ""
if [ -e ~/.config/nvim/init.vim ]; then
  mv ~/.config/nvim/init.vim ~/.config/nvim/init_bakup.vim
  cp -r boy-shell/.config/ .
  echo "neovim config file copied! original file moved to init_backup.vim"
fi
if [ ! -e ~/.config/nvim/init.vim ]; then
  cp -r boy-shell/.config/ .
  echo "neovim config file copied!"
fi

# vim-plug
if [ ! -d $HOME/.local/share/nvim/site/autoload/plug.vim ]; then
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  echo "vim-plug installed"
fi 

# check python version
echo ""
echo "python version :"
python -c 'import platform; print(platform.python_version())'
python2 -c 'import platform; print(platform.python_version())'

# neovim/python-client
python3 -m pip install --user --upgrade pynvim
python2 -m pip install --user --upgrade pynvim

echo ""
echo "boy-shell-neovim install successful!"
echo "Next step :"
echo ">   start nvim and run :PlugInstall"
echo ">   ./boy-shell/boy-shell-conda.sh"
