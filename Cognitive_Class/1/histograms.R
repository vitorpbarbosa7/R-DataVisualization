data("mtcars")
library(ggplot2)
library("RColorBrewer")


hist(mtcars$hp,
     breaks = 6,
     col = brewer.pal(n = 6, name = "Blues"))

hist(mtcars$hp,
     breaks = 6,
     col = brewer.pal(n = 6, name = "BuPu"))

#Only viewing the pallete:
display.brewer.all()

display.brewer.pal(n = 4, name = 'RdBu')


#Histogramas com o GGPLOT2

install.packages("wesanderson")
library(wesanderson)

qplot(mtcars$hp,
      geom = "histogram",
      binwidth = 25,
      colour = I("white"),
      xlim = c(50,350),
      xlab = "Horse Power",
      ylab = "Number of cars")

ggplot(mtcars, aes(x = mpg, color = cyl)) + 
  geom_histogram(fill="black")
