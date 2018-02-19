#!/bin/bash

cd Gerris-ControllerModule/examples/cylinder_control_octave
rm -fR vorticity.mpg
rm -fR velocity.mpg
rm -fR results/*
../../../gerris-stable-custom/bin/gerris2D.sh -m cylinder_control.gfs
