library(MASS)
library(reshape2)
print(head(ships, n = 10))

shipdata = (head(ships, n=10))
molten_ships = melt(shipdata, id= c("type", "year"))

print(molten_ships)

library(ggplot2)

ggplot(molten_ships, aes(x = variable, y = value)) + geom_boxplot()

ggplotly()
