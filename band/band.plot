# This gnuplot script will plot band structure of Si in Diamond
# crystal sturcture. y-axis is offset to VBM.
# 
# Written by: Rajendra Adhikari, Department of Physics,
# Kathmandu University, Kavre, Nepal
# Date: 17th July, 2020
# please do NOT remove above copyright notice as you share 
# or modify this code.

# set terminal type
set encoding iso_8859_15
set terminal postscript enhanced color "Helvetica-Bold, 16"
set output "bands.ps"
set key off
set xrange [0:3.4692]
ymin=-5.0; ymax=5.0; y0=0.2
set yrange [ymin:ymax]

set arrow from 0.5,ymin to 0.5,ymax nohead lw 1 lt -1 front
set arrow from 1.1847,ymin to 1.1847,ymax nohead lw 1 lt -1 front
set arrow from 2.1032,ymin to 2.1032,ymax nohead lw 1 lt -1 front
set arrow from 2.9692,ymin to 2.9692,ymax nohead lw 1 lt -1 front
set arrow from 3.4692,ymin to 3.4692,ymax nohead lw 1 lt -1 front

set xzeroaxis lw 2 lt -1
set border lw 2
unset xtics
set size 0.85,1.0
set ylabel 'Energy (eV)'
set label '{/Symbol G}' at 0.0, ymin-y0      # Gamma
set label 'X' at 0.5, ymin-y0                # X
set label 'U' at 1.1847, ymin-y0             # U
set label 'K' at 1.1847-0.1, ymin-y0         # K
set label '{/Symbol G}' at 2.1032, ymin-y0   # Gamma
set label 'L' at 2.9692, ymin-y0             # L
#set label 'W' at 3.4702, ymin-y0             # W
set label 'X' at 3.4692, ymin-y0             # X
VBM=5.9823   # valance band maximum
plot 'SiBands.out.gnu' u 1:($2-VBM) w l noti
#
set output
! ps2pdf bands.ps
! rm bands.ps
 
