#!/bin/bash

# Get the path where the bash script is located to expand the path of the
# binary to execute
ROOT_PATH="$(dirname "$(readlink -f "$0")")"
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
# Load Gerris2D dependencies
DEPS_PATH=/opt/env
HOME=/home/labdac
source $DEPS_PATH/openmpi-3.0.0.sh
source $DEPS_PATH/ffmpeg-3.4.sh
# FIXME: THE CLIENT DEPENDENCIES SHOULD NOT BE IN THE SAME PATH THAT
# THE CLUSTER DEPENDENCIES
source /opt/env/gerris-stable-custom.sh
source $HOME/examples/gerris/gts-stable.sh
source $HOME/examples/gerris/gerris-stable-custom.sh

# Execute Gerris with arguments
GERRIS_BIN=$ROOT_PATH/gerris2D
if [ "$#" -ne 0 ]; then
        $GERRIS_BIN $@
else
        GERRIS_BIN
fi
