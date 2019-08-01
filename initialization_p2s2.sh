#!/bin/bash
echo "Initialization is starting soon... "

apt-get --assume-yes install g++
apt-get --assume-yes install build-essential

echo "g++ is needed to compile your c/c++ codes in linux."
echo "Available g++ version:"
g++ --version

echo "Update and upgrade your system."
apt-get update
apt-get upgrade

echo "Install dependencies."
apt-get --assume-yes install build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev

apt-get --assume-yes install python3.5-dev python3-numpy libtbb2 libtbb-dev

apt-get --assume-yes install libjpeg-dev libpng-dev libtiff5-dev libdc1394-22-dev libeigen3-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev sphinx-common libtbb-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libopenexr-dev libgstreamer-plugins-base1.0-dev libavutil-dev libavfilter-dev libavresample-dev

echo "Get opencv and its contrib files."
cd /opt/
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git

cd opencv/

su -c "mkdir release; cd release/;" -m "user"

cmake -D BUILD_TIFF=ON -D WITH_CUDA=OFF -D ENABLE_AVX=OFF -D WITH_OPENGL=OFF -D WITH_OPENCL=OFF -D WITH_IPP=OFF -D WITH_TBB=ON -D BUILD_TBB=ON -D WITH_EIGEN=OFF -D WITH_V4L=OFF -D WITH_VTK=OFF -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=/opt/opencv_contrib/modules /opt/opencv/

echo "OpenCv install."
make -j4
make install
ldconfig
apt-get --assume-yes install apt-file
apt update
apt-file search opencv.pc

apt-get --assume-yes install libopencv-dev
apt-get --assume-yes install libcanberra-gtk-module libcanberra-gtk3-module

echo "Compiling project."
echo "Available opencv version:"
pkg-config --modversion opencv
cd /home/user/

su -c "git clone https://AysegulDemirtas:stmassignment3107@github.com/AysegulDemirtas/3Kernel-Image-Filtering-2.git" -m "user"

su -c " cd 3Kernel-Image-Filtering-2; make; ./output" -m "user"

echo "end"


