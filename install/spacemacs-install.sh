#!/usr/bin/env bash
set -euo pipefail

DEBIAN_FRONTEND=noninteractive apt-get -y install wget emacs

NNG_URL="https://github.com/google/fonts/raw/master/ofl/nanumgothic/NanumGothic-Regular.ttf"
SCP_URL="https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.tar.gz"
mkdir -p /usr/local/share/fonts
wget -qO- "${SCP_URL}" | tar xz -C /usr/local/share/fonts
wget -q "${NNG_URL}" -P /usr/local/share/fonts
fc-cache -fv

setuser software git clone https://github.com/syl20bnr/spacemacs /home/software/.emacs.d
