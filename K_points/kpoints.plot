# This gnuplot script will plot the total energy vs
# K-points grid of cubic crystals from 4x4x4 to 24x24x24.
# Written by: Rajendra Adhikari, Department of Physics,
# Kathmandu University, Kavre, Nepal
# Date: 17th July, 2020
# please do NOT remove above copyright notice.

# set terminal type
set term postscript enhanced color 'Helvetica-Bold,16'
set output 'kgrid.ps'
xmin=4.0
xmax=16.0
# ymin=-93.454
# ymax=-93.450
set xr [xmin : xmax]
# set yr [ymin : ymax]
set xl 'K-grid'
set yl 'Total energy (Ry)'
set format y '%9.5f'
set key top center
# defining line styles
set style line 1 lt 1 lw 3 pt 6 ps 2 lc rgb 'blue'

plot 'etot.dat' u 1:2 w lp noti ls 1
set output
! ps2pdf kgrid.ps
! rm kgrid.ps
