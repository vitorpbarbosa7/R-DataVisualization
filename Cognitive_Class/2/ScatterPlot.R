library(ggplot2)

data("mtcars")

#This is the quick plot, simple version of ggplot2
qplot(mpg, wt, data=mtcars,
      main = "Miles per gallon vs Weight",
      xlab= "Miles per hour",
      ylab = "Weight")

#Different and complex syntax:
ggplot(mtcars, aes(x=mpg,y=wt)) + 
  geom_point(shape=20)

#To show the points use
ggpubr::show_point_shapes()

#Representing the shapes:
#First we create a new column with factors:
mtcars$cylFactor = factor(mtcars$cyl)

#Speração por cor e formato
ggplot(mtcars, aes(x= mpg, y = wt, shape = factor(cyl))) + 
  geom_point(aes(colour = factor(cyl)))

#Utilizando cor, formato e tamanho:
myplot = ggplot(mtcars, aes(x= mpg, y = wt, shape = factor(carb), size = hp)) + 
  geom_point(aes(colour = factor(cyl))) + 
  xlab("Miles per gallon") + 
  ylab("Weight") + 
  labs( colour = "Cylinders", size = "Horse Power", shape = "Carburetors") + 
  ggtitle("Scatterplot")


library(plotly)
ggplotly()
#Remove grid:
myplot + theme_bw()

#Remove everything:
myplot + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                   panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))



#Realmente há uma relação entre horse power e cylinders
ggplot(mtcars, aes(x = cyl, y = hp)) + 
         geom_point(shape = 10)
