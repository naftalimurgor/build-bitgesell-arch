#!/bin/bash

cd $HOME

git clone -b release-0.1.10 https://github.com/BitgesellOfficial/bitgesell.git

cd bitgesell/
./autogen.sh

# configure, note the location of BerkleyDB
./configure LDFLAGS="-L/usr/local/BerkeleyDB.4.8/lib/" CPPFLAGS="-I/usr/local/BerkeleyDB.4.8/include/" --with-gui=qt5

make

echo "built sucessfully"
ls src/bitgesell