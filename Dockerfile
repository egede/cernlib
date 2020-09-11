FROM centos:centos6

LABEL maintainer="ulrik.egede@monash.edu"
LABEL Description="This image provides cernlib including PAW and Geant 3.21" 

RUN yum update -y && \
    yum install -y \
    gcc \
    gcc-gfortran \
    gcc-c++ \
    glibc-2.12-1.212.el6_10.3.i686 \
    libX11-1.6.4-3.el6.i686 \
    libgfortran-4.4.7-23.el6.i686 \
    libgcc-4.4.7-23.el6.i686 \
    libuuid-2.17.2-12.28.el6_9.2.i686 \
    libstdc++-4.4.7-23.el6.i686 \
    libXm.so.4 \
    xclock \
    tcsh

COPY cernlib.tgz /
COPY libshift.tgz /
RUN cd / && tar xvzf /cernlib.tgz && ln -s /CERNLIB /cern
RUN cd /usr/lib && tar xvzf /libshift.tgz  
RUN rm -f /cernlib.tgz /libshift.tgz
