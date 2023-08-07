simpleLLE = function(initconc_a = 60,
                     initconc_i = 2000, 
                     K_ai = 0.006321, 
                     kd_a = 0.1,
                     kd_i = 10,
                     num_extract = 5,
                     vol_aq = 25,
                     vol_org = 25){
  
# create sequence for number of extractions   
  n = seq(1, num_extract)
  
# calculate volume of organic phase for each n
  vol_org = vol_org/n
    
# calculate fraction of analyte and interferent in each phase; 
# values are equivalent to recoveries
    qaq_a = (vol_aq/(kd_a * vol_org + vol_aq))^n
    qorg_a = 1 - qaq_a
    qaq_i = (vol_aq/(kd_i * vol_org + vol_aq))^n
    qorg_i = 1 - qaq_i
    
# calculate the error for recovery of analyte in each phase
    error_aq = 100 * ((qaq_a - 1) + K_ai * initconc_i * qaq_i/initconc_a)
    error_org = 100 * ((qorg_a - 1) + K_ai * initconc_i * qorg_i/initconc_a)
    
# report results as a table of percent recoveries and percent errors, and as plots.
    results = data.frame(n, vol_aq, vol_org, 100*qaq_a, 
                         100*qaq_i, 100 * qorg_a, 
                         100 * qorg_i, error_aq, error_org)
    colnames(results) = c("Extractions", "Volume (aq)", "Volume (org)", 
                          "% recovery analyte (aq)", 
                          "% recovery interferent (aq)", 
                          "% recovery analyte (org)", 
                          "% recovery interferent (org)", 
                          "% error (aq)", "% error (org)")
    print(results, digits = 3, include.rownames = FALSE)
    
# plot recoveries and errors
    plot(n, 100 * qaq_a, type = "l", ylim = c(0, 100), 
         xlim = c(1, num_extract), lty = 1,
         xlab = "number of extractions", 
         ylab = "percent recovery", col = "blue")
    lines(n, 100 * qaq_i, lty = 1, col = "red")
    lines(n, 100 * qorg_a, lty = 2, col = "blue")
    lines(n, 100 * qorg_i, lty = 2, col = "red")
    legend(x = "right", 
           legend = c("A (aq)", "I (aq)", "A (org)", "I (org)"), 
           bty = "n", lty = c(1, 1, 2, 2), 
           col = c("blue", "red", "blue", "red"))
    
    plot(n, error_aq, type = "l", 
         ylim = c(min(c(error_aq,error_org)), max(c(error_aq,error_org))), 
         xlim = c(1, num_extract), xlab = "number of extractions", 
         ylab = "net percent error in analysis for analyte", col = "blue")
    lines(n, error_org, lty = 1, col = "red")
    legend(x = "right", legend = c("aqueous phase", "organic phase"), 
           lty = c(1, 1), 
           col = c("blue", "red"), bty = "n")

}
