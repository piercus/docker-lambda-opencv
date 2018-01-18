#!/bin/bash
set -e
NODE_VERSIONS=('6.10.3' '4.3.2')

OPENCV_VERSIONS=('3.3.1' '3.4.0' '2.4.13.4' '2.4.12.3')

for NODE_VERSION in "${NODE_VERSIONS[@]}" 
do
	for OPENCV_VERSION in "${OPENCV_VERSIONS[@]}" 
	do
		TAG=${OPENCV_VERSION}-${NODE_VERSION}
		docker push piercus/lambda-opencv:$TAG
	done
done
