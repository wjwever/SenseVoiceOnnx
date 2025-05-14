#########################################################################
# File Name: build.sh
# Author: frank
# mail: 1216451203@qq.com
# Created Time: 2025年05月12日 星期一 16时01分49秒
#########################################################################
#!/bin/bash
mkdir -p build
cd build
cmake ..
make -j 8

if [ ! -f silero_vad.onnx ]; then
    wget https://github.com/k2-fsa/sherpa-onnx/releases/download/asr-models/silero_vad.onnx
fi

if [ ! -d sherpa-onnx-sense-voice-zh-en-ja-ko-yue-2024-07-17 ];then
    wget https://github.com/k2-fsa/sherpa-onnx/releases/download/asr-models/sherpa-onnx-sense-voice-zh-en-ja-ko-yue-2024-07-17.tar.bz2
    tar xvf sherpa-onnx-sense-voice-zh-en-ja-ko-yue-2024-07-17.tar.bz2
    rm sherpa-onnx-sense-voice-zh-en-ja-ko-yue-2024-07-17.tar.bz2
fi

./bin/infer 
