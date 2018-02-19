#!/bin/bash

#SBATCH --job-name=gerrisOctave
#SBATCH --output=/scratch/labdac/gerrisOctave_%A_%a.out
#SBATCH --error=/scratch/labdac/gerrisOctave_%A_%a.err
#SBATCH --array=1-6
#SBATCH --ntasks=1

#export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig

USERNAME=$(whoami)

PARAMS[1]="0.001"
PARAMS[2]="0.005"
PARAMS[3]="0.010"
PARAMS[4]="0.050"
PARAMS[5]="0.100"
PARAMS[6]="0.500"


WORK_FOLDER=$(pwd)/Gerris-ControllerModule/examples/cylinder_control_explore_params
SIM_TEMPLATE_FOLDER=$WORK_FOLDER/../cylinder_control_octave
EXEC_FOLDER=$WORK_FOLDER/tmp
DATA_FOLDER=$WORK_FOLDER/explore
KPROP=${PARAMS[$SLURM_ARRAY_TASK_ID]}

echo "SLURM_ARRAY_TASK_ID: $SLURM_ARRAY_TASK_ID"
echo "KPROP: $KPROP"

KINT_LIST="0.001 0.005 0.010 0.050 0.100 0.500"
echo "Running Simulation..."

for KINT in  ${KINT_LIST}; do
       cd $WORK_FOLDER
       DATA_FOLDER_SIM="$DATA_FOLDER/cylinder_control_kprop_${KPROP}_kint_${KINT}"
       if [ ! -d "$DATA_FOLDER_SIM" ]; then
         rm -rf $EXEC_FOLDER/
         mkdir -p $EXEC_FOLDER
         cp -r $SIM_TEMPLATE_FOLDER/* $EXEC_FOLDER
         cd $EXEC_FOLDER
         echo "Running cylinder control at: ${EXEC_FOLDER}..."
         sed -i "s/kProp *=.*/kProp = ${KPROP}/g" python/user/controller.py
         sed -i "s/kInt *=.*/kInt = ${KINT}/g" python/user/controller.py
         ./exec_simulation.sh 
	#2>log.txt
         EXEC_RESULT=$?
          if [ $EXEC_RESULT -eq 0 ]; then
            echo "Finished cylinder control. Collecting results..."
            mkdir -p $DATA_FOLDER_SIM
            cp results/*.dat results/*.txt $DATA_FOLDER_SIM
          else
            echo "ERROR DETECTED. SKIPPING..."
          fi
       fi
done

cp -R $HOME/examples/gerris/Gerris-ControllerModule/examples/cylinder_control_explore_params/tmp/results /scratch/$USERNAME/results_$SLURM_ARRAY_TASK_ID
