#!/bin/bash
# Build berkley DB to access Wallet
if [[ ! -f "db-4.8.30.tar.gz" ]]
then
    wget https://github.com/observerdev/db-4.8.30/releases/download/db-4.8.30/db-4.8.30.tar.gz
fi


tar xfvz db-4.8.30.tar.gz
# apply BerkleyDB db-4.8.30 patch for compilers that have __atomic_compare_exchange: 
sed -i 's/__atomic_compare_exchange/__atomic_compare_exchange_db/g' db-4.8.30/dbinc/atomic.h

cd db-4.8.30

cd build_unix
../dist/configure --enable-cxx --disable-shared --with-pic
make
sudo make install
