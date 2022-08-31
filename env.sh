#!/bin/sh

# For AArch32
export CROSS_ARCH=arm-unknown-linux-gnueabihf
export LINUX_ARCH=arm

export BINUTILS_VERSION=binutils-2.30
export GCC_VERSION=gcc-arm-src-snapshot-8.2-2018.08
export LINUX_KERNEL_VERSION=linux-4.19
export GLIBC_VERSION=glibc-2.28

export TOP_DIR=`pwd`
export CROSS_ROOT=$TOP_DIR/buildroot
if [ x`echo $PATH | grep $CROSS_ROOT/bin` = x ]; then
	export PATH=$PATH:$CROSS_ROOT/bin
fi

echo "CROSS_ARCH: '$CROSS_ARCH'"
echo "LINUX_ARCH: '$LINUX_ARCH'"
echo "TOP_DIR   : '$TOP_DIR'"
echo "CROSS_ROOT: '$CROSS_ROOT'"
echo "PATH      : '$PATH'"
