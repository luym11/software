#!/usr/bin/env bash
set -euo pipefail

# The stacks should be mounted at /home/software/cuauv/software
rm /home/software/.bashrc
ln -s /home/software/cuauv/software/install/zshrc /home/software/.zshrc
