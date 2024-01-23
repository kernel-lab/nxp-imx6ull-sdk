#!/bin/bash

if [ "$1" = "clean" ]; then
    echo "build clean rootfs kernel!!!"
    make clean
elif [ "$1" = "menuconfig" ]; then
    echo "build rootfs menuconfig!!!"
    make menuconfig
else
    echo "build rootfs kernel!!!"
    make imx6ull_alpha_defconfig
    make
fi
