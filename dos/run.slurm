#!/bin/bash
#SBATCH -J dos_calc      # Job name
#SBATCH -p quad        # name of partition for QE calculation
#SBATCH -o job.%j.out    # Name of stdout output file (%j expands to jobId)
#SBATCH -N 1             # Total number of nodes requested
#SBATCH -n 4             # Total number of mpi tasks requested
#SBATCH -t 00:15:00      # Run time (hh:mm:ss)

# load needed modules
module load qe/7.0

# run the calculation
mpirun -np 4 pw.x -nk 1 -npw 4 -inp scf.in > scf.out
mpirun -np 4 pw.x -nk 1 -npw 4 -inp nscf.in > nscf.out
mpirun -np 4 dos.x < dos.in > dos.out

rm -rf pwscf.*

