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
set output "ntc_shh_straightline_fig.pdf"

### Calculate mean to set some gnuplot internals
mean(x)= m
fit mean(x) 'GegevensBetatherm10K3A542I.dat' using 3:4 via m 
SST = FIT_WSSR/(FIT_NDF+1)

# Do a fit using a power function:
A = 0.1
B = 0.1
straightline(x) = B*x + A
fit straightline(x) "GegevensBetatherm10K3A542I.dat" using 3:4 via B, A

### Caculcate some ...
SSE=FIT_WSSR/(FIT_NDF)

SSR=SST-SSE
R2=SSR/SST

# Do the plot
set yrange [5:14]
set xlabel "1/T [K^-^1]" # offset 0,-1
set ylabel "ln R_n_t_c [ln {/Symbol W}]" # offset -1
plot straightline(x) title "" lc "blue" with lines, "GegevensBetatherm10K3A542I.dat" using 3:4 with points pt 7 ps 0.2 lc "red" title "" 

# Output the parameters to an TeX file.
set print "ntc_shh_straightline_curve_fitting_params.tex"
print "% Curve fitting parameters for fitting straight line"
print "% ln Rntc = B*x + A"
foo = sprintf("\\newcommand{\\ntcshhstraightlinelnA}{%f}", A)
print foo
foo = sprintf("\\newcommand{\\ntcshhstraightlineA}{%f}", exp(A))
print foo
foo = sprintf("\\newcommand{\\ntcshhstraightlineB}{%f}", B)
print foo
foo = sprintf("\\newcommand{\\ntcshhstraightlineBonedec}{%.1f}", B)
print foo
foo = sprintf("\\newcommand{\\ntcshhstraightlineBint}{%d}", B)
print foo
foo = sprintf("\\newcommand{\\ntcshhstraightlineRsqr}{%f}", R2)
print foo

set output
