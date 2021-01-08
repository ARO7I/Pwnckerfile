#!/bin/zsh

cd v8
./tools/dev/v8gen.py x64.release
ninja -C ./out.gn/x64.release
