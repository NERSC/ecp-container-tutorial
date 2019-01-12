#!/bin/bash
#SBATCH -N 1 -C haswell -p regular
#SBATCH --reservation=ecp19containers
#SBATCH --image docker:ubuntu

srun -N 1 shifter /app/app.py
