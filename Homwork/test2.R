library(arules)
library(arulesViz)
library(RColorBrewer)  # color palettes for plots

#数据转换：创建稀疏矩阵
data <- read.transactions("wine.csv", format="basket", sep=",")

#
rules = apriori(data,parameter = list(support = 0.0006,confidence = 0.25,minlen = 2))
inspect(rules[1:10])

#
itemFrequencyPlot(data, support=0.1)
itemFrequencyPlot(data, topN=10, horiz=T)

image(sample(data,100))
summary(rules)

ordered_rules <- sort(rules, by ="lift")
inspect(ordered_rules[1:5])
#yogurtrules <- subset(rules, items %in% c("yogurt"))
qualityMeasures<-interestMeasure(rules,c("coverage","fishersExactTest","conviction", "chiSquared"), transactions=data)
write(rules, file="rules.csv", sep=",", quote=TRUE, row.names=FALSE)
groceryrules_df <- as(rules, "data.frame") 
str(groceryrules_df)
plot(rules, method="scatterplot",control=list(jitter=2), shading = "lift")
plot(rules, control=list(jitter=2), shading = "lift",method = 'grouped') 