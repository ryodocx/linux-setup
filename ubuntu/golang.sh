#!/bin/bash -xe

URL="https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz"
INSTALL_DIR="/usr/local/go"
GOPATH="$HOME/.go"

sudo mkdir -p $INSTALL_DIR
wget $URL -O tmp
sudo tar xfvz tmp -C $INSTALL_DIR --strip-components 1
rm tmp

cat << EOS >> $HOME/.profile

# Golang
export GOROOT=$INSTALL_DIR
export GOPATH=$GOPATH
PATH=\$PATH:\$GOROOT/bin:\$GOPATH/bin

EOS

echo  "please run the following command or restart shell"
echo  "source \$HOME/.profile"
