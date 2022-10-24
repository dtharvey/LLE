# simpleLLE

library(shiny)
library(shinythemes)
library(gt)

# place for files and scripts

# set colors
palette("Okabe-Ito")

shinyServer(function(input,output){
 
 output$results_table = render_gt({
   
  n = input$numext
  vol_org = input$vorg
  vol_orgn = input$vorg/n
  vol_aq = input$vaq
  Qaq1 = (vol_aq/(input$dist * vol_org + vol_aq))
  Qorg1 = 1 - Qaq1
  Qaqn = (vol_aq/(input$dist * vol_orgn + vol_aq))^n
  Qorgn = 1 - Qaqn
  phase = c("organic", "aqueous")
  A_initial = c(0,100)
  A1 = c(100*Qorg1,100*Qaq1)
  An = c(100*Qorgn, 100*Qaqn)
  df = data.frame(phase, A_initial, A1, An)
  t = gt(df) %>% 
    fmt_number(columns = 2:4, decimals = 2, drop_trailing_zeros = FALSE) %>%
    tab_spanner(label = "%analyte recovered in aqueous and organic phase when using", columns = c(2,3,4)) %>%
    cols_label(phase = "phase",
               A_initial = "no extractions",
               A1 = paste("1 extraction with ", round(vol_org,2)," mL"),
               An = paste(n, " extraction(s) with", 
                          round(vol_orgn,2), " mL")) %>%
    tab_header("Results of Extraction from Aqueous Phase to Organic Phase") %>%
    tab_footnote(footnote = md("For *n* > 1, the volume of organic phase is equally split between the *n* extractions."), 
                 locations = cells_column_labels(An))
  t
 }, width = "600px")
 
 output$lle_wa = render_gt({
   
   n = input$numext_wa
   vol_org = input$vorg_wa
   vol_orgn = input$vorg_wa/n
   vol_aq = input$vaq_wa
   dist_wa = input$dist_wa
   h3o = 10^(-input$ph)
   ka = 10^(-input$pka)
   d_wa = (dist_wa * h3o)/(h3o + ka)
   Qaq1_wa = (vol_aq/(d_wa * vol_org + vol_aq))
   Qorg1_wa = 1 - Qaq1_wa
   Qaqn_wa = (vol_aq/(d_wa * vol_orgn + vol_aq))^n
   Qorgn_wa = 1 - Qaqn_wa
   phase = c("organic", "aqueous")
   HA_initial = c(0,100)
   HA1 = c(100*Qorg1_wa,100*Qaq1_wa)
   HAn = c(100*Qorgn_wa, 100*Qaqn_wa)
   df = data.frame(phase, HA_initial, HA1, HAn)
   
   t_wa = gt(df) %>% 
     fmt_number(columns = 2:4, decimals = 2, drop_trailing_zeros = FALSE) %>%
     tab_spanner(label = "%analyte recovered in aqueous and organic phase when using", columns = c(2,3,4)) %>%
     cols_label(phase = "phase",
                HA_initial = "no extractions",
                HA1 = paste("1 extraction with ", round(vol_org,2)," mL"),
                HAn = paste(n, " extraction(s) with", 
                           round(vol_orgn,2), " mL")) %>%
     tab_header("Results of Extraction from Aqueous Phase to Organic Phase") %>%
     tab_footnote(footnote = md("For *n* > 1, the volume of organic phase is equally split between the *n* extractions."), 
                  locations = cells_column_labels(HAn))
   t_wa
   
 },
 width = "600px"
 )
 
 output$lle_wb = render_gt({
   
   n = input$numext_wb
   vol_org = input$vorg_wb
   vol_orgn = input$vorg_wb/n
   vol_aq = input$vaq_wb
   dist_wb = input$dist_wb
   h3o = 10^(-input$ph_wb)
   oh = 1e-14/h3o
   kb = 10^(-input$pkb) 
   
   d_wb = (dist_wb * oh)/(oh + kb)
   Qaq1_wb = (vol_aq/(d_wb * vol_org + vol_aq))
   Qorg1_wb = 1 - Qaq1_wb
   Qaqn_wb = (vol_aq/(d_wb * vol_orgn + vol_aq))^n
   Qorgn_wb = 1 - Qaqn_wb
   
   phase = c("organic", "aqueous")
   B_initial = c(0,100)
   B1 = c(100*Qorg1_wb,100*Qaq1_wb)
   Bn = c(100*Qorgn_wb, 100*Qaqn_wb)
   df = data.frame(phase, B_initial, B1, Bn)
   
   t_wb = gt(df) %>% 
     fmt_number(columns = 2:4, decimals = 2, drop_trailing_zeros = FALSE) %>%
     tab_spanner(label = "%analyte recovered in aqueous and organic phase when using", columns = c(2,3,4)) %>%
     cols_label(phase = "phase",
                B_initial = "no extractions",
                B1 = paste("1 extraction with ", round(vol_org,2)," mL"),
                Bn = paste(n, " extraction(s) with", 
                            round(vol_orgn,2), " mL")) %>%
     tab_header("Results of Extraction from Aqueous Phase to Organic Phase") %>%
     tab_footnote(footnote = md("For *n* > 1, the volume of organic phase is equally split between the *n* extractions."), 
                  locations = cells_column_labels(Bn))
   t_wb
   
 },
 width = "600px"
 )
 

  
}) # close server
