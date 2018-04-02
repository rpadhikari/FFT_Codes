set term postscript enhanced color 'Helvetica-Bold' 20
set output 'sine.eps'
f(x)=sin(314.0*x)+sin(628.0*x)+sin(942.0*x)+sin(1256.0*x)
set style line 1 lt 1 lw 3 lc rgb 'red'
set style line 2 lt 1 lw 3 lc rgb 'blue'
set xr [0:0.50]
set yr [-3.5:4.0]
set xl 'time (sec)'
plot 'sine.dat' u 1:2 w l ls 1 noti
set output
! ps2pdf sine.eps
