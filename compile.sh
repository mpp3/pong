#!/usr/bin/env bash

cmake -S. -Bbuild
cmake --build build
cmake --install build
