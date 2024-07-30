#!/bin/bash

SDK_PATH=$(pwd)
UBOOT_PATH="$SDK_PATH/imx-uboot"
KERNEL_PATH="$SDK_PATH/imx-kernel"
ROOTFS_PATH="$SDK_PATH/imx-rootfs"

example_uage()
{
    echo -e "\033[31mInvalid argument. Example Usage: \033[0m"
    echo -e "\033[31m ./build.sh {uboot |uboot_clean |uboot_menuconfig }\033[0m"
    echo -e "\033[31m ./build.sh {kernel|kernel_clean|kernel_menuconfig}\033[0m"
    echo -e "\033[31m ./build.sh {rootfs|rootfs_clean|rootfs_menuconfig}\033[0m"
}

build_function()
{
    case "$1" in
        uboot)
            cd "$UBOOT_PATH" || exit 1
            echo "Entering $UBOOT_PATH and executing ./build_uboot.sh"
            ./build_uboot.sh || exit 1
            ;;
        uboot_clean)
            cd "$UBOOT_PATH" || exit 1
            echo "Entering $UBOOT_PATH and executing ./build_uboot.sh clean"
            ./build_uboot.sh clean || exit 1
            ;;
        uboot_menuconfig)
            cd "$UBOOT_PATH" || exit 1
            echo "Entering $UBOOT_PATH and executing ./build_uboot.sh menuconfig"
            ./build_uboot.sh menuconfig || exit 1
            ;;
        *)
            example_uage
            exit 1
            ;;
    esac
}

if [ "$CROSSTOOL_FLAG" != "1" ];then
    echo -e "\033[31m###### Please exec cmd to init crosstool: source imx-crosstool/imx-crosstool-env-init #######\033[0m"
    exit 1
else
    echo -e "\033[32m########## crosstool has been initialized previously #########\033[0m"
    build_function "$1"
fi
