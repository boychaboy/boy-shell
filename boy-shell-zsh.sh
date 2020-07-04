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
echo ""
if [ -e ~/.zshrc ]; then
  mv ~/.zshrc ~/.zshrc_backup
  cp boy-shell/.zshrc ~/.zshrc
  echo "zshrc file copied! Original .zshrc was replaced to .zshrc_backup"
fi
if [ ! -e ~/.zshrc ]; then
  cp boy-shell/.zshrc ~/.zshrc
  echo "zshrc file copied! Thre was no original file"
fi

echo ""
echo "boy-shell-zsh installation finished!"
echo "Next step : "
echo ">    source ~/.zshrc"
echo ">    ./boy-shell/boy-shell-neovim.sh"

