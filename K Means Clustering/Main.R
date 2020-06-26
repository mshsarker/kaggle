library(tidyverse)

df1 <- read_delim("winequality-red.csv", delim = ';')
df2 <- read_delim("winequality-white.csv", delim = ';')


head(df1)
head(df2)


df1 <- mutate(df1, label = 'red')
df2 <- mutate(df2, label = 'white')


wine <- full_join(df1, df2)
glimpse(wine)


ggplot(data = wine, aes(x = `residual sugar`))+
  geom_histogram(aes(fill = label), color = 'black', bins = 50)+ 
  scale_fill_manual(values = c('#ae4554','#faf7ea'))+ 
  theme_bw()


ggplot(data = wine, aes(x = `citric acid`))+
  geom_histogram(aes(fill = label), color = 'black', bins = 50)+ 
  scale_fill_manual(values = c('#ae4554','#faf7ea'))+ 
  theme_bw()


ggplot(data = wine, aes(x = `citric acid`,y = `residual sugar`))+
  geom_point(aes(fill = label), alpha = 0.2)+ 
  scale_fill_manual(values = c('#ae4554','#faf7ea'))+ 
  theme_bw()


clus.data <- select(wine, -label)


wine.cluster <- kmeans(clus.data, 2, nstart = 20)
table(wine$label, wine.cluster$cluster)

