set.seed(1234)

set_a = rnorm(200, mean=1, sd=2)
set_b = rnorm(200, mean=0, sd=1)

df = data.frame(label1 = factor(rep(c("A","B"), each = 200)),
                value = c(set_a,set_b))

library(ggplot2)

ggplot(df, aes(x = value))

head(df)

tail(df)

install.packages("plotly")

library(plotly)

ggplot(df, aes(x=label1, y=value)) + geom_boxplot()

#ggplotly que permite gerar gráficos interativos
ggplotly()


data(mtcars)

qplot(x = factor(gear), 
      y = mpg, 
      data = mtcars, 
      geom="boxplot")

cars_boxplot = ggplot(mtcars, aes(x = factor(cyl), y= mpg)) + geom_boxplot()
cars_boxplot

ggplotly()
