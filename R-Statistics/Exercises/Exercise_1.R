setwd('C:\\Users\\vitor\\Google Drive\\DS\\R-DataVisualization\\R-Statistics\\Exercises')

dados = read.csv('EconomistData.csv')

library(tidyverse)

myplot = ggplot(dados, aes(y = HDI, x = CPI))

#2:
myplot + geom_point(color = 'blue')

#3:
myplot + geom_point(aes(color = Region))

#4:
myplot + geom_point(aes(color = Region), size = 2)

#5
myplot + geom_point(aes(color = Region, size = HDI.Rank))

library(ggrepel)
myplot + geom_point(aes(color = Region, size = HDI.Rank)) +
  geom_text(aes(label = Country)) + 
  geom_text_repel(aes(label = Country))

myplot = ggplot(filter(dados, Region %in% c("Americas")), aes(y = HDI, x = CPI))

myplot + geom_point(aes(size = HDI.Rank)) +
  geom_text_repel(aes(label = Country))
