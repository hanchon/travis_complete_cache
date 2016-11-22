#!/bin/bash
echo "el primer parametro: $1, el segundo: $2"
if [ $1 == "boost" ] && [ $2 == "linux" ]; then
	if [ ! -d "$HOME/boost/lib" ]; then
		wget -O boost.tar.gz https://sourceforge.net/projects/boost/files/boost/1.61.0/boost_1_61_0.tar.gz/download
		tar -xzf boost.tar.gz
		cd boost_1_61_0
		./bootstrap.sh --prefix=$HOME/boost
		./b2
		sudo ./b2 install
		cd ..
 		echo 'Boost 1.61.0 installed';
  	else
    		echo 'Boost 1.61.0 already installed';
	fi
	#export BOOST_ROOT="/home/travis/boost"
	#export BOOST_INCLUDE="/home/travis/boost/include"
	#export BOOST_LIBDIR="/home/travis/boost/lib"
	#export BOOST_OPTS="-DBOOST_ROOT=${BOOST_ROOT} -DBOOST_INCLUDEDIR=${BOOST_INCLUDE} -DBOOST_LIBRARYDIR=${BOOST_LIBDIR}"	
fi

if [ $1 == "protobuf" ] && [ $2 == "linux" ]; then
	if [ ! -d "$HOME/protobuf/lib" ]; then
		wget https://github.com/google/protobuf/releases/download/v3.1.0/protobuf-cpp-3.1.0.tar.gz
		tar -xzvf protobuf-cpp-3.1.0.tar.gz
		cd protobuf-3.1.0
		sudo ./configure --prefix=$HOME/protobuf 
		sudo make --silent
		sudo make install --silent
		cd ..
  		echo 'Protobuf 3.1.0 installed';
	else
    		echo 'Protobuf 3.1.0 already installed';
	fi
	export Protobuf_ROOT_DIR="/home/travis/protobuf"
	export Protobuf_INCLUDE_DIR="/home/travis/protobuf/include"
	export Protobuf_LIBRARY="/home/travis/protobuf/lib"
	export Protobuf_PROTOC_EXECUTABLE="/home/travis/protobuf/bin"
	#export PATH=/home/travis/protobuf/bin:${PATH}
	#sudo ldconfig
	#export PROTOBUF=" -DProtobuf_ROOT_DIR=/home/travis/protobuf "
fi

if [ $1 == "protobuf" ] && [ $2 == "osx" ]; then
	brew unlink protobuf
	brew install protobuf
	echo 'Protobuf installed';
fi

if [ $1 == "zeromq" ] && [ $2 == "linux" ]; then
	if [ ! -d "$HOME/zeromq/lib" ]; then
		wget https://github.com/zeromq/libzmq/releases/download/v4.2.0/zeromq-4.2.0.tar.gz
		tar -xzvf zeromq-4.2.0.tar.gz
		cd zeromq-4.2.0
		sudo ./autogen.sh
		sudo ./configure --prefix=$HOME/zeromq
		sudo make --silent 
		sudo make install --silent
		cd ..
  		echo 'ZeroMQ 4.2.0 installed';
	else
		echo 'ZeroMQ 4.2.0 already installed';
	fi
	#export ZeroMQ_ROOT_DIR="/home/travis/zeromq"
	#export ZeroMQ_INCLUDE_DIR="/home/travis/zeromq/include"
	#export ZeroMQ_LIBRARIES="/home/travis/zeromq/lib"
fi

if [ $1 == "zeromq" ] && [ $2 == "osx" ]; then
		wget https://github.com/zeromq/libzmq/releases/download/v4.2.0/zeromq-4.2.0.tar.gz
		tar -xzvf zeromq-4.2.0.tar.gz
		cd zeromq-4.2.0
		sudo ./autogen.sh
		sudo ./configure --prefix=$HOME/zeromq
		sudo make --silent 
		sudo make install --silent
		cd ..
		echo 'ZeroMQ 4.2.0 installed';
fi    
#call on the main script
#./dependences.sh boost
#export BOOST_OPTS="-DBOOST_ROOT=/home/travis/boost -DBOOST_INCLUDEDIR=/home/travis/boost/include -DBOOST_LIBRARYDIR=/home/travis/boost/lib"
#./dependences.sh zeromq
#export ZEROMQ=" -DZeroMQ_ROOT_DIR=/home/travis/zeromq "
#./dependences.sh protobuf
#export PROTOBUF=" -DProtobuf_ROOT_DIR=/home/travis/protobuf "
#export PATH=/home/travis/protobuf/bin:${PATH}
#sudo ldconfig

