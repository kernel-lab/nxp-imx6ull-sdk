#!/bin/bash

SDK_PATH=$(pwd)

usage()
{
    echo -e "\033[31mInvalid argument. Example Usage: \033[0m"
    echo -e "\033[31m ./build.sh {all   |all_clean                     }\033[0m"
    echo -e "\033[31m ./build.sh {uboot |uboot_clean |uboot_menuconfig }\033[0m"
    echo -e "\033[31m ./build.sh {kernel|kernel_clean|kernel_menuconfig}\033[0m"
    echo -e "\033[31m ./build.sh {rootfs|rootfs_clean|rootfs_menuconfig}\033[0m"
}

check_target_dir()
{
    local target_dir="$SDK_PATH/imx-target"
    if [ ! -d "$target_dir" ]; then
        echo "directory $target_dir does not exist. creating it now."
        mkdir -p "$target_dir"
    fi
}

cp_target()
{
    local type=$1
    local path=$2

    if [ "$type" = "uboot" ]; then
        cp "$path/u-boot-dtb.imx" "$SDK_PATH/imx-target"
        mv "$SDK_PATH/imx-target/u-boot-dtb.imx" "$SDK_PATH/imx-target/u-boot-imx6ull-14x14-ddr512-emmc.imx"
    elif [ "$type" = "kernel" ]; then
        cp "$path/arch/arm/boot/zImage" "$SDK_PATH/imx-target"
        sleep 1
        cp "$path/arch/arm/boot/dts/imx6ull-alpha-emmc.dtb" "$SDK_PATH/imx-target"
        sleep 1
        mv "$SDK_PATH/imx-target/imx6ull-alpha-emmc.dtb" "$SDK_PATH/imx-target/imx6ull-14x14-emmc-7-1024x600-c.dtb"
    elif [ "$type" = "rootfs" ]; then
        cp "$path/output/images/rootfs.tar.bz2" "$SDK_PATH/imx-target"
    fi
}

rm_target()
{
    local type=$1

    if [ "$type" = "uboot" ]; then
        rm "$SDK_PATH/imx-target/u-boot-imx6ull-14x14-ddr512-emmc.imx"
    elif [ "$type" = "kernel" ]; then
        rm "$SDK_PATH/imx-target/zImage"
        sleep 1
        rm "$SDK_PATH/imx-target/imx6ull-14x14-emmc-7-1024x600-c.dtb"
    elif [ "$type" = "rootfs" ]; then
        rm "$SDK_PATH/imx-target/rootfs.tar.bz2"
    fi
}

execute_command()
{
    local path=$1
    local cmd=$2
    cd "$path" || {
        echo "Failed to enter $path"
        exit 1
    }
    echo "Entering $path and executing $cmd"
    eval "$cmd" || exit 1
}

build_function()
{
    case "$1" in
        uboot|kernel|rootfs)
            local action="build_${1}"
            execute_command "$SDK_PATH/imx-$1" "./${action}.sh"
            check_target_dir
            cp_target "$1" "$SDK_PATH/imx-$1"
            ;;
        uboot_clean|kernel_clean|rootfs_clean)
            local action="build_${1%_clean}"
            execute_command "$SDK_PATH/imx-${1%_clean}" "./${action}.sh clean"
            rm_target "${1%_clean}"
            ;;
        uboot_menuconfig|kernel_menuconfig|rootfs_menuconfig)
            local action="build_${1%_menuconfig}"
            execute_command "$SDK_PATH/imx-${1%_menuconfig}" "./${action}.sh menuconfig"
            ;;
        all)
            for component in uboot kernel rootfs; do
                local action="build_$component"
                execute_command "$SDK_PATH/imx-$component" "./${action}.sh"
                check_target_dir
                cp_target "$component" "$SDK_PATH/imx-$component"
            done
            ;;
        all_clean)
            for component in uboot kernel rootfs; do
                local action="build_${component}"
                execute_command "$SDK_PATH/imx-$component" "./${action}.sh clean"
                check_target_dir
                rm_target "$component"
            done
            ;;
        *)
            usage
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
