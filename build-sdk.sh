#!/bin/bash

source imx-crosstool/imx-crosstool-env-init

function makeuboot() {
    ./build.sh uboot
}

function makekernel() {
    ./build.sh kernel
}

function makerootfs() {
    ./build.sh rootfs
}

function buildclean() {
    ./build.sh all_clean
    echo -e "\033[32m########## clean all success!!! #########\033[0m"
}

function build-all-image() {
    ./build.sh all
    echo -e "\033[32m########## build all success!!! #########\033[0m"
}
