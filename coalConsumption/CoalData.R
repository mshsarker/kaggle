# We are so unlucky that Mike Chapple has only one course in R in Lynda.com
# This project is from his "Data Wrangling with R"
# Though i recomment to have some basic R programming before reviewing his course.


library(tidyverse)


coal <- read_csv("coal.csv")
glimpse(coal)
coal <- read_csv("coal.csv", skip = 2)
colnames(coal)[1] <- "region"


coal_long <- gather(coal, 'year', 'coal_consumption', -region)


coal_long$year <- as.integer(coal_long$year)
coal_long$coal_consumption <- as.numeric(coal_long$coal_consumption)


unique(coal_long$region)
noncountries <- c("North America", "Central & South America", "Antarctica", "Europe", "Eurasia", "Middle East", "Africa", "Asia & Oceania", "World")
matches <- which(!is.na(match(coal_long$region, noncountries)))
coal_country <- coal_long[-matches,]
coal_region <- coal_long[matches,]
unique(coal_country$region)
unique(coal_region$region)


ggplot(data = coal_region, mapping = aes(x=year, y=coal_consumption))+
  geom_line(mapping = aes(color=region))
