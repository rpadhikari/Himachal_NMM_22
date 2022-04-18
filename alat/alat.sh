#!/bin/bash

# This bash script will optimize the lattice constant of 
# cubic crystals scanning from -3 to +3 % of the
# experimental value 5.4307 Angstrom
# Written by: Rajendra Adhikari, Department of Physics,
# Kathmandu University, Kavre, Nepal
# Date: 17th July, 2020
# please do NOT remove above copyright notice.

rm -rf etot.dat stress.dat
for m in {0..24}
  do
    alat=`echo "10.26254*(97.0/100.0+$m*0.0025)" | bc -l`
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
!    celldm(1)=5.4307
    celldm(1)=$alat
    nat=2
    ntyp=1
    nbnd=8
    ecutwfc=60.0
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
#ft=`grep 'l fo' scf.out|awk '{print $4}'`
sxx=`grep -A1 'l   s' scf.out|tail -1|awk '{print $4}'`
echo "$alat  $sxx" >> stress.dat
echo "$alat $te" >> etot.dat
#echo "$alat  $ft" >> force.dat
mv scf.in scf$m.in
mv scf.out scf$m.out
done

