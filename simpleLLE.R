#' Choose values for the initial concentrations of analyte, interferent, and selectivity coefficient.
conc.ao = 60; conc.io = 2000; k.ai = 0.006321

#' Choose partition coefficients; assume partition coefficients are equivalent to the distribution ratio.
kd.a = 0.1; kd.i = 10

#' Choose number of extractions, total volumes for aqueous and organic phase.
n = seq(1, 5)
v.aq = 25; v.org = 25/n

#' Calculate fraction of analyte and interferent in each phase; values are equivalent to recoveries.
qaq.a = (v.aq/(kd.a*v.org + v.aq))^n
qaq.i = (v.aq/(kd.i*v.org + v.aq))^n
qorg.a = 1 - qaq.a
qorg.i = 1 - qaq.i

#' Calculate the error for the recovery of the analyte in each phase.
erroraq = 100 * ((qaq.a - 1) + k.ai * conc.io * qaq.i/conc.ao)
errororg = 100 * ((qorg.a - 1) + k.ai * conc.io * qorg.i/conc.ao)

#' Report out results as a table of percent recoveries and percent errors, and as plots.
results = data.frame(n, v.aq, v.org, 100*qaq.a, 100*qaq.i, 100*qorg.a, 
                     100*qorg.i, erroraq, errororg)
colnames(results) = c("Extract", "V(aq)", "V(org)", "%RA(aq)", "%RI(aq)", 
                      "%RA(org)", "%RI(org)", "%Error(aq)", "%Error(org)")
round(results, digits = 2)
plot(n, 100*qaq.a, type = "l", ylim = c(0, 100), xlim = c(1, 7), lty = 1,
     xlab = "number of extractions", ylab = "percent recovery", col = "blue")
lines(n, 100*qaq.i, lty = 1, col = "red")
lines(n, 100*qorg.a, lty = 2, col = "blue")
lines(n, 100*qorg.i, lty = 2, col = "red")
legend(x = "right", legend = c("A(aq)", "I(aq)", "A(org)", "I(org)"), bty = "n", 
       lty = c(1, 1, 2, 2), col = c("blue", "red", "blue", "red"))

plot(n, erroraq, type = "l", ylim = c(-100, 0), xlim = c(1, 7), xlab = "number of extractions", 
     ylab = "net percent error in analysis", col = "blue")
lines(n, errororg, lty = 1, col = "red")
legend(x = "right", legend = c("aqueous phase", "organic phase"), lty = c(1, 1), 
       col = c("blue", "red"), bty = "n")

