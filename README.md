# Himachal_NMM_22
This repo contains information and tutorials Nano Materials
Modelling April 18-21, 2022 at Swami Vivekanand Government College
Kallri, Ghumarwin, Distt. Bilaspur Himachal Pradesh - 174021, India.
Please stay tuned for more information to be added soon. To download 
all the contents of this repo please issue the following command on
the storage0 folder of the Supercomputer.

git clone https://github.com/rpadhikari/Himachal_NMM_22.git

After the successful download please issue the series of commands as below:
# Optimizing the lattice of Si crystal (in Diamond structire)
# study the README file in each folder as needed
cd alat
chmod a+x alat.sh   # change the file permission to run
sbatch run.slurm    # submit the job on Supercomputer
squeue              # monitor the job status
gnuplot spline.plot    # generates the cubic spline fitting 
gnuplot alat.plot      # plots the total energy vs lattice constant
# copy the plot to your local machine and open using Adobe reader
# Identify the lattice value corresponding to minimum energy.
# Other folders follow similarly
-Rajendra Adhikari


