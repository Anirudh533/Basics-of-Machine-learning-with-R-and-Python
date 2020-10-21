library(naivebayes)
library(dplyr)
library(ggplot2)
library(psych)
data <- read.csv("E:/Rassign/binary.csv", header = T, usekernel = T)
str(data)
xtabs(~admit+rank, data=data)
data$rank <- as.factor(data$rank)
data$admit <- as.factor(data$admit)
pairs.panels(data[-1])
ggplot(aes(x=admit, y= gpa, fill = admit)) + geom_boxplot() + ggtitle("Box plot")
ggplot(aes(x=gpa, fill = admit)) + geom_density(alpha = 0.8, color = 'black')
ggtitle("Density Plot")

set.seed(1234)
ind <- sample(2, nrow(data), replace = T, prob = c(0.8,0.2))
train <- data[ind == 1,]
test <- data[ind == 2,]
model <- naive_bayes(admit ~., data=train)
model

train
      filter(admit == "1")
      summarise(mean(gre), sd(gre))
plot(model)

p <- predict(model, train, type ="prob")
head(cbind(p,train))

p1 <- predict(model, train)
(tab1 <- table(p1, train$admit))
1 - sum(diag(tab1)) / sum(tab1)

p2 <- predict(model, test)
(tab2 <- table(p2, test$admit))
1 - sum(diag(tab2)) / sum(tab1)

