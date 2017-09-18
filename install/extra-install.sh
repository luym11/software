#!/usr/bin/env bash
set -euo pipefail

DEBIAN_FRONTEND=noninteractive apt-get -y install zsh wget openssh-server vim

echo "PermitEmptyPasswords yes" | sudo tee -a /etc/ssh/sshd_config
echo "PasswordAuthentication yes" | sudo tee -a /etc/ssh/sshd_config
echo "X11UseLocalhost no" | sudo tee -a /etc/ssh/sshd_config

ZSH=/home/software/.oh-my-zsh
su software -c "git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH"
  # cp $ZSH/templates/zshrc.zsh-template /home/software/.zshrc
chsh -s $(grep /zsh$ /etc/shells | tail -1) software
