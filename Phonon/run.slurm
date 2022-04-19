#!/bin/bash
#SBATCH -J Phonon        # Job name
#SBATCH -p normal        # name of partition for QE calculation
#SBATCH -o job.%j.out    # Name of stdout output file (%j expands to jobId)
#SBATCH -N 1             # Total number of nodes requested
#SBATCH -n 12            # Total number of mpi tasks requested
#SBATCH -t 00:60:00      # Run time (hh:mm:ss)
# follow this article: 
# https://www.researchgate.net/publication/259667253_First-principles_codes_for_computational_crystallography_in_the_Quantum-ESPRESSO_package
# load needed modules
module load qe/7.0

# run the calculation
mpirun -np 12 pw.x -nk 2 -npw 6 -inp scf.in > scf.out
mpirun -np 12 ph.x -nk 2 -npw 6 -inp ph.in > ph.out
mpirun -np 4 q2r.x < q2r.in > q2r.out
mpirun -np 4 matdyn.x < dos.in > dos.out
mpirun -np 4 matdyn.x < band.in > band.out
