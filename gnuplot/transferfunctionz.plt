# This is a GNUPLOT script
#
reset
set autoscale                          # scale axes automatically
unset log                              # remove any log-scaling
unset label                            # remove any previous labels
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically

# Set terminal type
set terminal pdfcairo
set output "transferfunctionz.pdf"

#
Ropt = 16218.0
B    = 3892.2
A    = 0.020637035
z(x) = Ropt/(A*exp(B/x)+Ropt)
fourtwo(x) = 0.42
two80(t) = 280.0

set xrange [100:500]
set trange [280:280]
#set yrange [3700:4050]
#set linetype 11 lc rgb 'blue'
set style line 1  linetype 2 linecolor rgb "blue"  linewidth 0.500 pointtype 2 pointsize default pointinterval 50
set xlabel "T [K]" # offset -1
set ylabel "H [-]" # offset 0,-1
set style line 1 lt 0 lc "blue" lw 1.5
#set arrow from 280, graph 0 to 280, graph 1 nohead ls 1 dt 3
#set arrow from 280.1,graph(0,0.42) to 280.1,graph(1,0.42) nohead ls 1 
#plot 'overdrachtsfunctiezhulp.dat' notitle with dots, z(x) notitle lc 7 with lines
#plot z(x) notitle lc 7 with lines, fourtwo(x) notitle ls 1 with dots
plot z(x) notitle lc 7 with lines
#set parametric
#plot two80(t), t with lines linecolor 2
 
set output
