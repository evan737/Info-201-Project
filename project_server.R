
server <- function(input, output){
  
  # TODO Make outputs based on the UI inputs here
  
}

## DP 
library(shiny)
library(ggplot2)

aqi_data <- read.csv("AQI By State 1980-2022.csv")
gas_data <- read.csv("GASREGW.csv")

server <- function(input, output) {
  
  # function to filter AQI bases on user inputs
  filtered_data <- reactive({
    filtered <- aqi_data
    # filter selected state
    if (!is.null(input$selected_state) && input$selected_state != "All") {
      filtered <- filtered[filtered$State == input$selected_state, ]
    }
    # filter year range
    filtered <- filtered[filtered$Year >= input$start_year & filtered$Year <= input$end_year, ]
    return(filtered)
  })
  
  # reactive function 2 filter gas data on user inputs
  filtered_gas <- reactive({
    filtered <- gas_data
    # filter selected year range
    filtered <- filtered[filtered$DATE >= as.Date(input$start_date) & filtered$DATE <= as.Date(input$end_date), ]
    return(filtered)
  })
  
  # gas price trend plot
  output$gas_price_plot <- renderPlot({
    ggplot(filtered_gas(), aes(x = DATE, y = GASREGW.)) +
      geom_line() +
      labs(title = "Gas Prices Over Time", x = "Year", y = "Gas Price") +
      theme_minimal()
  })
  
  # public transportation trend plot
  output$public_transport_plot <- renderPlot({
    ggplot(filtered_data(), aes(x = Year, y = Days_CO)) +
      geom_line() +
      labs(title = "Days of CO Pollution Over Time", x = "Year", y = "Days of CO Pollution") +
      theme_minimal()
  })
  
  # scatterplot
  output$scatter_plot <- renderPlot({
    ggplot(filtered_data(), aes(x = Days_CO, y = GASREGW.)) +
      geom_point() +
      labs(title = "Days of CO Pollution vs Gas Price", x = "Days of CO Pollution", y = "Gas Price") +
      theme_minimal()
  })
  
}
