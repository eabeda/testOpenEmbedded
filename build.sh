#! /bin/sh

export PATH=~/git/testOpenEmbedded/bitbake/bin:$PATH
cd bitbake/
tree -L 2
mkdir hello/
cd hello
mkdir conf
cp ../files/bblayers.conf conf/bitbake.conf
cp ../files/bblayers.conf conf/bblayers.conf
mkdir -p mylayer/conf/
cp ../files/layer.conf mylayer/conf/layer.conf
mkdir -p mylayer/classes/
cp ../files/base.bbclass mylayer/classes/base.bbclass
cp ../files/base.bbclass mylayer/printhello.bb
bitbake printhello -D

