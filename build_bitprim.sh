#!/bin/bash

if [ $1 == "secp256k1" ];then
	git clone https://github.com/bitprim/secp256k1.git
	cd secp256k1
	mkdir build
	cd build
	cmake .. -DENABLE_MODULE_RECOVERY=ON 
	make -j2 --silent
	sudo make install --silent
	cd ..
	cd ..
fi

if [ $1 == "core" ];then
	git clone https://github.com/bitprim/bitprim-core.git
	cd bitprim-core
	mkdir build
	cd build
	cmake .. -DWITH_TESTS=OFF -DWITH_EXAMPLES=OFF -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DCMAKE_CXX_FLAGS="${CXX_FLAGS}" ${BOOST_OPTS}
	make -j2 --silent
	sudo make install --silent
	cd ..
	cd ..
fi

if [ $1 == "protocol" ];then
	git clone https://github.com/bitprim/bitprim-protocol.git
	cd bitprim-protocol
	mkdir build
	cd build
	cmake .. -DWITH_TESTS=OFF ${PROTOBUF} ${ZEROMQ} -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DCMAKE_CXX_FLAGS="${CXX_FLAGS}" ${BOOST_OPTS}
	make -j2 --silent
	sudo make install --silent
	cd ..
	cd ..
fi

if [ $1 == "node" ];then
	git clone https://github.com/bitprim/bitprim-node.git
	cd bitprim-node
	mkdir build
	cd build
	cmake .. -DENABLE_TESTS=OFF -DWITH_TESTS=OFF -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DCMAKE_CXX_FLAGS="${CXX_FLAGS}" ${BOOST_OPTS}
	make -j2 --silent
	sudo make install --silent
	cd ..
	cd ..
fi

if [ $1 == "consensus" ];then
	git clone https://github.com/bitprim/bitprim-consensus.git
	cd bitprim-consensus
	mkdir build
	cd build
	cmake .. -DWITH_TESTS=OFF -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DCMAKE_CXX_FLAGS="${CXX_FLAGS}" ${BOOST_OPTS}
	make -j2 --silent
	sudo make install --silent
	cd ..
	cd ..
fi

if [ $1 == "database" ];then
	git clone https://github.com/bitprim/bitprim-database.git
	cd bitprim-database
	mkdir build
	cd build
	cmake .. -DWITH_TESTS=OFF -DWITH_TOOLS=OFF -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DCMAKE_CXX_FLAGS="${CXX_FLAGS}" ${BOOST_OPTS}
	make -j2 --silent
	sudo make install --silent
	cd ..
	cd ..
fi

if [ $1 == "blockchain" ];then
	git clone https://github.com/bitprim/bitprim-blockchain.git
	cd bitprim-blockchain
	mkdir build
	cd build
	cmake .. -DWITH_TESTS=OFF -DWITH_TOOLS=OFF -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DCMAKE_CXX_FLAGS="${CXX_FLAGS}" ${BOOST_OPTS}
	make -j2 --silent
	sudo make install --silent
	cd ..
	cd ..
fi

if [ $1 == "network" ];then
	git clone https://github.com/bitprim/bitprim-network.git
	cd bitprim-network
	mkdir build
	cd build
	cmake .. -DWITH_TESTS=OFF -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DCMAKE_CXX_FLAGS="${CXX_FLAGS}" ${BOOST_OPTS}
	make -j2 --silent
	sudo make install --silent
	cd ..
	cd ..
fi

if [ $1 == "server" ];then
	git clone https://github.com/bitprim/bitprim-server.git
	cd bitprim-server
	mkdir build
	cd build
	cmake .. -DWITH_TESTS=OFF -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DCMAKE_CXX_FLAGS="${CXX_FLAGS}" ${BOOST_OPTS}
	make -j2 --silent
	sudo make install --silent
	cd ..
	cd ..
fi

if [ $1 == "client" ];then
	git clone https://github.com/bitprim/bitprim-client.git
	cd bitprim-client
	mkdir build
	cd build
	cmake .. -DWITH_TESTS=OFF -DWITH_EXAMPLES=OFF -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DCMAKE_CXX_FLAGS="${CXX_FLAGS}" ${BOOST_OPTS}
	make -j2 --silent
	sudo make install --silent
	cd ..
	cd ..
fi

if [ $1 == "explorer" ];then
	git clone https://github.com/bitprim/bitprim-explorer.git
	cd bitprim-explorer
	mkdir build
	cd build
	cmake .. -DWITH_TESTS=OFF -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DCMAKE_CXX_FLAGS="${CXX_FLAGS}" ${BOOST_OPTS}
	make -j2 --silent
	sudo make install --silent
	cd ..
	cd ..
fi

if [ $2 == "linux" ];then
	sudo ldconfig
fi


