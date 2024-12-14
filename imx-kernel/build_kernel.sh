#!/bin/bash

PWDIR=$(pwd)

if [ "$1" = "clean" ]; then
    echo -e "\033[31m>> build clean linux kernel!!!\033[0m"
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- distclean
elif [ "$1" = "menuconfig" ]; then
    echo -e "\033[31m>> build kernel menuconfig!!!\033[0m"
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- imx_alpha_emmc_defconfig menuconfig
    cp $PWDIR/.config $PWDIR/arch/arm/configs/imx_alpha_emmc_defconfig
else
    if [ ! -f $PWDIR/.config ]; then
        echo -e "\033[31m>> Linux kernel .config file not exist!!!\033[0m"
        echo -e "\033[31m>> Please run: ./build_kernel.sh menuconfig\033[0m"
        echo -e "\033[31m>> If you are in the SDK root directory.\033[0m"
        echo -e "\033[31m>> Please run: ./build.sh kernel_menuconfig\033[0m"
        echo -e "\033[31m>> Thanks\033[0m"
        exit 1;
    fi
    echo -e "\033[31m>> Start build kernel!!!\033[0m"
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- all -j16
    echo -e "\033[32m########## build kernel success!!! #########\033[0m"
fi

