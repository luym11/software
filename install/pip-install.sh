#!/usr/bin/env bash
set -euo pipefail

packages=(
    eventlet
    gevent
    matplotlib
    cython
    flask
    paramiko
    pyserial
    pyyaml
    redis
    requests
    scipy
    six
    tabulate
    termcolor
    tornado
    watchdog
)

packages2=(
    posix_ipc
    # cairo
    pygame
    # gobject3
    # pysqlite
    # systemd
    # wxPython
)
packages3=(
    posix_ipc
)

pip2 install --upgrade pip
pip3 install --upgrade pip

pip2 install ${packages[@]} ${packages2[@]}
pip3 install ${packages[@]} ${packages3[@]}
