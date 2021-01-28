
sudo apt update -y  && sudo apt install -y build-essential curl git wget libssl-dev libsodium-dev wget pkg-config autoconf libtool g++-8

wget https://cmake.org/files/v3.19/cmake-3.19.2-Linux-x86_64.tar.gz
tar -xvf cmake-3.19.2-Linux-x86_64.tar.gz
export PATH="`pwd`/cmake-3.19.2-Linux-x86_64/bin:$PATH"

export  BOOST_VERSION=1_70_0
export BOOST_VERSION_DOT=1.70.0
export  BOOST_HASH=430ae8354789de4fd19ee52f3b1f739e1fba576f0aded0897c3c2bc00fb38778

curl -s -L -o  boost_${BOOST_VERSION}.tar.bz2 https://dl.bintray.com/boostorg/release/${BOOST_VERSION_DOT}/source/boost_${BOOST_VERSION}.tar.bz2
echo "${BOOST_HASH}  boost_${BOOST_VERSION}.tar.bz2" | sha256sum -c
tar -xvf boost_${BOOST_VERSION}.tar.bz2
cd boost_${BOOST_VERSION} 
./bootstrap.sh 
sudo  ./b2 install
export  BOOST_ROOT /usr/local/include/boost

export  OPENSSL_VERSION=1.1.1c
export OPENSSL_HASH=f6fb3079ad15076154eda9413fed42877d668e7069d9b87396d0804fdb3f4c90
     curl -s -O https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz 
     echo "${OPENSSL_HASH}  openssl-${OPENSSL_VERSION}.tar.gz" | sha256sum -c 
     tar -xzf openssl-${OPENSSL_VERSION}.tar.gz
     cd openssl-${OPENSSL_VERSION}
     ./Configure linux-x86_64 no-shared --static -fPIC
     make build_generated
     make libcrypto.a
     make install
 export OPENSSL_ROOT_DIR=/usr/local/openssl-${OPENSSL_VERSION}

# Sodium
 export  SODIUM_VERSION=1.0.18
 export SODIUM_HASH=4f5e89fa84ce1d178a6765b8b46f2b6f91216677
     git clone https://github.com/jedisct1/libsodium.git -b ${SODIUM_VERSION} --depth=1 
     cd libsodium
     test `git rev-parse HEAD` = ${SODIUM_HASH} || exit 1
     ./autogen.sh
     CFLAGS="-fPIC" CXXFLAGS="-fPIC" ./configure
     make 
     make check 
     make install


sudo  rm -rf gyuanx-storage-server

 git clone https://github.com/yuanxcoin/gyuanx-storage-server.git --depth=1 -b dev

  cd gyuanx-storage-server && git submodule update --init --recursive


 export  CC=gcc-8 
 export CXX=g++-8

 cd gyuanx-storage-server 
     mkdir -p build 
     cd build 
     cmake .. -DBOOST_ROOT=$BOOST_ROOT -Dsodium_USE_STATIC_LIBS=ON 
     cmake --build . -- -j1
 sudo make install


