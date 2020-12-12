#!/bin/bash

echo "Starting script"
if [[ $# -eq 0 ]] ; then # if called with no arguments
    echo "Usage: bash $0 <DATASET NAME>"
    exit 1
fi

DATASET=$1
davinciCODE=evaluating_dpml.py

#echo "Loading modules"
#source /etc/profile.d/modules.sh
#module load anaconda3

# Make sure conda environment has dependencies
#echo "Creating conda environment"
#conda create -n tf-gpu tensorflow-gpu
#source activate crypto
#conda install scikit-learn

#pip install dm-tree
#pip install matplotlib
#pip install git+git://github.com/tensorflow/privacy@master

#echo "Filling data/ directory"
#python $davinciCODE $DATASET --save_data=1

echo "Beginning experiment"
#python $davinciCODE $DATASET --target_model='softmax' --target_l2_ratio=1e-5
#python $davinciCODE $DATASET --target_model='nn' --target_l2_ratio=1e-4
for RUN in 1
do
    for EPSILON in 0.01, 0.1, 1, 10, 50, 100, 500 , 1000
    do
        for DP in 'adv_cmp' 'zcdp' 'dp' 'rdp'
        do
            python $davinciCODE $DATASET --use_cpu=1 --target_model='softmax' --target_l2_ratio=1e-5 --attack_model=softmax --attack_l2_ratio=1e-4 --target_privacy='grad_pert' --target_dp=$DP --target_epsilon=$EPSILON --run=$RUN
        done
    done
done
echo done
