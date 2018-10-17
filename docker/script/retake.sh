#!/bin/bash

# デバッグを開始する
set -x

rm -rf src/
cp -rf script/ori_src/ src

rm -rf tmp/

# デバッグを終了する
set +x