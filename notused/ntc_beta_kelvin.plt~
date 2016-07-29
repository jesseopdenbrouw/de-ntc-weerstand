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
set output "ntc_beta_kelvin_fig.pdf"

### Calculate mean to set some gnuplot internals
mean(x)= m
fit mean(x) 'GegevensBetatherm10K3A542I.dat' using 5:7 via m # 1 is the x axis and 2 is the y axis
SST = FIT_WSSR/(FIT_NDF+1)

#A = 0.1
#B = 0.1
#C = 0.1
#D = 0.1
beta(x) = A*x**3 + B*x**2 + C*x + D
fit beta(x) "GegevensBetatherm10K3A542I.dat" using 5:7 via A,B,C,D
#beta(x) = A*x**2 + B*x + C
#fit beta(x) "GegevensBetatherm10K3A542I.dat" using 5:7 via A,B,C

### Caculcate some ...
SSE=FIT_WSSR/(FIT_NDF)

SSR=SST-SSE
R2=SSR/SST

# Do the plot
#set size square 1,1
#set ytics 400                           # Increment 20
#set xtics 5                           # Increment 20
set xrange [220:400]
set yrange [3700:4050]
#set title "Cells vs. Bits"
set xlabel "T [K]" # offset 0,-1
set ylabel "B [K]" # offset -1
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
#plot "GegevensBetatherm10K3A542I.dat" using 5:7 pt 6 title "", beta(x) title "" with lines
plot beta(x) title "" lc "blue" with lines, "GegevensBetatherm10K3A542I.dat" using 5:7 with points pt 7 ps 0.2 lc "red" title "" 
#stats 'GegevensBetatherm10K3A542I.dat' using 1:2

set print "ntc_beta_kelvin_curve_fitting_params.tex"
print "% Curve fitting parameters for fitting beta plot in Kelvin"
#print "% Beta = A*x^3 + B*x^2 + C*x + D"
print "% Beta = A*x^2 + B*x + C"
foo = sprintf("\\newcommand{\\ntcbetakelvinA}{%.10f}", A)
print foo
foo = sprintf("\\newcommand{\\ntcbetakelvinB}{%.10f}", B)
print foo
foo = sprintf("\\newcommand{\\ntcbetakelvinC}{%.10f}", C)
print foo
foo = sprintf("\\newcommand{\\ntcbetakelvinD}{%.10f}", D)
print foo
foo = sprintf("\\newcommand{\\ntcbetakelvinRsqr}{%.10f}", R2)
print foo
foo = sprintf("\\newcommand{\\ntcbetakelvintwofive}{%.10f}", beta(273.15+25.0))
print foo
foo = sprintf("\\newcommand{\\ntcbetakelvintwofiveonedec}{%.1f}", beta(273.15+25.0))
print foo
foo = sprintf("\\newcommand{\\ntcbetakelvintwofiveint}{%d}", beta(273.15+25.0)+0.5)
print foo
set output
