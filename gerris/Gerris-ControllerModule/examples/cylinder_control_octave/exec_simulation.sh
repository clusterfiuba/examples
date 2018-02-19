#! /bin/bash
mkdir -p results
rm -fR results/*
rm -fR vorticity.mpg
rm -fR velocity.mpg
/home/labdac/examples/gerris/gerris-stable-custom/bin/gerris2D.sh -m cylinder_control.gfs
