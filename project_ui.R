# Intro Page
intro_tab <- tabPanel("Introduction",
                      fluidPage(
                        titlePanel(tags$span("Welcome to the Air Quality Analysis App", style = "color: blue; font-size: 45px;")),
                        sidebarLayout(
                          sidebarPanel(
                            h3("Introduction"),
                            p("Air pollution from vehicles is a pressing global issue, with detrimental effects on public health and the environment. By analyzing air quality data alongside gas prices, we gain valuable insights into potential correlations and trends."),
                            p("This app provides a user-friendly platform to explore the intricate dynamics between air quality and gas prices. Through visualizations and data analysis, users can uncover patterns, make informed decisions, and contribute to the ongoing discourse on sustainable transportation."),
                            p("Major questions we seek to answer include:"),
                            tags$ul(
                              tags$li("How does air quality vary by state?"),
                              tags$li("How does air quality vary by year?"),
                              tags$li("How does gas price affect air quality?")
                            ),
                            h3("Data Sources"),
                            p("We use the following datasets for analysis:"),
                            tags$ul(
                              tags$li(tags$a("Air Quality Index by State (1980-2022)", href = "https://www.kaggle.com/datasets/adampq/air-quality-index-by-state-1980-2022")),
                              tags$li(tags$a("Weekly Retail Gasoline and Diesel Prices (1990-Present)", href = "https://fred.stlouisfed.org/series/GASREGW"))
                            ),
                            h3("Ethical Considerations"),
                            p("The air quality data is sourced from annual census data and EPA records, while the gas price data is collected by the US Energy Information Administration. Possible ethical questions include privacy concerns related to census data usage and biases in EPA data collection.")
                          ),
                          mainPanel(
                            h3(""),
                            img(src = "https://cms.accuweather.com/wp-content/uploads/2023/06/ezgif.com-gif-maker-37.gif?w=632", height = 450, width = 500),
                            h3(""),
                            img(src = "data:image/jpeg;base64,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", height = 200, width = 500)
                          )
                        )
                      )
)

## OVERVIEW TAB INFO

overview_tab <- tabPanel("Overview Tab Title",
   h1("Some title"),
   p("some explanation")
)

## VIZ 1 TAB INFO

viz_1_sidebar <- sidebarPanel(
  h2("Options for graph"),
  #TODO: Put inputs for modifying graph here
)

viz_1_main_panel <- mainPanel(
  h2("Vizualization 1 Title"),
  # plotlyOutput(outputId = "your_viz_1_output_id")
)

viz_1_tab <- tabPanel("Viz 1 tab title",
  sidebarLayout(
    viz_1_sidebar,
    viz_1_main_panel
  )
)

## VIZ 2 TAB INFO

viz_2_sidebar <- sidebarPanel(
  h2("Options for graph"),
  #TODO: Put inputs for modifying graph here
)

viz_2_main_panel <- mainPanel(
  h2("Vizualization 2 Title"),
  # plotlyOutput(outputId = "your_viz_1_output_id")
)

viz_2_tab <- tabPanel("Viz 2 tab title",
  sidebarLayout(
    viz_2_sidebar,
    viz_2_main_panel
  )
)

## VIZ 3 TAB INFO

viz_3_sidebar <- sidebarPanel(
  h2("Options for graph"),
  #TODO: Put inputs for modifying graph here
)

viz_3_main_panel <- mainPanel(
  h2("Vizualization 3 Title"),
  # plotlyOutput(outputId = "your_viz_1_output_id")
)

viz_3_tab <- tabPanel("Viz 3 tab title",
  sidebarLayout(
    viz_3_sidebar,
    viz_3_main_panel
  )
)

# Conclusion
conclusion_tab <- tabPanel("Conclusion",
                           fluidPage(
                             titlePanel(tags$span("Key Takeaways", style = "color: orange; font-size: 60px;")),
                             sidebarLayout(
                               sidebarPanel(
                                 h3("Summary"),
                                 p("After thorough analysis of air quality data and gas prices, several key takeaways emerge:"),
                                 tags$ul(
                                   tags$li("Correlation between Gas Prices and Air Quality: Our analysis reveals a clear relationship between gas prices and air quality. Higher gas prices tend to correlate with lower levels of air pollution, suggesting that economic factors influence transportation behavior and emissions."),
                                   tags$li("Regional Disparities in Air Quality: Air quality varies significantly by region, highlighting the importance of localized interventions and policies. Areas with higher population density and traffic congestion tend to experience worse air quality."),
                                   tags$li("Impact of Policy Interventions: Policy measures, such as emission standards and incentives for alternative transportation, play a crucial role in improving air quality. Our analysis underscores the effectiveness of targeted interventions in reducing pollution levels.")
                                 )
                               ),
                               mainPanel(
                                 h3("Visualization Summary"),
                                 p("Below are the key visualizations that support our conclusions:"),
                                 tags$ol(
                                   tags$li("Median AQI by Year: This visualization demonstrates how air quality varies over time, allowing us to identify trends and potential drivers of pollution fluctuations."),
                                   tags$li("Average AQI by State: By examining average AQI across different states, we gain insights into regional differences and the impact of local factors on air quality."),
                                   tags$li("AQI by Gas Price: This visualization illustrates the relationship between gas prices and air quality, highlighting the influence of economic factors on pollution levels.")
                                 ),
                                 h3(""),
                                 img(src = "https://www.akcp.com/wp-content/uploads/2021/03/air-quality-1600x1000-1.jpg", height = 400, width = "100%"),  # Adjust the height and width as needed
                                 h3("Next Steps"),
                                 p("Moving forward, further research could explore additional factors influencing air quality, such as weather patterns, industrial activity, and urban planning. Additionally, evaluating the long-term impacts of policy interventions and assessing the feasibility of sustainable transportation solutions are important areas for future investigation.")
                               )
                             )
                           )
)

## UI

ui <- navbarPage("Air Quality Analysis App",
                 intro_tab,
                 overview_tab,
                 viz_1_tab,
                 viz_2_tab,
                 viz_3_tab,
                 conclusion_tab
)
