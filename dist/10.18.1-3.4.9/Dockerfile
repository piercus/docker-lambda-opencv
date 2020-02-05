FROM amazonlinux:latest

ENV NODE_VERSION 10.18.1
ENV OPENCV_VERSION 3.4.9
ENV DIR /var/task
ENV LOCAL_SRC /tmp
ENV OPENCV_RELEASE ${LOCAL_SRC}/opencv-${OPENCV_VERSION}/release
ENV OPENCV_INSTALL_PREFIX ${DIR}/build
ENV LD_LIBRARY_PATH ${OPENCV_INSTALL_PREFIX}/lib
ENV PKG_CONFIG_PATH ${OPENCV_INSTALL_PREFIX}/lib/pkgconfig

RUN yum update -y \
      && yum install -y gcc44 gcc-c++ libgcc44 \
      && yum install -y libjpeg-devel libpng-devel libjasper-devel libtiff-devel openssl-devel \
      && yum install -y unzip cmake git openssh-clients tar make \
      && yum -y clean all \
      && cd ${LOCAL_SRC} \
      && curl -s -L -O https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}.tar.gz \
      && tar -zxvf node-v${NODE_VERSION}.tar.gz \
      && cd node-v${NODE_VERSION} \
      && ./configure \
      && make \
      && make install \
      && cd .. \
      && rm node-v${NODE_VERSION}.tar.gz \
      && mkdir -p ${OPENCV_RELEASE} \
      && mkdir -p ${OPENCV_INSTALL_PREFIX} \
      && cd ${LOCAL_SRC} \
      && curl -s -L -O https://github.com/itseez/opencv/archive/${OPENCV_VERSION}.zip \
      && unzip ${OPENCV_VERSION}.zip \
      && cd ${OPENCV_RELEASE} \
      && cmake -D CMAKE_BUILD_TYPE=RELEASE -D WITH_OPENEXR=OFF -D WITH_IPP=ON -D INSTALL_CREATE_DISTRIB=ON -D BUILD_SHARED_LIBS=NO -D CMAKE_INSTALL_PREFIX=${OPENCV_INSTALL_PREFIX} .. \
      && make \
      && make install \
      && cd  ${LOCAL_SRC}\
      && rm ${OPENCV_VERSION}.zip\
      && rm -rf opencv-${OPENCV_VERSION}