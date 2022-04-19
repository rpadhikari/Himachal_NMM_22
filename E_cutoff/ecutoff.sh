#!/bin/bash

# This bash script will optimize the Kinetic energy cutoff of 
# cubic crystals scanning from 40 - 110 Ry in the steps of 5 Ry
# Written by: Rajendra Adhikari, Department of Physics,
# Kathmandu University, Kavre, Nepal
# Date: 17th July, 2020
# please do NOT remove above copyright notice.

rm -rf etot.dat stress.dat
for m in {0..14}
  do
    ecut=`echo "40.0+$m*5.0" | bc -l`
cat > scf.in << EOF
&control
    calculation='scf'
    restart_mode='from_scratch'
    pseudo_dir = '../pseudo'
    outdir='./'
    disk_io='none'
    tstress=.true.
    tprnfor=.true.
!    etot_conv_thr=1.0d-04
!    forc_conv_thr=1.0d-03
/
&system
    ibrav=2
!    celldm(1)=5.4307 ! Experimental value
    celldm(1)=10.33520 ! optimized value from previous calculation
    nat=2
    ntyp=1
    ecutwfc=$ecut
    occupations='fixed'
/
 &electrons
    conv_thr = 2.0d-8
    mixing_beta = 0.7
/
ATOMIC_SPECIES
  Si  28.085  Si.pbe-n-kjpaw_psl.1.0.0.UPF
ATOMIC_POSITIONS {crystal}
  Si  0.00    0.00  0.00
  Si  0.25    0.25  0.25
K_POINTS {automatic}
 8 8 8 1 1 1
EOF
mpirun -np 4 pw.x -nk 1 -npw 4 -inp scf.in > scf.out
te=`grep ! scf.out | tail -1 | awk '{print $5}'`
#ft=`grep 'l fo' scf.out | awk '{print $4}'`
sxx=`grep -A1 'l   s' scf.out | tail -1 | awk '{print $4}'`
echo "$ecut  $sxx" >> stress.dat
echo "$ecut $te" >> etot.dat
#echo "$ecut  $ft" >> force.dat
mv scf.in scf$m.in
mv scf.out scf$m.out
done
