#!/bin/bash
#extract all patches
mkdir kerenltree
cd kerneltree
mkdir patches
git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
cd linux-stable
c=`git log --pretty=format:''|wc -l`  #have problem
let cx=c+2
git format-patch -o ../patches -$cx


