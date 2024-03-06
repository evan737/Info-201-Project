## TAB 1: INTRODUCTION
introduction_tab <- tabPanel("Introduction", 
                             fluidPage(
                               img("", src = "https://wallpapercave.com/wp/wp6100468.jpg", height = "300px", width = "100%", style = "object-fit: cover;"),
                               h1("Welcome to the Air Quality Analysis App"),
                               p("This app provides insights into air quality across different states, years, and its correlation with gas prices.")
                             ))

## TAB 2: MEDIAN AQI BY YEAR
tab_2 <- tabPanel("Median AQI by Year",
                  fluidPage(
                    fluidRow(
                      column(5,
                        textInput("yearInput", "Enter Year", value = "2020"),
                        actionButton("submitYear", "Get Median AQI")
                      ),
                      column(7,
                        style = "margin-top: 40px; color: blue; font-size: 20px",
                        textOutput("medianAqiText")
                      )
                    ),
                    fluidRow(
                      column(12,
                        style = "margin-top: 20px;",
                        textOutput("medianAqiStatement")
                      )
                    ),
                    plotOutput("medianAqiPlot")
                  ))

## TAB 3: AVERAGE AQI BY STATE
states <- unique(Air_Qualitydf$State)
tab_3 <- tabPanel("Average AQI by State",
                  fluidPage(
                    fluidRow(
                      column(5,
                             selectInput("stateInput", "Select State", choices = states),
                             actionButton("submitState", "Get Average AQI")
                      ),
                      column(7,
                             style = "margin-top: 40px; color: blue; font-size: 20px",
                             textOutput("averageAqiText")
                      )
                    ),
                    fluidRow(
                      column(12,
                             style = "margin-top: 20px",
                             plotOutput("averageAqiPlot")
                      )
                    )
                  ))

## TAB 4: AQI BY GAS PRICE
tab_4 <- tabPanel("AQI by Gas Price",
                  fluidPage(
                    fluidRow(
                      column(6,
                        textInput("gasPriceYearInput", "Enter Year for GASREGW", value = ""),
                        textOutput("avgGasPriceOutput")
                      ),
                      column(6,
                        textInput("aqiYearInput", "Enter Year for AQI", value = ""),
                        textOutput("avgAQIOutput")
                      )
                    ),
                    fluidRow(
                      column(6,
                        style = "margin-top: 20px;",
                        plotOutput("gasPricePlot")
                      ),
                      column(6,
                        style = "margin-top: 20px;",
                        plotOutput("aqiPlot")
                      )
                    )
                  ))

## TAB 5: CONCLUSION
tabPanel("Conclusion",
         fluidPage(
           h1("Conclusion"),
           p("Some conclusions...")
         ))

ui <- navbarPage("The Link between Gas Prices and Air Quality",
  introduction_tab,
  tab_2,
  tab_3,
  tab_4,
  conclusion_tab
)
