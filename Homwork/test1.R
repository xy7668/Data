#数据摘要
library(Hmisc)
data <- read.csv("wine.csv",head = T,sep = ',',stringsAsFactors = FALSE,nrows = 10000)

#hist(data$country,freq = F)
with(data,table(country))
summary(data)
describe(data$points)
#describe(data$price)

#数据可视化
point <- data$points
price <- data$price

par(mfrow=c(1,2))

hist(point)
hist(price)

qqnorm(point,main = "point-qq图")
qqline(point)
qqnorm(price,main = "price-qq图")
qqline(price)

boxplot(point,xlab = "point",outline = T,log = "",notch = FALSE)
boxplot(price,xlab = "price",outline = TRUE,log = "",notch = FALSE)
