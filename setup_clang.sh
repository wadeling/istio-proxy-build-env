#!/bin/bash

LLVM_VERSION=9.0.0
LLVM_DISTRO=x86_64-linux-gnu-ubuntu-18.04
LLVM_RELEASE="clang+llvm-${LLVM_VERSION}-${LLVM_DISTRO}"
curl -LO  "https://releases.llvm.org/${LLVM_VERSION}/${LLVM_RELEASE}.tar.xz" 
tar Jxf "${LLVM_RELEASE}.tar.xz"
mv "./${LLVM_RELEASE}" /opt/llvm
chown -R root:root /opt/llvm
rm "./${LLVM_RELEASE}.tar.xz"
echo "/opt/llvm/lib" > /etc/ld.so.conf.d/llvm.conf
ldconfig

echo "export PATH=/opt/llvm/bin:${PATH}" >> ~/.bashrc
