#!/bin/bash

##GITCLONEDIR=$(pwd)
#clone the repository
git clone https://github.com/jbeder/yaml-cpp /yaml

#create a directory inside it where we build the app
mkdir -p /yaml/install
cd /yaml/install

#build the application and make it using the created makeFile
cmake .. && make

#get the version for the application
APPVERSION=$(cat /yaml/install/yaml-cpp.pc | grep -i version | cut -d : -f2 | sed 's/\./\-/g' | cut -d" " -f2)
echo "The version of the yaml app is : $APPVERSION"

#create and archive from the installed application
echo "--------------========= Creating archive from the binaries of yaml-ccp ==========-----------------"
ARCHNAME="yaml-cpp-$APPVERSION"
tar --directory=/yaml --absolute-name -cvzf archive.tar.gz ./install/
mv $GITCLONEDIR/yaml/install/archive.tar.gz $GITCLONEDIR/$ARCHNAME.tar.gz
