#!/bin/bash

BASE_DIR=/home/labdac/examples/gerris/gts-stable
export CFLAGS="-I$BASE_DIR/include $CFLAGS"
export CXXFLAGS="-I$BASE_DIR/include $CXXFLAGS"
export LDFLAGS="-L$BASE_DIR/lib $LDFLAGS "
export LD_LIBRARY_PATH=$BASE_DIR/lib:$LD_LIBRARY_PATH
export PATH=$BASE_DIR/bin:$PATH
export PKG_CONFIG_PATH=$BASE_DIR/lib/pkgconfig:$PKG_CONFIG_PATH
