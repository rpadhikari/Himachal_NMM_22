# This gnuplot script will plot the total energy vs
# KInetic energy cutoff of cubic crystals from 40-110 Ry.
# Written by: Rajendra Adhikari, Department of Physics,
# Kathmandu University, Kavre, Nepal
# Date: 17th July, 2020
# please do NOT remove above copyright notice.

# set terminal type
set term postscript enhanced color 'Helvetica-Bold,16'
set output 'ecut.ps'
xmin=40.0
xmax=110.0
#ymin=-93.453
#ymax=-93.454
set xr [xmin : xmax]
# set yr [ymin : ymax]
set xl 'Kinetic energy cutoff (Ry)'
set yl 'Total energy (Ry)'
set format y '%9.5f'
set key top center
# defining line styles
set style line 1 lt 1 lw 3 pt 6 ps 2 lc rgb 'blue'

plot 'etot.dat' u 1:2 w lp noti ls 1
set output
! ps2pdf ecut.ps
! rm ecut.ps

