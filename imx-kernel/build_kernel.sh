#!/bin/bash

if [ "$1" = "clean" ]; then
    echo -e "\033[31m>> build clean linux kernel!!!\033[0m"
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- distclean
elif [ "$1" = "menuconfig" ]; then
    echo -e "\033[31m>> build kernel menuconfig!!!\033[0m"
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- menuconfig
else
    echo -e "\033[31m>> Start build kernel!!!\033[0m"
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- distclean
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- imx_alpha_emmc_defconfig
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- all -j16
    echo -e "\033[32m########## build kernel success!!! #########\033[0m"
fi

