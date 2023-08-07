# simpleLLE

library(shiny)
library(shinythemes)

ui = navbarPage("AC 3.0: Liquid-Liquid Extractions",
                theme = shinytheme("journal"),
                header = tags$head(
                  tags$link(rel = "stylesheet",
                            type = "text/css",
                            href = "style.css")
                ),
                tabPanel("Introduction",
                  fluidRow(
                    column(width = 6,
                     wellPanel(
                       includeHTML("text/introduction.html")
                )       
                ),
                    column(width = 6,
                           align = "center",
                    img(src = "sepfun.png",height = "400px"),
                    br(),
                    br(),
                    br(),
                    img(src = "LLE_WA.png", height = "200px")
                )
                )         
                ),
                
                tabPanel("Simple LLE",
                  fluidRow(
                    column(width = 6,
                     wellPanel(
                       includeHTML("text/simpleLLE.html"))       
                  ),
                    column(width = 6,
                           align = "center",
                      splitLayout(
                    sliderInput("dist", "log(D)", 
                                min = -2, max = 2, value = 0, step = 0.01,
                                ticks = FALSE, width = "150px"),
                    sliderInput("vaq","mL aqueous phase",
                                min = 1, max = 50, value = 25, step = 0.1,
                                ticks = FALSE, width = "150px"),
                    sliderInput("vorg","mL organic phase",
                                min = 1, max = 50, value = 25, step = 0.1,
                                ticks = FALSE, width = "150px"),
                    sliderInput("numext","number of extractions",
                                min = 1, max= 10, value = 1, step = 1,
                                ticks = FALSE, width = "150px")
                  ),
                  plotOutput("simpleLLE", height = "700px")
                  )
                  )       
                  ), # close tabpanel
                  
                tabPanel("LLE of a Weak Acid",
                  fluidRow(
                    column(width = 6,
                      wellPanel(
                        includeHTML("text/lle_weakacid.html")
                      )
                  ),
                    column(width = 6,
                          align = "center",
                      splitLayout(
                        sliderInput("dist_wa","log(partition constant)", 
                                    min = -2, max = 2, value = 0, step = 0.01,
                                    ticks = FALSE, width = "150px"),
                        sliderInput("vaq_wa","mL aqueous phase",
                                    min = 1, max = 50, value = 25,
                                    ticks = FALSE, width = "150px"),
                        sliderInput("vorg_wa","mL organic phase",
                                    min = 1, max = 50, value = 25,
                                    ticks = FALSE, width = "150px"),
                        sliderInput("numext_wa","number of extractions",
                                    min = 1, max= 10, value = 1, step = 1,
                                    ticks = FALSE, width = "150px")
                  ),
                    splitLayout(
                      sliderInput("pka", "weak acid's pKa",
                                  min = 0, max = 14, value = 7, step = 0.01,
                                  ticks = FALSE, width = "250px"),
                      sliderInput("ph", "pH of aqueous layer",
                                  min = 0, max = 14, value = 4, step = 0.01,
                                  ticks = FALSE, width = "250px")
                    ),
                  plotOutput("lle_wa", height = "700px"),
                  )
                  )   
                  ),
                
                tabPanel("LLE of a Weak Base",
                  fluidRow(
                    column(width = 6,
                      wellPanel(
                      includeHTML("text/lle_weakbase.html")
                  )
                  ),
                    column(width = 6,
                           align = "center",
                      splitLayout(
                        sliderInput("dist_wb", "log(partition constant)",
                                    min = -2, max = 2, value = 0, step = 0.01,
                                    ticks = FALSE, width = "150px"), 
                        sliderInput("vaq_wb", "mL aqueous phase",
                                    min = 1, max = 50, value = 25, step = 0.01,
                                    ticks = FALSE, width = "150px"),
                        sliderInput("vorg_wb", "mL organic phase",
                                    min = 1, max = 50, value = 25, step = 0.01,
                                    ticks = FALSE, width = "150px"),
                        sliderInput("numext_wb", "number of extractions",
                                    min = 1, max = 10, value = 1, step = 1,
                                    ticks = FALSE, width = "150px")
                  ),
                      splitLayout(
                         sliderInput("pkb", "weak base's pKb", 
                                     min = 0, max = 14, value = 7, step = 0.01,
                                     ticks = FALSE, width = "250px"),
                         sliderInput("ph_wb", "pH of aqueous layer",
                                     min = 0, max = 14, value = 10, step = 0.01,
                                     ticks = FALSE, width = "250px")
                  ),

                    plotOutput("lle_wb", height = "700px"),
                  )
                  )     
                  ),
                
                tabPanel("Wrapping Up",
                  fluidRow(
                    column(width = 6,
                    wellPanel(id = "wrapuppanel",
                              style = "overflow-y:scroll; max-height:750px",
                      includeHTML("text/wrapup.html")
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
