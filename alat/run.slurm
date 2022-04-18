#!/bin/bash
#SBATCH -J Latt_Opt      # Job name
#SBATCH -p normal        # name of partition for QE calculation
#SBATCH -o job.%j.out    # Name of stdout output file (%j expands to jobId)
#SBATCH -N 1             # Total number of nodes requested
#SBATCH -n 4             # Total number of mpi tasks requested
#SBATCH -t 00:15:00      # Run time (hh:mm:ss)

# load needed modules
module load qe/7.0

# run the calculation
./alat.sh
