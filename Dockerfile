FROM nvidia/cuda:8.0-cudnn7-devel-ubuntu16.04

MAINTAINER taritree.wongjirad@tufts.edu

RUN apt-get update && apt-get install -y binutils \
	    	      	cmake \
			dpkg-dev \
			libfftw3-dev \
			gcc \
			g++ \
			gfortran \
			git \
			libgsl0-dev \
			libjpeg-dev \
			libpng-dev \
			libx11-dev \
			libxext-dev \
			libxft-dev \
			libxml2-dev \
			libxpm-dev \
			python \
			ipython-notebook \
			python-dev \
			libssl-dev \
			libxml2-dev \
			tar \
			wget && apt-get autoremove -y && apt-get clean -y
RUN mkdir -p /usr/local/root && cd /usr/local/root && wget https://root.cern.ch/download/root_v6.12.04.source.tar.gz && tar -zxvf root_v6.12.04.source.tar.gz -C /usr/local/root/ && \
    mkdir -p /usr/local/root/release && cd /usr/local/root/release && \
    cmake -Dbuiltin_xrootd=ON /usr/local/root/root-6.12.04 && \
    make && \
    cd /usr/local/root && rm root_v6.12.04.source.tar.gz && rm -r /usr/local/root/root-6.12.04
    