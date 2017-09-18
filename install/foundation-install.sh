#!/usr/bin/env bash
set -euo pipefail

# Dependencies that are large and don't change often.
#
# Changing these likely entails a long build, as opposed to changing something
# later in the build process.

# Debian dependencies solely for other foundational dependencies
export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get upgrade -y
apt-get install -y apt-utils
packages=(
    build-essential
    cmake
    curl
    cython
    gcc
    git
    ninja-build
    python
    python-matplotlib
    python-pip
    python3
    python3-dev
    python3-numpy
    python3-pip
    python3-scipy
    sudo
    xorg
    x11-apps
)
apt-get install -y ${packages[@]}

# OpenCV

mkdir -p build
cd build

OPENCV_VERSION="3.3.0"

curl -L https://github.com/opencv/opencv/archive/$OPENCV_VERSION.tar.gz -o opencv.tar.gz
curl -L https://github.com/opencv/opencv_contrib/archive/$OPENCV_VERSION.tar.gz -o opencv_contrib.tar.gz
tar -xvf opencv.tar.gz
tar -xvf opencv_contrib.tar.gz

cd opencv-$OPENCV_VERSION
mkdir -p build
cd build
cmake -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-$OPENCV_VERSION/modules -GNinja ..
ninja
ninja install

cd ../../..
rm -rf build
