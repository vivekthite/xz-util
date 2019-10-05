#!/bin/bash
read -p "Enter the absolute path of directory that contains xz files : "  path
cd $path
echo "Working directory : $(pwd)"
echo "Contents in $(pwd) : "
ls -al
echo ""
echo "Extracting started ..."
echo ""
for a in `ls -1 *.tar.xz`; do xz -dvc $a | tar xvf -; done
echo ""
echo "Extracting complete ..."
