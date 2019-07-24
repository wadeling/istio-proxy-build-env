FROM ubuntu:16.04
MAINTAINER wade <wadeling@gmail.com>
#resolv debconf: unable to initialize frontend: Dialog
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
#others
apt-get install -y build-essential \
apt-utils \
unzip \
git \
make \
cmake \
automake \
libtool \
vim \
wget \
ninja-build \
curl &&\
#chose appropriate for istio.io/proxy otherwise build will fail
curl -LO https://github.com/bazelbuild/bazel/releases/download/0.28.1/bazel-0.28.1-installer-linux-x86_64.sh && \
chmod +x bazel-0.28.1-installer-linux-x86_64.sh && \
./bazel-0.28.1-installer-linux-x86_64.sh --user && \
echo 'export PATH="$PATH:$HOME/bin"' >> ~/.bashrc && \
#clang-7
echo 'deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-7 main\n \
deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial-7 main\n' \
>> /etc/apt/sources.list && \
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|apt-key add - && \
apt-get update && apt-get install -y clang-7 lldb-7 lld-7 && \
#clang-8
echo 'deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-8 main\n \
deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial-8 main\n' \
>> /etc/apt/sources.list && \
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|apt-key add - && \
apt-get update && apt-get install -y clang-8 lldb-8 lld-8 && \
#add clang env
echo 'export PATH=/usr/lib/llvm-8/bin:$PATH' >> ~/.bashrc && \
echo 'export CC=clang' >> ~/.bashrc && \
echo 'export CXX=clang++' >> ~/.bashrc && \
#golang
curl -LO https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz && \
tar -C /usr/local -xzf go1.12.5.linux-amd64.tar.gz && \
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc  && \
#docker-ce
apt-get install -y \
apt-transport-https \
ca-certificates \
curl \
gnupg-agent \
software-properties-common && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg |  apt-key add - && \
add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io


ENTRYPOINT ["/bin/bash"]
