install.packages("shiny")
library(shiny)
library(dplyr)

Air_Qualitydf <- read.csv("AQI By State 1980-2022.csv")
Gas_Pricedf <- read.csv("GASREGW.csv")

Gas_Pricedf$DATE <- as.Date(Gas_Pricedf$DATE, format = "%m/%d/%Y")
Gas_Pricedf$Year <- format(Gas_Pricedf$DATE, "%Y")

avg_prices <- aggregate(GASREGW ~ Year, data = Gas_Pricedf, FUN = mean, na.rm = TRUE)
Gas_Pricedf$GASREGW <- as.numeric(as.character(Gas_Pricedf$GASREGW))

avg_aqi <- aggregate(Median.AQI ~ Year, data = Air_Qualitydf, FUN = mean, na.rm = TRUE)
Air_Qualitydf$Median.AQI <- as.numeric(as.character(Air_Qualitydf$Median.AQI))

average_aqi <- avg_aqi[-(1:10),]
average_prices <- avg_prices[-(34:35),]
combined_df <- merge(average_prices, average_aqi, by = "Year")
