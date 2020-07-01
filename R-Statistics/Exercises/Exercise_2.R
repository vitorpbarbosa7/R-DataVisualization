setwd('C:\\Users\\vitor\\Google Drive\\DS\\R-DataVisualization\\R-Statistics\\Exercises')

dados = read.csv('EconomistData.csv')

library(tidyverse)

myplot = ggplot(dados, aes(y = HDI, x = CPI)) + 
  geom_point()

#2
myplot + geom_smooth()

#3
myplot + stat_smooth(method = 'lm')

myplot + geom_smooth(method = 'lm')

#4
myplot + geom_line(stat = "smooth",
                   method = "loess")

#5:
myplot + geom_smooth(method = "loess", span = .5)
