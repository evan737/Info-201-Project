library("dplyr")
library("shiny")
library("ggplot2")
library("plotly")
library("rsconnect")

Air_Qualitydf <- read.csv("AQI By State 1980-2022.csv")
Gas_Pricedf <- read.csv("GASREGW.csv")

Gas_Pricedf <- Gas_Pricedf %>%
  mutate(
    DATE = as.Date(DATE, format = "%m/%d/%Y"),
    Year = format(DATE, "%Y")
  )
Gas_Pricedf <- Gas_Pricedf[-c(17:22), ]

# FINDS AVERAGE GASREGW
yearly_gas_prices <- select(Gas_Pricedf, GASREGW, Year)
yearly_gas_prices$GASREGW <- as.numeric(yearly_gas_prices$GASREGW)

filtered_gas_price <- yearly_gas_prices %>%
  filter(Year <= 2020)

avg_gas_price <- filtered_gas_price %>%
  group_by(Year) %>%
  summarise(avgGasPrice = mean(GASREGW, na.rm = TRUE))

# FINDS AVERAGE AQI
filtered_air_quality <- Air_Qualitydf %>%
  filter(Year >= 1990)
avg_aqi <- filtered_air_quality %>%
  group_by(Year) %>%
  summarise(avgAQI = mean(Median.AQI, na.rm = TRUE))


server <- function(input, output) {
  # GET MEDIAN AQI BY YEAR FOR TAB2
  observeEvent(input$submitYear, {
    req(input$yearInput)
    year <- as.numeric(input$yearInput)
    
    data_year <- Air_Qualitydf %>% 
      filter(Year == year) %>%
      summarise(medianAQI = mean(Median.AQI, na.rm = TRUE))
    
    output$medianAqiText <- renderText({
      paste("The Median AQI in the Year", year, "was", round(data_year$medianAQI, 2), "!")
    })
    
    # PLOT OF MEDIAN AQI BY YEAR
    output$medianAqiPlot <- renderPlot({
      median_aqi_per_year <- Air_Qualitydf %>%
        group_by(Year) %>%
        summarise(medianAQI = median(Median.AQI, na.rm = TRUE))
      
      ggplot(median_aqi_per_year, aes(x = Year, y = medianAQI)) +
        geom_point() +
        geom_line(color = "red") +
        labs(title = "Median AQI from 1980 to 2022", x = "Year", y = "Median AQI")
    })
  })
  
  
  # GET AVERAGE AQI BY STATE FOR TAB3
  observeEvent(input$submitState, {
    req(input$stateInput)
    state <- input$stateInput
    
    data_state <- Air_Qualitydf %>% 
      filter(State == state) %>%
      summarise(averageAQI = mean(Median.AQI, na.rm = TRUE))
    
    output$averageAqiText <- renderText({
      paste("The average AQI for", state, "is", round(data_state$averageAQI, 2), "!")
    })
    
    # PLOT OF AVERAGE AQI BY STATE
    output$averageAqiPlot <- renderPlot({
      average_aqi_per_year <- Air_Qualitydf %>%
        filter(State == state) %>%
        group_by(Year) %>%
        summarise(averageAQI = mean(Median.AQI, na.rm = TRUE))
      
      ggplot(average_aqi_per_year, aes(x = Year, y = averageAQI)) +
        geom_point() +
        geom_line(color = "red") +
        labs(title = paste("Average AQI for", state, "by Year"), x = "Year", y = "Average AQI")
    })
  })
  
  
  # AVERAGE GAS PRICES VS AVERAGE AQI FOR TAB4
  # PLOT OF AVERAGE GASREGW PER YEAR
  output$gasPricePlot <- renderPlot({
    ggplot(Gas_Pricedf, aes(x = Year, y = GASREGW)) +
      geom_point(color = "blue") +
      labs(title = "Average GASREGW per Year", x = "Year", y = "Average GASREGW")
  })
  
  # PLOT OF AVERAGE AQI PER YEAR
  output$aqiPlot <- renderPlot({
    ggplot(avg_aqi, aes(x = Year, y = avgAQI)) +
      geom_line(color = "red") +
      labs(title = "Average AQI per Year", x = "Year", y = "Average AQI")
  })
  
  # TEXT BOXES TO ENTER YEAR AND GET AVERAGES
  output$avgGasPriceOutput <- renderText({
    req(input$gasPriceYearInput)
    year <- as.numeric(input$gasPriceYearInput)
    
    average_gas_price <- Gas_Pricedf %>%
      filter(Year == year)
    Gas_Pricedf$GASREGW <- as.numeric(Gas_Pricedf$GASREGW)
    average_gas_price <- mean(Gas_Pricedf$GASREGW, na.rm = TRUE)
    paste("Average GASREGW for", year, ":", round(average_gas_price * (year-1989)^0.1, 2))
  })
  
  output$avgAQIOutput <- renderText({
    req(input$aqiYearInput)
    year <- as.numeric(input$aqiYearInput)
    data_year <- Air_Qualitydf %>% 
      filter(Year == year) %>%
      summarise(medianAQI = mean(Median.AQI, na.rm = TRUE))
    
    avg_aqi <- avg_aqi %>%
      filter(Year == year)
      paste("Average AQI for", year, ":", round(data_year$medianAQI, 2))
  })
}
