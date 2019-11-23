FROM ubuntu:18.04
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
autoconf \
libtool \
virtualenv \
python \
vim \
g++ \
wget \
ninja-build \
curl &&\
#use bazelisk to avoid bazel compatibility issue
wget -O /usr/local/bin/bazel https://github.com/bazelbuild/bazelisk/releases/download/v0.0.8/bazelisk-linux-amd64 && \
chmod +x /usr/local/bin/bazel && \
#golang
curl -LO https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz && \
tar -C /usr/local -xzf go1.12.5.linux-amd64.tar.gz && \
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc  && \
echo 'export PATH=$PATH:/root/go/bin' >> ~/.bashrc  && \
echo 'export GOPATH=$HOME/go' >> ~/.bashrc  && \
# go relative
go get -u github.com/bazelbuild/buildtools/buildifier && \
echo 'export BUILDIFIER_BIN=$GOPATH/bin/buildifier' >> ~/.bashrc  && \
go get -u github.com/bazelbuild/buildtools/buildozer && \
echo 'export BUILDOZER_BIN=$GOPATH/bin/buildozer' >> ~/.bashrc  && \
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
