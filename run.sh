#!/bin/bash
gfortran sine.f90 -o sine.x
./sine.x
make
./fft.x

rm -rf *.pdf *.ps *.eps
cat>plot.gp<<EOF
set term postscript enhanced color 'Helvetica-Bold' 20
set output 'sineFFT.ps'
set style line 1 lt 1 lw 3 lc rgb 'red'
set xr [0:210]
#set yr [0:800]
set xl 'Frequency (Hz)'
set noytics
plot 'out.dat' u (\$1):(sqrt(\$2*\$2+\$3*\$3)) w l ls 1 noti
set output
! ps2pdf sineFFT.ps
EOF
gnuplot plot.gp

cat>signal.gp<<EOF
set term postscript enhanced color 'Helvetica-Bold' 20
set output 'sine.ps'
#f(x)=sin(314.0*x)+sin(628.0*x)+sin(942.0*x)+sin(1256.0*x)
set style line 1 lt 1 lw 3 lc rgb 'red'
set style line 2 lt 1 lw 3 lc rgb 'blue'
#set xr [0:0.50]
#set yr [-3.5:4.0]
set xl 'time (sec)'
plot 'sine.dat' w l ls 1 noti
set output
! ps2pdf sine.ps
EOF
#gnuplot signal.gp

