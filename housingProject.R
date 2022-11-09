# clear environment space
rm(list = ls())

# load in packages
library(tidyverse)
library(Stat2Data)
library(corrplot)
library(car)
library(GGally)

# load in data
housing <- read.csv("Housing.csv")

# split into training and test sets
set.seed(8145)
n <- nrow(housing)
m <- round(n * 0.85, 0)
x <- c(1:n)
y <- sample(x, m)
train <- housing[y, ]
train <- write.table(train, "train.csv",
                     col.names = T, row.names = F,
                     append = F, sep = ",")
test <- housing[which(!(x %in% y)), ]
test <- write.table(test, "test.csv",
                    col.names = T, row.names = F,
                    append = F, sep = ",")

# load train and test sets into environment
train <- read.csv("train.csv")
test <- read.csv("test.csv")



