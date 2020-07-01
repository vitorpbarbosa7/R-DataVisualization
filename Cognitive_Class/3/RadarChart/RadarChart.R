install.packages("ggradar")

install.packages("devtools")
library(devtools)
devtools::install_github("ricardo-bion/ggradar", dependencies=TRUE)

install.packages("scales")

library(ggplot2)
library(ggradar)

#This provides the pipe operation
# Takes the output of one function and provides to another
library(dplyr)

#Methods for label, and legends
library(scales)

data(mtcars)

#Select our dataset

#Pipe Operator
mtcars %>%
  #Atribuir nome de linhas para uma variável
  add_rownames(var = "group") %>%
  
  mutate_each(funs(rescale), -group) %>%
  
  #Selecionar os dados para plotar
  #Estas são as variáveis (features, colunas) em select e 
  #Em head estamos selecionando as linhas, as observações
  head(3) %>% select(1:10) -> mtcars_radar

#This code would generate lots of warnings, so we will supress them
options(warn = -1)

ggradar(mtcars_radar)

#Run de ggradar 
library(IRkernel)
IRkernel::set_plot_options(width = 950, height = 600, units = 'px')
ggradar(mtcars_radar)
