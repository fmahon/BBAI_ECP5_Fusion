FROM debian:10
RUN apt-get update && apt-get upgrade -y
RUN apt-get install python3-dev clang git cmake -y
RUN apt-get install libboost-all-dev libboost-dev python3-dev  -y
RUN  mkdir /workspace
RUN git clone --recursive https://github.com/SymbiFlow/prjtrellis /workspace/prjtrellis
RUN cd /workspace/prjtrellis/libtrellis && cmake -DCMAKE_INSTALL_PREFIX=/usr . && make && make install


RUN git clone https://github.com/YosysHQ/yosys.git /workspace/yosys 
RUN apt-get install build-essential clang bison flex libreadline-dev gawk tcl-dev libffi-dev git graphviz xdot pkg-config python3 libboost-system-dev libboost-python-dev libboost-filesystem-dev zlib1g-dev iverilog -y
RUN cd /workspace/yosys && make config-clang && make && make install && make test

RUN apt-get install qt5-default libeigen3-dev -y
RUN git clone https://github.com/YosysHQ/nextpnr.git /workspace/nextpnr
RUN cd /workspace/nextpnr &&  cmake -DARCH=ecp5 -DTRELLIS_ROOT=/workspace/prjtrellis .
RUN cd /workspace/nextpnr && make -j&(nproc)
RUN cd /workspace/nextpnr && make install

RUN apt-get install pipenv -y