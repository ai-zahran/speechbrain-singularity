FROM nvidia/cuda:11.4.1-devel-ubuntu20.04


RUN apt-get update


RUN DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes --no-install-recommends --quiet \
    python3 \
    unzip \
    git-all

RUN pip3 install --no-cache numpy \
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
