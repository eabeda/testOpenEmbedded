#! /bin/sh

#Check that build-essential is installed
check=`dpkg -s tree 2>&1 | grep "is not installed"`
if [ -n "$check" ]; then
    echo "Installing tree"
    sudo apt install tree
fi

export PATH=~/git/testOpenEmbedded/bitbake/bin:$PATH
cd bitbake/
tree -L 2
mkdir -p hello/
cd hello
mkdir -p conf
cp ../../files/bitbake.conf conf/bitbake.conf
cp ../../files/bblayers.conf conf/bblayers.conf
mkdir -p mylayer/conf/
cp ../../files/layer.conf mylayer/conf/layer.conf
mkdir -p mylayer/classes/
cp ../../files/base.bbclass mylayer/classes/base.bbclass
cp ../../files/printhello.bb mylayer/printhello.bb
bitbake world
bitbake printhello -D

