# build-bitgesell-arch
Bash scripts to build Bitgesell Core(with GUI) on Arch Linux and derivative distros
## Step 1: Install necessary dependencies

```sh
sudo pacman -Syu base-devel git boost openssl libevent zeromq
```

## Step 2: Clone the Bitgesell repository

```sh
git clone https://github.com/bitgesell/bitgesell.git
```
## Step 3: Navigate to the Bitgesell repository folder

```sh
cd bitgesell/
```
## Step 4: Build the Berkeley DB (required by Bitgesell)

The are are standalone scripts in `bin` of this repository to build Berkley DB
```sh
./contrib/install_db4.sh `pwd`
```

## Step 5: Modify the db4 library path (temporary for the build process)
```sh
export BDB_PREFIX='/usr/local/bdb'
```

## Step 6: Configure the build
```sh
./autogen.sh
./configure LDFLAGS="-L${BDB_PREFIX}/lib/" CPPFLAGS="-I${BDB_PREFIX}/include/"
```

## Step 7: Build Bitgesell

```sh
make
```

## Step 8: Optional - Build GUI (requires Qt5 and Qt5-Base)
```sh
qmake && make
```

## Step 9: Install Bitgesell (optional)
```sudo make install
```
## Step 10: Start Bitgesell daemon (if installed)
```sh
BGLd
```

## Step 11: Start the Bitgesell QT GUI (if built and installed)
```sh
bitgesell-qt
```
