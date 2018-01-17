FROM exocom/amazonlinux-node:6.10.3

ENV dir /var/task

ENV OPENCV_VERSION 2.4.12.3
ENV OPENCV_INSTALL_PREFIX ${dir}/build

RUN mkdir -p ${OPENCV_INSTALL_PREFIX}

RUN yum update -y \
      && yum install -y unzip cmake

RUN mkdir -p /usr/local/src/opencv-${OPENCV_VERSION}/release

RUN cd /usr/local/src \
    && curl -s -L -O https://github.com/itseez/opencv/archive/${OPENCV_VERSION}.zip \
    && unzip ${OPENCV_VERSION}.zip \
    && cd /usr/local/src/opencv-${OPENCV_VERSION}/release \
    && cmake -D CMAKE_BUILD_TYPE=RELEASE -D WITH_IPP=ON -D INSTALL_CREATE_DISTRIB=ON -D BUILD_SHARED_LIBS=NO -D CMAKE_INSTALL_PREFIX=${OPENCV_INSTALL_PREFIX} .. \
    && make && make install \
    && cd /usr/local/src && rm ${OPENCV_VERSION}.zip


ENV LD_LIBRARY_PATH ${dir}/build/lib
ENV PKG_CONFIG_PATH ${dir}/build/lib/pkgconfig

RUN ls $PKG_CONFIG_PATH
RUN ls $LD_LIBRARY_PATH

RUN yum -y install git openssh-clients
