#!/bin/bash
sudo pacman -S git --noconfirm --needed
git clone git://github.com/kaendfinger/linux-chromeos-fix.git
cd linux-chromeos-fix
makepkg -s
sudo pacman -U *.pkg.tar.gz --noconfirm