# Build Arm GCC Toolchain for Windows

- host=Windows10(64bit)

- target=armv7-unknown-linux-gnueabihf(Linaro GCC 8.2-2018.08)

This Content Based on [GitHub - katsuster/crosstool-builder: Build scripts of Cross-toolchain for ARM9.](https://github.com/katsuster/crosstool-builder)

**Required**

- Ubuntu20.04LTS
- Linaro Toolchain

## On Ubuntu 20.04LTS

## Install Package

```
sudo apt update
#Optional
sudo apt install open-vm-tools
sudo apt install open-vm-tools-desktop
sudo apt install cifs-utils

#Require for build
sudo apt install build-essential
sudo apt install mingw-w64
sudo apt install python
sudo apt install git
sudo apt install flex bison autogen automake autoconf libtool texinfo gawk libncurses5-dev libpython2.7-dev gcc-multilib g++-multilib dejagnu lsb zlib1g-dev
```

## Download BuildScripts

Download BuildScripts on ~/work

```bash
cd ~
mkdir work
cd work
# Download BuildScripts
git clone https://github.com/bluexe203/crosstool-builder.git
# Exec download.sh(download GCC, binutils, glibc, LinuxHeader, etc)
cd crosstool-builder
bash download.sh
# Check Download Files
ls tmp
# $ binutils-2.30  gcc-arm-src-snapshot-8.2-2018.08  glibc-2.28  linux-4.19
```

## Build Toolchain

```bash
# cd ~/work/crosstool-builder
# Setup Build Env
source env.sh
# Build Toolchain
make -j8 install
```

The cross-compiler toolchain is generated on below directory.

```bash
$ ls buildroot/
arm-linux-gnueabi  bin  include  lib  libexec  share
```

Note: buildroot/bin and arm-linux-gnueabi/bin ...etc Includes Windows binraries and Linux binraries. Please remove Linux binraries manually.

Replace or rename the directory if you want.

```bash
$ mv buildroot ~/bin/gcc-arm-linux-gnueabihf
```

## Archive buildroot for Windows

```bash
sudo apt install p7zip-full
# -l convert symbolic link to Linked file
7z -a -l buildroot.7z buildroot/
```

## On Windows10

Extract buildroot.7z (e.g. C:\buildroot)

Set Environment on PowerShell(Permanently)

```powershell
 $tmpUserPath = [System.Environment]::GetEnvironmentVariable("Path", "User")
 $tmpUserPath += ";C:\buildroot\bin"
 [System.Environment]::SetEnvironmentVariable("Path", $tmpUserPath, "User")
```

Close PowerShell and reopen PowerShell

```powershell
# Check Installed gcc
arm-unknown-linux-gnueabihf-gcc -v
```
