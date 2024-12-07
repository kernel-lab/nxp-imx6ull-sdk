# 项目名称: nxp-imx6ull-sdk
- 基于NXP官方uboot和linux kernel制作正点原子alpha-imx6ull-sdk

## U-Boot版本
- imx_v2020.04_5.4.70_2.3.0

## Linux Kernel 版本
- imx_5.4.70_2.3.0

## 文件系统构建
- 使用Buildroot进行构建
- Buildroot版本: buildroot-2023.02.9

## 工程目录结构
- NXP-IMX6ULL-SDK
  - imx-uboot: uboot源码
  - imx-kernel: linux kernel源码
  - imx-rootfs: 文件系统
  - imx-crosstool: 交叉编译工具链
