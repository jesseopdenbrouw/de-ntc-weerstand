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
set output "ntc_ntc_plot_kelvin_fig.pdf"

# Do the plot
#set size square 1,1
#set ytics 400                           # Increment 20
#set xtics 5                           # Increment 20
#set xrange [-50:130]
#set yrange [0:400000]
#set title "Cells vs. Bits"
set xlabel "T [K]" #offset 0,-1
set ylabel "R_n_t_c [{/Symbol W}]" #offset -1
#set label sprintf("b = %3.4f",b) at 6,1900
#set label sprintf("a = %3.4f",a) at 6,1700
#set label sprintf("$C = %3.4f\\cdot b^{\\,%3.4f}$",a,b) at 6,1700
#plot "synthesis.dat" using 1:3 title "", lin(x) title "best fit"
#set pointsize 2
#set data style linespoints
#set style line 1 lc rgb 'black' pt 5   # square
#set style data points
#set lmargin 0
#set rmargin 0
plot "GegevensBetatherm10K3A542I.dat" using 5:2 with points pt 7 ps 0.2 lc "red" notitle, "GegevensBetatherm10K3A542I.dat" using 5:2 smooth csplines lc "blue" notitle
#plot "GegevensBetatherm10K3A542I.dat" using 5:2 smooth csplines lc "red" notitle
#stats 'GegevensBetatherm10K3A542I.dat' using 1:2

set output
