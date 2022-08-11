FROM perftool/compile:ebpf AS build

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN git clone --depth 1 https://github.com/iovisor/bcc.git && \
    mkdir bcc/build; cd bcc/build && \
    cmake .. && \
    make && \
    sudo make install && \
    cmake -DPYTHON_CMD=python3 .. # build python3 binding && \
    pushd src/python/ && \
    make && \
    sudo make install && \
    popd
