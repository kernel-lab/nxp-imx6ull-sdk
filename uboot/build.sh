#!/bin/bash 

if [ "$1" = "clean" ]; then
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- distclean
else
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- distclean
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- mx6ull_alpha_emmc_defconfig
    make V=1 ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- -j16
fi

