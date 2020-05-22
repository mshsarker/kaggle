library("tidyverse")
library("zoo")

#Data Import
car_parts <- read_csv("~/OneDrive - C/WorkSpace/7. Career/Data Science/R programming/Practice/Challenge/CarParts/original.csv")


summary(car_parts)
head(car_parts)


# Changing Date column to date format
car_parts$Date <- as.character(car_parts$Date)
car_parts$Date <- parse_datetime(car_parts$Date)


# Converitng Category and Currency column as a factor
car_parts$Category <- as.factor(car_parts$Category)
car_parts$Currency <- as.factor(car_parts$Currency)


# Combining Name columns
car_parts <- car_parts %>% 
  unite("Name", FirstName, LastName, sep = ' ', remove = T)


# Replacing missing values in Sales and Profit column
which(is.na(car_parts$Sales))
car_parts %>% filter(is.na(Sales))
car_parts <- car_parts %>% 
  group_by(Currency) %>% 
  mutate(Sales = na.locf(Sales, na.rm = F))

which(is.na(car_parts$Profit))
car_parts %>% filter(is.na(Profit))
car_parts <- car_parts %>% 
  group_by(Currency) %>% 
  mutate(Profit = na.locf(Profit, na.rm = F))
   

# Converting other curriencies to USD
car_parts %>% filter(Currency == "CAD") %>%
  mutate(SalesUSD = Sales * 0.71) 

car_parts %>% filter(Currency == "AUD") %>%
  mutate(SalesUSD = Sales * 0.65) 

car_parts %>% filter(Currency == "NZD") %>%
  mutate(SalesUSD = Sales * 0.61) 














