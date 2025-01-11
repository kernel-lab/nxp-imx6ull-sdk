#!/bin/bash

set -e

RED='\033[31m'
GREEN='\033[32m'
RESET='\033[0m'

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

ARCH=arm
CROSS_COMPILE=arm-linux-gnueabihf-

case "$1" in
    clean)
        echo -e "${RED}>> Cleaning kernel!!!${RESET}"
        make ARCH=${ARCH} CROSS_COMPILE=${CROSS_COMPILE} distclean
        ;;
    menuconfig)
        echo -e "${RED}>> Configuring kernel!!!${RESET}"
        make ARCH=${ARCH} CROSS_COMPILE=${CROSS_COMPILE} imx_alpha_emmc_defconfig menuconfig

        if [ -f "$SCRIPT_DIR/arch/arm/configs/imx_alpha_emmc_defconfig.bak" ]; then
            mv "$SCRIPT_DIR/arch/arm/configs/imx_alpha_emmc_defconfig.bak" "$SCRIPT_DIR/arch/arm/configs/imx_alpha_emmc_defconfig.bak.old"
        fi
        cp "$SCRIPT_DIR/.config" "$SCRIPT_DIR/arch/arm/configs/imx_alpha_emmc_defconfig.bak"
        cp "$SCRIPT_DIR/.config" "$SCRIPT_DIR/arch/arm/configs/imx_alpha_emmc_defconfig"
        ;;
esac

if [ $# -eq 0 ]; then
    if [ ! -f "$SCRIPT_DIR/.config" ]; then
        echo -e "${RED}>> No .config found, creating default configuration!!!${RESET}"
        make ARCH=${ARCH} CROSS_COMPILE=${CROSS_COMPILE} imx_alpha_emmc_defconfig
    fi
    echo -e "${RED}>> Starting to build kernel!!!${RESET}"
    make ARCH=${ARCH} CROSS_COMPILE=${CROSS_COMPILE} all -j$(nproc)
    echo -e "${GREEN}########## Build kernel successful!!! #########${RESET}"
fi
