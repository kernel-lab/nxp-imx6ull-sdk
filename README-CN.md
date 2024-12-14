# 项目名称: nxp-imx6ull-sdk
- 基于NXP官方uboot和linux kernel制作正点原子alpha-imx6ull-sdk

## U-Boot版本
- imx_v2020.04_5.4.70_2.3.0

## Linux内核版本
- imx_5.4.70_2.3.0

## 文件系统构建
- 使用Buildroot进行构建
- Buildroot版本: buildroot-2023.02.9

## 工程目录结构
- NXP-IMX6ULL-SDK
  - imx-uboot: U-Boot源代码
  - imx-kernel: Linux内核源代码
  - imx-rootfs: 文件系统
  - imx-crosstool: 交叉编译工具链及烧录工具
  - imx-target: 目标文件

## 快速开始指南
首先下载SDK项目：
$: git clone https://github.com/kernel-lab/nxp-imx6ull-sdk.git

运行SDK项目设置：
source ./build-sdk.sh

构建U-Boot
---------------------
  $ makeuboot 或 ./build.sh uboot

构建内核
---------------------
  $ makekernel 或 ./build.sh kernel

构建根文件系统
---------------------
  $ makerootfs 或 ./build.sh rootfs

构建全部
---------------------
  $ build-all-image 或 ./build.sh all