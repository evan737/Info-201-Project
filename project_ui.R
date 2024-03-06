## TAB 1: INTRODUCTION
introduction_tab <- tabPanel("Introduction", 
                             fluidPage(
                               img("", src = "https://wallpapercave.com/wp/wp6100468.jpg", height = "300px", width = "100%", style = "object-fit: cover;"),
                               h1("Welcome to the Air Quality Analysis App"),
                               p("This app provides insights into air quality across different states, years, and its correlation with gas prices.
                                 In a world full of pollution and climate change it has become imperative to take a step back and look at what can make a difference in pollution, whether that be with something in daily life such as cars or with entire industries such as farming.
                             This project looks at a relationship between the price of gas and air quality. During this project, we looked at three main questions: How does air quality vary from state to state? How does air quality vary from year to year? Does the price of gas have an inverse relationship with air quality index? 
                               We found two main sources that guided our study, https://www.kaggle.com/datasets/adampq/air-quality-index-by-state-1980-2022, and https://www.kaggle.com/datasets/juliatroni/us-gas-prices. The first data set provided insight into how air quality differs by state and how it differs from year to year. The data set from this source is extremely large and complex, and so our group worked to condense it and take only the necessary information from it. The second data set was about gas prices from 500 different gas stations throughout the country and averaged. The data is from every Monday for multiple decades.
                               With these two data sets, there are no real ethical issues posed. This is because it doesn't involve people, and it doesn't involve any sort of subjective data. The main limitation with the study would be found in the Air Quality data frame. The air quality index appears to be highly inflated, however it still provides a very accurate way to compare the air quality from state to state, year to year, and to different gas prices for each year.")
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
