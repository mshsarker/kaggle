library(tidyverse)
library(corrplot)
library(lubridate)

bike <- read_csv("bikeshare.csv")

head(bike)
glimpse(bike)
summary(bike)


bike$season <- as.factor(bike$season)


ggplot(data = bike, aes(x = temp, y = count, color = temp))+
  geom_point(alpha = 0.3)

  
ggplot(data = bike, aes(x = datetime, y = count, color = temp))+
  geom_point(s)


cor.data <- bike[,c("count", "temp")]
corrplot(cor.data)


ggplot(data = bike, aes(x = season, y = count, color = season))+
  geom_boxplot()


bike$hour <- hour(bike$datetime) 


bike2 <- subset(bike, workingday==1)
ggplot(data = bike2, aes(x = hour, y = count,color = temp))+
  geom_point()


temp.model <- lm(count ~ temp, bike)
summary(temp.model)

bike3 <- mutate(bike, temp = 25)
predictions <- predict(temp.model,bike3)






















