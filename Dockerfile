FROM nvidia/cuda:11.4.1-devel-ubuntu20.04


RUN apt-get update


RUN DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes --no-install-recommends --quiet \
    python3 \
    python3-pip \
    unzip


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
    pandas \
    gdown \
    TextGrid

