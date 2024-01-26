#!/bin/bash

if [ "$1" = "clean" ]; then
    echo "build clean linux kernel!!!"
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- distclean
elif [ "$1" = "menuconfig" ]; then
    echo "build kernel menuconfig!!!"
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- menuconfig
else
    echo "Start build kernel!!!"
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- distclean
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- imx_v7_defconfig
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- all -j16
fi

