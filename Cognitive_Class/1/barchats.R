setwd("C:\\Users\\vitor\\Google Drive\\DS\\R-DataVisualization\\1")

data("mtcars")

names(mtcars)

library(ggplot2)

qplot(x = mpg, 
      y = wt,
      data = mtcars,
      size = cyl)

qplot(mtcars$cyl,
      geom = "bar",
      main ="Data Visualization in R ",
      xlab = "Número de cilindros",
      ylab = "Frequência",
      fill = I("blue"),
      colour = I("red")
      )


