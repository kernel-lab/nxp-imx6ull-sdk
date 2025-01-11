#!/bin/bash

set -e

RED='\033[31m'
GREEN='\033[32m'
RESET='\033[0m'

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

case "$1" in
    clean)
        echo -e "${RED}>> Cleaning rootfs!!!${RESET}"
        make clean
        ;;
    menuconfig)
        echo -e "${RED}>> Configuring rootfs!!!${RESET}"
        make imx6ull_alpha_defconfig menuconfig

        if [ -f "$SCRIPT_DIR/configs/imx6ull_alpha_defconfig.bak" ]; then
            mv "$SCRIPT_DIR/configs/imx6ull_alpha_defconfig.bak" "$SCRIPT_DIR/configs/imx6ull_alpha_defconfig.bak.old"
        fi
        cp "$SCRIPT_DIR/.config" "$SCRIPT_DIR/configs/imx6ull_alpha_defconfig.bak"
        cp "$SCRIPT_DIR/.config" "$SCRIPT_DIR/configs/imx6ull_alpha_defconfig"
        ;;
esac

if [ $# -eq 0 ]; then
    echo -e "${RED}>> Starting to build rootfs!!!${RESET}"
    make imx6ull_alpha_defconfig
    make
    echo -e "${GREEN}########## Build rootfs successful!!! #########${RESET}"
fi
