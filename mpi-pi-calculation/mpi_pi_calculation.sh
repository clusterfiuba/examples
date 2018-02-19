#!/bin/bash

#SBATCH --job-name=mpiPiCalculation
#SBATCH --output=/scratch/labdac/mpiPiCalculation_%j.out
#SBATCH --error=/scratch/labdac/mpiPiCalculation_%j.err
#SBATCH --ntasks-per-node 1

source /opt/env/openmpi-3.0.0.sh
mpirun mpi_pi_calculation $1
