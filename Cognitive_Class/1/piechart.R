library(ggplot2)

data("mtcars")

#aesthetic barplot

barp = ggplot(mtcars, 
              aes(x = 1, 
                  y = sort(mtcars$carb),
                  fill = sort(mtcars$carb))) + 
  geom_bar(stat = "identity")

print(barp)

#Coordenads polares:

barp = barp + coord_polar(theta = 'y')
barp = barp + theme(
  axis.line = element_blank(), 
  axis.text.x=element_blank(),
  axis.text.y=element_blank(),
  axis.ticks = element_blank(),
  axis.title.y = element_blank(),
  panel.background = element_blank()) + labs(y="Carburetors")

print(barp)
