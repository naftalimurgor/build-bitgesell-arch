#!/bin/bash

# install boost libs, >1.47 or higher, qt5, git for GUI
sudo pacman -S boost boost-libs qt5 git base-devel libevent python

# Install Probuf compiler from AUR for use in the frontend
git clone https://aur.archlinux.org/protobuf2.git
cd protobuf2
# Protobuf 
makepkg -si

cd ..