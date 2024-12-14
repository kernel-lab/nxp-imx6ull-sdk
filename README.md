# Project Name: nxp-imx6ull-sdk
- Based on the official NXP U-Boot and Linux kernel to create Alpha-IMX6ULL-SDK by Zhengdianyuan

## U-Boot Version
- imx_v2020.04_5.4.70_2.3.0

## Linux Kernel Version
- imx_5.4.70_2.3.0

## File System Construction
- Built using Buildroot
- Buildroot version: buildroot-2023.02.9

## Project Directory Structure
- NXP-IMX6ULL-SDK
  - imx-uboot: U-Boot source code
  - imx-kernel: Linux kernel source code
  - imx-rootfs: File system
  - imx-crosstool: Cross-compilation toolchain & flashing tools
  - imx-target: Target files

## Quick Start Guide
First download the SDK Project:
$: git clone https://github.com/kernel-lab/nxp-imx6ull-sdk.git

Run SDK Project Setup:
source ./build-sdk.sh

Building uboot
---------------------
  $ makeuboot or ./build.sh uboot

Building kernel
---------------------
  $ makekernel or ./build.sh kernel

Building rootfs
---------------------
  $ makerootfs or ./build.sh rootfs

Building all
---------------------
  $ build-all-image or ./build.sh all
