# This gnuplot script will generate a table of total energy vs
# lattice constant of cubic crystals from -3 to +3 % of the
# experimental value 5.4307 Angstrom.
# It uses cubic spline fitting method avaiable in gnuplot
# Written by: Rajendra Adhikari, Department of Physics,
# Kathmandu University, Kavre, Nepal
# Date: 17th July, 2020
# please do NOT remove above copyright notice.

set sample 501
set format y '%18.10f'
set format x '%10.5f'
set table 'fit.dat'
plot 'etot.dat' smooth cspline noti
unset table

