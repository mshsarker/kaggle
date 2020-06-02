# We are so unlucky that Mike Chapple has only one course in R in Lynda.com
# This project is from his "Data Wrangling with R"
# Though i recomment to have some basic R programming before reviewing his course.

library(tidyverse)
library(lubridate)
library(stringr)


#get the austin water data from http://59444.youcanlearnit.net
waterfall <- read.csv("austinwater.csv")
glimpse(waterfall)
water <- tibble('siteName'=waterfall$SITE_NAME, 'siteType'=waterfall$SITE_TYPE, 'sampleTime'=waterfall$SAMPLE_DATE, 'parameterType'=waterfall$PARAM_TYPE, 'parameter'=waterfall$PARAMETER, 'result'=waterfall$RESULT, 'unit'=waterfall$UNIT)
glimpse(water)


unique(water$parameter)
unique(water[which(str_detect(water$parameter, 'PH')),]$parameter)



unique(water$parameterType)
filtered_water <- subset(water, (parameterType == 'Alkalinity/Hardness/pH') | (parameterType == 'Conventionals'))
glimpse(filtered_water)


unique(filtered_water$parameter)
filtered_water <- subset(filtered_water, (parameter == 'PH') | (parameter == 'WATER TEMPERATURE'))
glimpse(filtered_water)
summary(filtered_water)
filtered_water$sampleTime <- mdy_hms(filtered_water$sampleTime)







