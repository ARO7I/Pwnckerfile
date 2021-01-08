#!/bin/zsh

cd v8
./tools/dev/v8gen.py x64.debug
ninja -C ./out.gn/x64.debug
