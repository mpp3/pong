#!/bin/bash

cmake -S. -Bbuildweb -DPLATFORM=Web  "-DCMAKE_TOOLCHAIN_FILE=~/emsdk/upstream/emscripten/cmake/Modules/Platform/Emscripten.cmake"
cmake --build buildweb
cp buildweb/pong.* public
mv public/pong.html public/index.html
