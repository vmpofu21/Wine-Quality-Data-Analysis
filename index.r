library(readr)
library(factoextra)
library(cluster)
library(pracma)

########################
#Wine Quality Data Set
#######################
wineData <- read_csv("~/Downloads/WineQT.csv")
View(wineData)
wineData[,c(2:4, 10, 11)]
na.omit(wineData[,c(2:4, 10, 11)]) # this command omits any rows (data) with NA entries; not necessary for this particular dataset
scale(wineData[,c(2:4, 10, 11)])
#variables <- c('volatile acidity','citric acid','residual sugar','sulphates', 'alcohol')
########################
# Problem 1
# kmeans algorithm
#######################
fviz_nbclust(wineData[c(1:1143),c(2:4, 10, 11)], kmeans, method = "wss") 
k2 <- kmeans(scale(wineData[,c(2:4, 10, 11)]), centers=5) # this runs the kmeans algorithm on 21 variables... you may get more meaningful clusters with using fewer variables in your analysis
k2$tot.withinss # remember to check a few results of the kmeans algorithm!
k2$size 
k2$centers
#str(k2)
wineData$cluster <- k2$cluster
aggregate(wineData[,c(2:4, 10, 11)], list(wineData$cluster), FUN=mean) # this gives the averages of the original data, rather than the scaled data

########################
# Problem 2
#Data Fitting
#######################
# data fitting: predicting the quality of wine
#A <- matrix(c(rep(1,70692),wineData$Fruits, wineData$Veggies, wineData$PhysActivity),70692,4) # this gives a multiple linear regression
A <- cbind(rep(1, 1143), wineData$pH, wineData$'citric acid', wineData$'residual sugar', wineData$'sulphates', wineData$'alcohol')
A
b <- wineData$quality
b
Q <- gramSchmidt(A)$Q
Q
R <- gramSchmidt(A)$R
R
psinvA <- inv(R)%*%t(Q)
psinvA
psinvA%*%b

