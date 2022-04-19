#!/bin/bash
#SBATCH -J band_cal      # Job name
#SBATCH -p normal        # name of partition for QE calculation
#SBATCH -o job.%j.out    # Name of stdout output file (%j expands to jobId)
#SBATCH -N 1             # Total number of nodes requested
#SBATCH -n 16            # Total number of mpi tasks requested
#SBATCH -t 00:20:00      # Run time (hh:mm:ss)

# load needed modules
module load qe/6.7

# run the calculation
#mpirun -np 16 pw.x -nk 4 -npw 4 -inp scf.in > scf.out
#mpirun -np 16 pw.x -nk 4 -npw 4 -inp nscf.in > nscf.out
mpirun -np 4 bands.x < band.in > band.out
