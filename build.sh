#!/bin/bash
set -e

NODE_VERSIONS=('6.10.3' '4.3.2')

OPENCV_VERSIONS=('3.3.1' '3.4.0' '2.4.13.4' '2.4.12.3')

for NODE_VERSION in "${NODE_VERSIONS[@]}" 
do
	for OPENCV_VERSION in "${OPENCV_VERSIONS[@]}" 
	do
		TAG=${NODE_VERSION}-${OPENCV_VERSION}
		mkdir -p dist/$TAG
		sed "s/OPENCV_VERSION_TO_REPLACE/${OPENCV_VERSION}/" src/Dockerfile > dist/$TAG/tmp1
		sed "s/NODE_VERSION_TO_REPLACE/${NODE_VERSION}/" dist/$TAG/tmp1 > dist/$TAG/Dockerfile
		rm -f dist/$TAG/tmp1
	done
done
