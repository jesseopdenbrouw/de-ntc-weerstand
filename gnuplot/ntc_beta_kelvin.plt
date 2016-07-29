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

beta(x) = A*x**3 + B*x**2 + C*x + D
fit beta(x) "GegevensBetatherm10K3A542I.dat" using 5:7 via A,B,C,D

### Caculcate some ...
SSE=FIT_WSSR/(FIT_NDF)
SSR=SST-SSE
R2=SSR/SST

# Do the plot
set xrange [220:400]
set yrange [3700:4050]
set xlabel "T [K]" # offset 0,-1
set ylabel "B [K]" # offset -1
plot beta(x) title "" lc "blue" with lines, "GegevensBetatherm10K3A542I.dat" using 5:7 with points pt 7 ps 0.2 lc "red" title "" 

set print "ntc_beta_kelvin_curve_fitting_params.tex"
print "% Curve fitting parameters for fitting beta plot in Kelvin"
print "% Beta = A*x^3 + B*x^2 + C*x + D"
print sprintf("\\newcommand{\\ntcbetakelvinA}{%.10f}", A)
print sprintf("\\newcommand{\\ntcbetakelvinB}{%.10f}", B)
print sprintf("\\newcommand{\\ntcbetakelvinC}{%.10f}", C)
print sprintf("\\newcommand{\\ntcbetakelvinD}{%.10f}", D)
print sprintf("\\newcommand{\\ntcbetakelvinRsqr}{%.10f}", R2)
print sprintf("\\newcommand{\\ntcbetakelvintwofive}{%.10f}", beta(273.15+25.0))
print sprintf("\\newcommand{\\ntcbetakelvintwofiveonedec}{%.1f}", beta(273.15+25.0))
print sprintf("\\newcommand{\\ntcbetakelvintwofiveint}{%d}", beta(273.15+25.0)+0.5)

set output
