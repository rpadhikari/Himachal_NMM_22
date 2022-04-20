#!/bin/bash
#SBATCH -J VolOpt  # Job name
#SBATCH -p titanv     # name of partition for QE calculation
#SBATCH -o job.%j.out # Name of stdout output file (%j expands to jobId)
#SBATCH -N 1          # Total number of nodes requested
#SBATCH -n 4          # Total number of mpi tasks requested
#SBATCH -t 72:00:00   # Run time (hh:mm:ss)

# load needed modules
module load qe/7.0-gpu
# run the calculation
./volume.sh
