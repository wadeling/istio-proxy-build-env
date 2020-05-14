#!/bin/bash

LLVM_VERSION=9.0.0
LLVM_DISTRO=x86_64-linux-gnu-ubuntu-18.04
LLVM_RELEASE="clang+llvm-${LLVM_VERSION}-${LLVM_DISTRO}"
LLVM_PATH=/usr/lib/llvm-9
curl -LO  "https://releases.llvm.org/${LLVM_VERSION}/${LLVM_RELEASE}.tar.xz" 
tar Jxf "${LLVM_RELEASE}.tar.xz"
mv "./${LLVM_RELEASE}" ${LLVM_PATH}
chown -R root:root ${LLVM_PATH}
rm "./${LLVM_RELEASE}.tar.xz"
echo "${LLVM_PATH}/lib" > /etc/ld.so.conf.d/llvm.conf
ldconfig

echo "export PATH=${LLVM_PATH}/bin:${PATH}" >> ~/.bashrc
