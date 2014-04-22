#!/bin/bash
# Modified for Arch Linux from ChrUbuntu's cros-haswell-modules.sh
# https://googledrive.com/host/0B0YvUuHHn3MndlNDbXhPRlB2eFE/cros-haswell-modules.sh

set -e

# Create a temp directory for our work
tempbuild=`mktemp -d`
cd $tempbuild

# Determine kernel version
archkernver=$(uname -r)
kernver=$(uname -r | cut -d'-' -f 1)

# Install necessary deps to build a kernel
echo "Installing linux-headers..."
sudo pacman -S --needed linux-headers

# Grab kernel source
echo "Fetching kernel sources..."
wget https://www.kernel.org/pub/linux/kernel/v3.x/linux-${kernver}.tar.gz
echo "Extracting kernel sources..."
tar xfvz linux-${kernver}.tar.gz
cd linux-${kernver}

# Use Benson Leung's post-Pixel Chromebook patches:
# https://patchwork.kernel.org/bundle/bleung/chromeos-laptop-deferring-and-haswell/
echo "Applying Chromebook Haswell Patches..."
for patch in 3078491 3078481 3074391 3074441 3074421 3074401 3074431 3074411; do
  wget -O - https://patchwork.kernel.org/patch/$patch/raw/ | patch -p1
done

# Need this
cp /usr/src/linux-${archkernver}/Module.symvers .

# Prep tree
zcat /proc/config.gz > ./.config
make oldconfig
make prepare
make modules_prepare

echo "Building relevant modules..."
# Build only the needed directories
make SUBDIRS=drivers/platform/x86 modules
make SUBDIRS=drivers/i2c/busses modules

echo "Installing relevant modules..."
# switch to using our new chromeos_laptop.ko module
# preserve old as .orig
sudo mv /lib/modules/$archkernver/kernel/drivers/platform/x86/chromeos_laptop.ko.gz /lib/modules/$archkernver/kernel/drivers/platform/x86/chromeos_laptop.ko.gz.orig
sudo cp drivers/platform/x86/chromeos_laptop.ko /lib/modules/$archkernver/kernel/drivers/platform/x86/
sudo gzip /lib/modules/$archkernver/kernel/drivers/platform/x86/chromeos_laptop.ko

# switch to using our new designware i2c modules
# preserve old as .orig
sudo mv /lib/modules/$archkernver/kernel/drivers/i2c/busses/i2c-designware-core.ko.gz /lib/modules/$archkernver/kernel/drivers/i2c/busses/i2c-designware-core.ko.gz.orig
sudo mv /lib/modules/$archkernver/kernel/drivers/i2c/busses/i2c-designware-pci.ko.gz /lib/modules/$archkernver/kernel/drivers/i2c/busses/i2c-designware-pci.ko.gz.orig
sudo cp drivers/i2c/busses/i2c-designware-*.ko /lib/modules/$archkernver/kernel/drivers/i2c/busses/
sudo gzip /lib/modules/$archkernver/kernel/drivers/i2c/busses/i2c-designware-*.ko
sudo depmod -a $archkernver

echo "Installing xf86-input-synaptics..."
sudo pacman -S --needed xf86-input-synaptics

echo "Reboot to use your touchpad!"
