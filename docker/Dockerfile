FROM bvlc/caffe:gpu
#nvidia/cuda:8.0-devel-ubuntu14.04

MAINTAINER "Jonathan Balloch"

#RUN apt-get update

#RUN apt-get install -y --no-install-recommends build-essential git

RUN git -c http.sslVerify=false clone https://github.com/balloch/PSPNet.git

WORKDIR /workspace/PSPNet

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        git \
        wget \
        libatlas-base-dev \
        libboost-all-dev \
        libgflags-dev \
        libgoogle-glog-dev \
        libhdf5-serial-dev \
        libleveldb-dev \
        liblmdb-dev \
        libopencv-dev \
        libprotobuf-dev \
        libsnappy-dev \
        libmatio-dev \
        protobuf-compiler \
        python-dev \
        python-numpy \
        python-pip \
        python-setuptools \
        python-scipy && \
    rm -rf /var/lib/apt/lists/*


#RUN apt-get install libmatio-dev

RUN pip install --upgrade pip && \
    cd python && for req in $(cat requirements.txt) pydot; do pip install $req; done && cd .. && \
    git clone https://github.com/NVIDIA/nccl.git && cd nccl && make -j install && cd .. && rm -rf nccl
# && /
#    mkdir build && cd build && \
#    cmake -DUSE_CUDNN=0 -DUSE_NCCL=0 .. && \
#    make -j"$(nproc)"

RUN cp Makefile.config.example Makefile.config && \
    make -j8 && make matcaffe



RUN echo "$CAFFE_ROOT/build/lib" >> /etc/ld.so.conf.d/caffe.conf && ldconfig



#RUN cp Makefile.config.example Makefile.config && make -j8 && make matcaffe
