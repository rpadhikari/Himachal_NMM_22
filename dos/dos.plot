# This gnuplot script will plot the DOS of Si in Diamond
# crystal sturcture. x-axis is offset to VBM.
# 
# Written by: Rajendra Adhikari, Department of Physics,
# Kathmandu University, Kavre, Nepal
# Date: 17th July, 2020
# please do NOT remove above copyright notice.

# set terminal type
set term postscript enhanced color 'Helvetica-Bold,16'
set output 'dos.ps'
xmin=-4.0
xmax=4.0
ymin=0.0
ymax=3.5
set xr [xmin : xmax]
set yr [ymin : ymax]
 
set xl 'Energy (eV)'
set yl 'Density of States (Arb. unit)'
#set format y '%9.4f'
set key top center
# defining line styles
set style line 1 lt 1 lw 3 pt 6 ps 2 lc rgb 'blue'
set style line 2 lt 1 lw 2 pt 6 ps 2 lc rgb 'black'
VBM=5.9823 # valance band maximum (eV)
plot 'Si.dos' u ($1-VBM):2 w l noti ls 1
set output
! ps2pdf dos.ps
! rm dos.ps
