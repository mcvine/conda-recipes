FROM ubuntu:14.04

MAINTAINER "Jiao Lin <jiao.lin@gmail.com>"

LABEL Description="image prepared for buildindg MCViNE conda pkg"

# use bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# installation of basic software and dependencies
RUN  apt-get update
RUN  apt-get -qy install wget git build-essential

# install miniconda
RUN  wget http://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -O miniconda.sh
RUN  chmod +x miniconda.sh
RUN  bash miniconda.sh -b -p /root/mc
RUN  cd /root/
ENV PATH=/root/mc/bin:$PATH
RUN  conda config --set always_yes true
RUN  conda create -n build-mcvine python
RUN  conda install -n root conda-build
RUN  source activate build-mcvine
RUN  conda config --add channels conda-forge
# RUN  conda config --add channels mcvine
# RUN  git clone https://github.com/mcvine/conda-recipes
