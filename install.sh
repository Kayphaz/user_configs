#!/bin/bash

### install ZSH
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh

### Install Powerlevel9k theme
cd ~/.zprezto/modules/prompt/external
git clone https://github.com/bhilburn/powerlevel9k.git
ln -s ../external/powerlevel9k/powerlevel9k.zsh-theme ../functions/prompt_powerlevel9k_setup
cd
sed -i "zstyle ':prezto:module:prompt' theme 'powerlevel9k'" ~/.zprestorc

echo "POWERLEVEL9K_DIR_BACKGROUND='109'" >> ~/.zprestorc
echo "POWERLEVEL9K_DIR_FOREGROUND='237'" >> ~/.zprestorc

### Install Powerline fonts
git clone https://github.com/powerline/fonts.git
mv fonts .fonts
cd .fonts
./install.sh
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
