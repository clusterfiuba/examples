#!/bin/bash

cd /home/labdac/gerris/Gerris-ControllerModule/examples/cylinder_control_octave
rm -fR vorticity.mpg
rm -fR velocity.mpg
rm -fR results/*
/home/labdac/gerris/gerris-stable-custom/bin/gerris2D.sh -m cylinder_control.gfs 
