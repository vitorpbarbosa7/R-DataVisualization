library(ggplot2)

#EuStockMarkets
EuStockDF = as.data.frame(EuStockMarkets)

head(EuStockDF)

#Form the lineplot
myplot = ggplot(EuStockDF, aes(x = c(1:nrow(EuStockDF)),
                      y = DAX)) + 
  geom_line(size = 1.5, colour = "firebrick") + 
  labs(x = "Time", y = "Stock")
myplot

multipleplots = ggplot() + 
  geom_line(data = EuStockDF, aes(x = c(1:nrow(EuStockDF)), y = DAX),
            size = 1.5, colour = "dodgerblue4") + 
  geom_line(data = EuStockDF, aes(x = c(1:nrow(EuStockDF)), y = FTSE),
            size = 1.5, colour = "firebrick4") + 
  geom_line(data = EuStockDF, aes(x = c(1:nrow(EuStockDF)), y = SMI),
            size = 1.5, colour = "darkgoldenrod4") + 
  geom_line(data = EuStockDF, aes(x = c(1:nrow(EuStockDF)), y = CAC),
            size = 1.5, colour = "chartreuse4") + 
  xlab("Days") + 
  ylab("Price") + 
  ggtitle("Eu Stocks")
multipleplots
 

library(mtcars)
cylFactor = mtcars$cyl
#Linear Regression
ggplot(mtcars, aes(x = mpg, y = wt, color = factor(cyl))) +
  geom_point(shape = cylFactor, fill=cylFactor, size = 4) + 
  geom_smooth(method = "lm", se = T, color = "red") + 
  ylab("Weight") + 
  xlab("Miles per gallon") + 
  labs(colour = "Cylinders") + 
  ggtitle("Weight vs Miles per gallon for different number of cylinders")


#Gaussian model:
ggplot(mtcars, aes(x = mpg, y = wt, color = factor(cyl))) +
  geom_point(shape = cylFactor, fill=cylFactor, size = 4) + 
  geom_smooth(method = "auto", se = T, color = "red") + 
  ylab("Weight") + 
  xlab("Miles per gallon") + 
  labs(colour = "Cylinders") + 
  ggtitle("Weight vs Miles per gallon for different number of cylinders")


