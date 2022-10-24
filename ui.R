# simpleLLE

library(shiny)
library(shinythemes)
library(gt)

ui = navbarPage("AC 3.0: Liquid-Liquid Extractions",
                theme = shinytheme("journal"),
                tags$head(
                  tags$link(rel = "stylesheet",
                            type = "text/css",
                            href = "style.css")
                ),
                tabPanel("Introduction",
                  fluidRow(
                    column(width = 6,
                     wellPanel(
                       includeHTML("introduction.html")
                )       
                ),
                    column(width = 6,
                           align = "center",
                           br(),
                           br(),
                           br(),
                    img(src = "sepfun.png",height = "500px")
                )
                )         
                ),
                
                tabPanel("Simple LLE",
                  fluidRow(
                    column(width = 6,
                     wellPanel(
                       includeHTML("simpleLLE.html"))       
                  ),
                    column(width = 6,
                           align = "center",
                      splitLayout(
                    sliderInput("dist","distribution ratio", 
                                min = 0.1, max = 10, value = 1,
                                width = "150px"),
                    sliderInput("vaq","mL aqueous phase",
                                min = 1, max = 50, value = 25,
                                width = "150px"),
                    sliderInput("vorg","mL organic phase",
                                min = 1, max = 50, value = 25,
                                width = "150px"),
                    sliderInput("numext","number of extractions",
                                min = 1, max= 10, value = 1, step = 1,
                                width = "150px")
                  ),
                  br(),
                  br(),
                  gt_output("results_table"),
                  br(),
                  br(),
                  img(src = "simpleLLE.png", height = "250px")
                  )
                  )       
                  ), # close tabpanel
                  
                tabPanel("LLE of a Weak Acid",
                  fluidRow(
                    column(width = 6,
                      wellPanel(
                        includeHTML("lle_weakacid.html")
                      )
                  ),
                    column(width = 6,
                          align = "center",
                      splitLayout(
                        sliderInput("dist_wa","partition constant", 
                                    min = 0.1, max = 10, value = 1,
                                    width = "150px"),
                        sliderInput("vaq_wa","mL aqueous phase",
                                    min = 1, max = 50, value = 25,
                                    width = "150px"),
                        sliderInput("vorg_wa","mL organic phase",
                                    min = 1, max = 50, value = 25,
                                    width = "150px"),
                        sliderInput("numext_wa","number of extractions",
                                    min = 1, max= 10, value = 1, step = 1,
                                    width = "150px")
                  ),
                    splitLayout(
                      sliderInput("pka", "weak acid's pKa",
                                  min = 0, max = 14, value = 7,
                                  width = "250px"),
                      sliderInput("ph", "pH of aqueous layer",
                                  min = 0, max = 14, value = 4,
                                  width = "250px")
                    ),
                  br(),
                  br(),
                  gt_output("lle_wa"),
                  br(),
                  br(),
                  img(src = "LLE_WA.png", height = "250px")
                  )
                  )   
                  ),
                
                tabPanel("LLE of a Weak Base",
                  fluidRow(
                    column(width = 6,
                      wellPanel(
                      includeHTML("lle_weakbase.html")
                  )
                  ),
                    column(width = 6,
                           align = "center",
                      splitLayout(
                        sliderInput("dist_wb", "partition coefficient",
                                    min = 0.1, max = 10, value = 1,
                                    width = "150px"),
                        sliderInput("vaq_wb", "mL aqueous phase",
                                    min = 1, max = 50, value = 25,
                                    width = "150px"),
                        sliderInput("vorg_wb", "mL organic phase",
                                    min = 0.1, max = 50, value = 25,
                                    width = "150px"),
                        sliderInput("numext_wb", "number of extractions",
                                    min = 1, max = 10, value = 1, step = 1,
                                    width = "150px")
                  ),
                      splitLayout(
                         sliderInput("pkb", "weak base's pKb", 
                                     min = 0, max = 14, value = 7,
                                     width = "250px"),
                         sliderInput("ph_wb", "pH of aqueous layer",
                                     min = 0, max = 14, value = 10,
                                     width = "250px")
                  ),
                    br(),
                    br(),
                    gt_output("lle_wb"),
                    br(),
                    br(),
                    img(src = "LLE_WB.png", height = "250px")
                  )
                  )     
                  ),
                
                tabPanel("Problems",
                  fluidRow(
                    column(width = 6,
                    wellPanel(
                      includeHTML("problems.html")
                    )             
                  ),
                    column(width = 6,
                           align = "center",
                           br(),
                           br(),
                           br(),
                           br(),
                      img(src = "iodine.png", height = "250px"),
                      br(),
                      br(),
                      br(),
                      br(),
                      img(src = "metal_ligand.png", height = "250px")
                  )
                  )
                  )
  
  
  
) # close navbarpage
