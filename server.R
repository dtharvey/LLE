# simpleLLE

library(shiny)
library(shinythemes)

# place for files and scripts

# set colors
palette("Okabe-Ito")

shinyServer(function(input,output){
  
  output$simpleLLE = renderPlot({
    # parameters
    dist_ratio = 10^input$dist
    vol_aq = input$vaq
    vol_org = input$vorg
    num_extract = input$numext
    q_aq = round((vol_aq/(dist_ratio*vol_org + vol_aq))^num_extract, digits = 3)
    q_org = round(1 - q_aq, digits = 3)
    
    # phases
    x_aqorig = c(1,5,5,1)
    y_aqorig = c(2,2,6,6)
    x_orgorig = c(1,5,5,1)
    y_orgorig = c(6,6,10,10)
    x_aq = c(7,11,11,7)
    y_aq = c(2,2,6,6)
    x_org = c(7,11,11,7)
    y_org = c(6,6,10,10)
    
    par(mar = c(5,1,0,1))
    plot(x = -2,y = -2, asp = 1, pch = 19, 
         col = "blue", xaxt = "n", yaxt = "n", xlim = c(0,12),
         ylim = c(0,12), ylab = "", xlab = "", bty = "n")
    polygon(x_aqorig, y_aqorig, border = 1, 
            col = rgb(86,180,233, 255, maxColorValue = 255))
    polygon(x_orgorig, y_orgorig, border = 1, 
            col = rgb(86,180,233,0, maxColorValue = 255))
    polygon(x_aq, y_aq, border = 1, 
            col = rgb(86,180,233,q_aq*255, maxColorValue = 255))
    polygon(x_org, y_org, border = 1, 
            col = rgb(86,180,233,q_org*255, maxColorValue = 255))
    text(x = 9, y = 4, bquote(Q[aq] == .(q_aq)), cex = 2, adj = c(0.5,0.5))
    text(x = 9, y = 8, bquote(Q[org] == .(q_org)), cex = 2, adj = c(0.5,0.5))
    text(x = 3, y = 4, bquote(Q[aq] == 1), cex = 2, adj = c(0.5,0.5))
    text(x = 3, y = 8, bquote(Q[org] == 0), cex = 2, adj = c(0.5,0.5))
    text(x = 1.1, y = 2.2, "aqueous phase", pos = 4, cex = 1.5)
    text(x = 7.1, y = 2.2, "aqueous phase", pos = 4, cex = 1.5)
    text(x = 10.9, y = 9.7, "organic phase", pos = 2, cex = 1.5)
    text(x = 4.9, y = 5.7, "organic phase", pos = 2, cex = 1.5)
    text(x = 3, y = 10.4, "before extraction", adj = c(0.5,0.5), cex = 2)
    text(x = 9, y = 10.4, "after extraction", adj = c(0.5,0.5), cex = 2)
  })
  
  output$lle_wa = renderPlot({
    
    # parameters
    part_const = 10^input$dist_wa
    vol_aq = input$vaq_wa
    vol_org = input$vorg_wa
    num_extract = input$numext_wa
    ka = 10^-input$pka
    h3o = 10^-input$ph
    dist_ratio = part_const * h3o/(h3o + ka)
    q_aq = round((vol_aq/(dist_ratio*vol_org + vol_aq))^num_extract, digits = 3)
    q_org = round(1 - q_aq, digits = 3)
    
    # phases
    x_aqorig = c(1,5,5,1)
    y_aqorig = c(2,2,6,6)
    x_orgorig = c(1,5,5,1)
    y_orgorig = c(6,6,10,10)
    x_aq = c(7,11,11,7)
    y_aq = c(2,2,6,6)
    x_org = c(7,11,11,7)
    y_org = c(6,6,10,10)
    
    par(mar = c(5,1,0,1))
    plot(x = -2,y = -2, asp = 1, pch = 19, 
         col = "blue", xaxt = "n", yaxt = "n", xlim = c(0,12),
         ylim = c(0,12), ylab = "", xlab = "", bty = "n")
    polygon(x_aqorig, y_aqorig, border = 1, 
            col = rgb(86,180,233, 255, maxColorValue = 255))
    polygon(x_orgorig, y_orgorig, border = 1, 
            col = rgb(86,180,233,0, maxColorValue = 255))
    polygon(x_aq, y_aq, border = 1, 
            col = rgb(86,180,233,q_aq*255, maxColorValue = 255))
    polygon(x_org, y_org, border = 1, 
            col = rgb(86,180,233,q_org*255, maxColorValue = 255))
    text(x = 9, y = 4, bquote(Q[aq] == .(q_aq)), cex = 2, adj = c(0.5,0.5))
    text(x = 9, y = 8, bquote(Q[org] == .(q_org)), cex = 2, adj = c(0.5,0.5))
    text(x = 3, y = 4, bquote(Q[aq] == 1), cex = 2, adj = c(0.5,0.5))
    text(x = 3, y = 8, bquote(Q[org] == 0), cex = 2, adj = c(0.5,0.5))
    text(x = 1.1, y = 2.2, "aqueous phase", pos = 4, cex = 1.5)
    text(x = 7.1, y = 2.2, "aqueous phase", pos = 4, cex = 1.5)
    text(x = 10.9, y = 9.7, "organic phase", pos = 2, cex = 1.5)
    text(x = 4.9, y = 5.7, "organic phase", pos = 2, cex = 1.5)
    text(x = 3, y = 10.4, "before extraction", adj = c(0.5,0.5), cex = 2)
    text(x = 9, y = 10.4, "after extraction", adj = c(0.5,0.5), cex = 2)
    
  })
 
 output$lle_wb = renderPlot({
   
   # parameters
   part_const = 10^input$dist_wb
   vol_aq = input$vaq_wb
   vol_org = input$vorg_wb
   num_extract = input$numext_wb
   kb = 10^-input$pkb
   h3o = 10^-input$ph_wb
   oh = 1e-14/h3o
   dist_ratio = part_const * oh/(oh + kb)
   q_aq = round((vol_aq/(dist_ratio*vol_org + vol_aq))^num_extract, digits = 3)
   q_org = round(1 - q_aq, digits = 3)
   
   # phases
   x_aqorig = c(1,5,5,1)
   y_aqorig = c(2,2,6,6)
   x_orgorig = c(1,5,5,1)
   y_orgorig = c(6,6,10,10)
   x_aq = c(7,11,11,7)
   y_aq = c(2,2,6,6)
   x_org = c(7,11,11,7)
   y_org = c(6,6,10,10)
   
   par(mar = c(5,1,0,1))
   plot(x = -2,y = -2, asp = 1, pch = 19,
        col = "blue", xaxt = "n", yaxt = "n", xlim = c(0,12),
        ylim = c(0,12), ylab = "", xlab = "", bty = "n")
   polygon(x_aqorig, y_aqorig, border = 1,
           col = rgb(86,180,233, 255, maxColorValue = 255))
   polygon(x_orgorig, y_orgorig, border = 1,
           col = rgb(86,180,233,0, maxColorValue = 255))
   polygon(x_aq, y_aq, border = 1,
           col = rgb(86,180,233,q_aq*255, maxColorValue = 255))
   polygon(x_org, y_org, border = 1,
           col = rgb(86,180,233,q_org*255, maxColorValue = 255))
   text(x = 9, y = 4, bquote(Q[aq] == .(q_aq)), cex = 2, adj = c(0.5,0.5))
   text(x = 9, y = 8, bquote(Q[org] == .(q_org)), cex = 2, adj = c(0.5,0.5))
   text(x = 3, y = 4, bquote(Q[aq] == 1), cex = 2, adj = c(0.5,0.5))
   text(x = 3, y = 8, bquote(Q[org] == 0), cex = 2, adj = c(0.5,0.5))
   text(x = 1.1, y = 2.2, "aqueous phase", pos = 4, cex = 1.5)
   text(x = 7.1, y = 2.2, "aqueous phase", pos = 4, cex = 1.5)
   text(x = 10.9, y = 9.7, "organic phase", pos = 2, cex = 1.5)
   text(x = 4.9, y = 5.7, "organic phase", pos = 2, cex = 1.5)
   text(x = 3, y = 10.4, "before extraction", adj = c(0.5,0.5), cex = 2)
   text(x = 9, y = 10.4, "after extraction", adj = c(0.5,0.5), cex = 2)
   
 })
 

  
}) # close server
