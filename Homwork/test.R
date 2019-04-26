library(DMwR)
library(car)
library(lattice)
library(Hmisc)
library(ggplot2)
library(VIM)


data <- read.csv("wine.csv",head = T,sep = ',',nrows = 10000,stringsAsFactors = FALSE)


par(mfrow=c(1,2))
#可视化缺失
matrixplot(data)
#1.直接剔除
newdata<-na.omit(data)
matrixplot(newdata)

#2.
par(mfrow=c(1,2))
newdata <- data
matrixplot(data)
#newdata<-newdata[-manyNAs(newdata),]
newdata <- centralImputation(newdata)
matrixplot(newdata)
#newdata$price

#3.
symnum(cor(data[,4:5],use="complete.obs"))

#4.
clean.data<-knnImputation(newdata,k=10,meth="median")
