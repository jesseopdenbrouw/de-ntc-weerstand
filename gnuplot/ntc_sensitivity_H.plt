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
set output "ntc_sensitivity_H.pdf"

### Calculate mean to set some gnuplot internals
#mean(x)= m
#fit mean(x) 'GegevensBetatherm10K3A542I.dat' using 3:4 via m 
#SST = FIT_WSSR/(FIT_NDF+1)

# Do a fit using a power function:
lnA = 0.1
B = 5000.0
straightline(x) = B*x + lnA
fit straightline(x) "GegevensBetatherm10K3A542I.dat" using 3:4 via B, lnA
A = exp(lnA)
Ropt = 16218.0

### Caculcate some ...
#SSE=FIT_WSSR/(FIT_NDF)
#SSR=SST-SSE
#R2=SSR/SST

# Diff of H
H_diff(x) = (Ropt*A*B*exp(B/x))/((A*exp(B/x)+Ropt)**2*(x*x))

# Do the plot
set xrange [233:391]
set xlabel "T [K]" # offset 0,-1
set ylabel "diff H [K^-^1]" # offset -1
plot H_diff(x) title "" lc "blue" with lines #, "GegevensBetatherm10K3A542I.dat" using 3:4 with points pt 7 ps 0.2 lc "red" title "" 

# Create LaTeX file with parameters
set decimalsign locale
#set print "ntc_sensitivity_H_alpha.tex"
#print "% Curve fitting parameters for fitting straight line"
#print "% ln Rntc = B*x + A"
#print sprintf("\\newcommand{\\ntcsensitivityntcalphaabs}{%f}", ntc_diff(298.15))
#print sprintf("\\newcommand{\\ntcsensitivityntcalpha}{%f}", ntc_diff(298.15)/100.0)
#print sprintf("\\newcommand{\\ntcsensitivityntcalphatwodec}{%.2f}", ntc_diff(298.15)/100.0)
#print sprintf("\\newcommand{\\ntcshhstraightlineB}{%f}", B)
#print sprintf("\\newcommand{\\ntcshhstraightlineBonedec}{%.1f}", B)
#print sprintf("\\newcommand{\\ntcshhstraightlineBint}{%d}", B)
#print sprintf("\\newcommand{\\ntcshhstraightlineRsqr}{%f}", R2)

set output