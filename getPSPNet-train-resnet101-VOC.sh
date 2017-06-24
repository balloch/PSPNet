#!/usr/bin/env sh
# Jonathan Balloch
# 2017/04/10

# TODO store init model and DeepLab-LargeFOV files in one directory

NET_ID=pspnet_resnet101 
#INIT_PATH=init
MODEL_PATH=exper/voc12/model/${NET_ID}
CONFIG_PATH=exper/voc12/config/${NET_ID}

mkdir -p ${NET_ID}
mkdir -p ${MODEL_PATH}
mkdir -p ${CONFIG_PATH}

cd ${NET_ID}
#wget -nc http://liangchiehchen.com/projects/released/deeplab_aspp_resnet101/prototxt_and_model.zip
#wget -nc https://drive.google.com/uc?export=download&confirm=-8O2&id=0BzaU285cX7TCNVhETE5vVUdMYk0
#unzip prototext_and_model.zip #https://drive.google.com/uc?export=download&confirm=-8O2&id=0BzaU285cX7TCNVhETE5vVUdMYk0
rm -rf prototex_and_model.zip

cd ../${MODEL_PATH}
ln -s ../../../../${NET_ID}/init.caffemodel init.caffemodel

cd ../../config/${NET_ID}
ln -s ../../../../${NET_ID}/solver.prototxt solver.prototxt
ln -s ../../../../${NET_ID}/solver2.prototxt solver2.prototxt
ln -s ../../../../${NET_ID}/train.prototxt train.prototxt
ln -s ../../../../${NET_ID}/test.prototxt test.prototxt

cd ../../../../
