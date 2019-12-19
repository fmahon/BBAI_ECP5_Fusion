FROM debian:10
RUN apt-get update && apt-get upgrade -y
RUN apt-get install python3-dev clang git cmake -y
RUN apt-get install libboost-all-dev libboost-dev python3-dev  -y
RUN  mkdir /workspace
RUN git clone --recursive https://github.com/SymbiFlow/prjtrellis /workspace/prjtrellis
RUN cd /workspace/prjtrellis/libtrellis && cmake -DCMAKE_INSTALL_PREFIX=/usr . && make && make install