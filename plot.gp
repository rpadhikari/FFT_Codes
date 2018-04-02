set term postscript enhanced color 'Helvetica-Bold' 20
set output 'sineFFT.eps'
set style line 1 lt 1 lw 3 lc rgb 'red'
set xr [5:210]
set yr [0:800]
set xl 'Frequency Hz)'
set noytics
plot 'out.dat' u ($1):(sqrt($2*$2+$3*$3)) w l ls 1 noti
set output
! ps2pdf sineFFT.ps
