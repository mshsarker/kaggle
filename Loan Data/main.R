library(tidyverse)
library(caTools)
library(e1071)


loans <- read_csv("loan_data.csv")
glimpse(loans)
summary(loans)


loans <- loans %>% mutate_at(c('inq.last.6mths','pub.rec','delinq.2yrs','not.fully.paid', 'credit.policy', 'purpose'),as.factor )


ggplot(data = loans, aes(x = fico))+
  geom_histogram(aes(fill = not.fully.paid))


ggplot(data = loans, aes(x = purpose))+
  geom_bar(aes(fill = not.fully.paid), position = 'dodge')


ggplot(data = loans, aes(x = int.rate, y = fico, fill = not.fully.paid))+
  geom_point()


# Split up the sample, basically randomly assigns a booleans to a new column "sample".  not.fully.paid is the column that we want to predict.
sample <- sample.split(loans$not.fully.paid, SplitRatio = 0.70) # SplitRatio = percent of sample==TRUE

# Training Data
train = subset(loans, sample == TRUE)

# Testing Data
test = subset(loans, sample == FALSE)


model <- svm(not.fully.paid ~ ., data=train)
summary(model)


predicted.values <- predict(model,test[1:13])
table(predicted.values,test$not.fully.paid)

## It is not working.. Need to check it later.
tune.results <- tune(svm,train.x= train[1:13],train.y=train[,14],kernel='radial',
                     ranges=list(cost=c(-1:2), gamma=c(.5,1,2)))






