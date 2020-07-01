install.packages("waffle")

library(ggplot2)
library(waffle)

expenses = c('Health ($43,212)' = 43212,
             'Education ($113,412)' = 113412,
             'Transportation ($20231)' = 20231,
             'Entertainment ($28,145)' = 28145)

class(expenses)

#Fazer quadradinhos de mesma proporção
# Definir número de linhas
#Tamanho dos quadradinhos
#Cores utilizadas (Proporcional ao número de categorias)
IRkernel::set_plot_options(width=950, height=600, units='px')
waffle(expenses/1235, rows = 5, size = 0.3,
       colors=c("#c7d4b6", "#a3aabd", "#a0d0de", "#97b5cf"), 
       title="Imaginary Household Expenses Each Year", 
       xlab="1 square = $934")
