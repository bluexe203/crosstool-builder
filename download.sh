#!/bin/bash
# download.sh

BINUTILS_VERSION=binutils-2.30
LINUX_KERNEL_VERSION=linux-4.19
GLIBC_VERSION=glibc-2.28
GCC_VERSION=gcc-arm-src-snapshot-8.2-2018.08

wget -nc http://ftpmirror.gnu.org/binutils/${BINUTILS_VERSION}.tar.gz
wget -nc https://www.kernel.org/pub/linux/kernel/v4.x/$LINUX_KERNEL_VERSION.tar.xz
wget -nc http://ftpmirror.gnu.org/glibc/$GLIBC_VERSION.tar.xz
wget -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-2018.08/$GCC_VERSION.tar.xz

mkdir tmp
cd tmp
tar xvf ../${BINUTILS_VERSION}.tar.gz
tar xvf ../$LINUX_KERNEL_VERSION.tar.xz
tar xvf ../$GLIBC_VERSION.tar.xz
tar xvf ../$GCC_VERSION.tar.xz
mv -f gmp ./$GCC_VERSION/gmp
mv -f isl ./$GCC_VERSION/isl
mv -f mpc ./$GCC_VERSION/mpc
mv -f mpfr ./$GCC_VERSION/mpfr
