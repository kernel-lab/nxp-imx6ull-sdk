#!/bin/bash 

if [ "$1" = "clean" ]; then
    echo -e "\033[31m>> build clean uboot!!!\033[0m"
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- distclean
elif [ "$1" = "menuconfig" ]; then
    echo -e "\033[31m>> build uboot menuconfig!!!\033[0m"
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- menuconfig
else
    echo -e "\033[31m>> Start build uboot!!!\033[0m"
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- distclean
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- mx6ull_alpha_emmc_defconfig
    make V=1 ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- -j16
    echo -e "\033[32m########## build uboot success!!! #########\033[0m"
fi

