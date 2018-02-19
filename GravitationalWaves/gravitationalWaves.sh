#!/bin/bash

#SBATCH --job-name=gravitationalWaves
#SBATCH --output=/scratch/labdac/gravitationalWaves_%A_%a.out
#SBATCH --error=/scratch/labdac/gravitationalWaves_%A_%a.err
#SBATCH --array=0-2
#SBATCH --ntasks=1

USERNAME=$(whoami)

python gravitationalWaves.py $SLURM_ARRAY_TASK_COUNT $SLURM_ARRAY_TASK_ID
cp result.dat /scratch/$USERNAME/result_${SLURM_ARRAY_TASK_COUNT}_${SLURM_ARRAY_TASK_ID}.dat
