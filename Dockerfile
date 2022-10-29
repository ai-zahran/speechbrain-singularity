FROM nvidia/cuda:11.4.1-devel-ubuntu20.04


RUN apt-get update


RUN DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes --no-install-recommends --quiet \
    python3 \
    python3-pip \
    unzip \
    git-all


RUN pip install --no-cache --upgrade pip setuptools


RUN pip3 install numpy \
    scikit-learn \
    torch \
    torchvision \
    torchaudio \
    transformers \
    nltk \
    matplotlib \
    h5py \
    speechbrain \
    orion \
    pandas \
    gdown \
    TextGrid

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        g++ \
        make \
        automake \
        autoconf \
        bzip2 \
        unzip \
        wget \
        sox \
        libtool \
        git \
        subversion \
        python2.7 \
        zlib1g-dev \
        gfortran \
        ca-certificates \
        patch \
        ffmpeg \
	vim && \
    rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/python2.7 /usr/bin/python

RUN git clone --depth 1 https://github.com/kaldi-asr/kaldi.git /opt/kaldi && \
    cd /opt/kaldi/tools && \
    ./extras/install_mkl.sh && \
    make -j $(nproc) && \
    cd /opt/kaldi/src && \
    ./configure --shared --use-cuda && \
    make depend -j $(nproc) && \
    make -j $(nproc) && \
    find /opt/kaldi  -type f \( -name "*.o" -o -name "*.la" -o -name "*.a" \) -exec rm {} \; && \
    find /opt/intel -type f -name "*.a" -exec rm {} \; && \
    find /opt/intel -type f -regex '.*\(_mc.?\|_mic\|_thread\|_ilp64\)\.so' -exec rm {} \; && \
    rm -rf /opt/kaldi/.git

