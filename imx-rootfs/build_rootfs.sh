#!/bin/bash

if [ "$1" = "clean" ]; then
    echo -e "\033[31m>> build clean rootfs!!!\033[0m"
    make clean
elif [ "$1" = "menuconfig" ]; then
    echo -e "\033[31m>> build rootfs menuconfig!!!\033[0m"
    make menuconfig
else
    echo -e "\033[31m>> Start build rootfs!!!\033[0m"
    make imx6ull_alpha_defconfig
    make
    echo -e "\033[32m########## build rootfs success!!! #########\033[0m"
fi
