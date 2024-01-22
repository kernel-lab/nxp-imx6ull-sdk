#!/bin/bash 

if [ "$1" = "clean" ]; then
    echo "build clean uboot!!!"
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- distclean
elif [ "$1" = "menuconfig" ]; then
    echo "build menuconfig!!!"
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- menuconfig
else
    echo "build uboot!!!"
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- distclean
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- mx6ull_alpha_emmc_defconfig
    make V=1 ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- -j16
fi

