setwd('C:\\Users\\vitor\\Google Drive\\DS\\R-DataVisualization\\R-Statistics')

#Installing the tidyverse package which contains ggplot

# install.packages('tidyverse')
library(tidyverse)

housing = read.csv('landdata-states.csv')

head(housing[1:5])


# Histogram ---------------------------------------------------------------
#Simples histogram
hist(housing$Home.Value)

#ggplot histogram
ggplot(housing, aes(x=Home.Value)) +
  geom_histogram(bins = 8)


# Colored Scatter graph, jitter and boxplot---------------------------------------------------
ggplot(housing, aes(x = Date, y = Home.Value, color = State)) +
  geom_point()

#Com filtro para mostrar apenas alguns estados:
ggplot(filter(housing, State %in% c("AK", "FL")),
       aes(y = Home.Value, x = Date, color = State)) +
  geom_point()

#Boxplot de apenas dois estados
ggplot(filter(housing, State %in% c("AK", "FL")),
       aes(x = State, y = Home.Value, color = State)) +
  geom_boxplot()

#Jitter de dois estados
ggplot(filter(housing, State %in% c("AK", "FL")),
       aes(x = State, y = Home.Value, color = Year)) +
  geom_jitter()
       

# Explorying geometry -----------------------------------------------------
ggplot(filter(housing, Date == 2001.25),
       aes(y = Structure.Cost, x = Land.Value, size = Home.Value)) +
  geom_point()

ggplot(filter(housing, Date == 2001.25),
       aes(y = Structure.Cost, x = Land.Value, shape = region)) +
  geom_point()

ggplot(filter(housing, Date == 2001.25 & region %in% c("West")),
       aes(y = Structure.Cost, x = Land.Value, color = State)) +
  geom_point()


# Regression Line ---------------------------------------------------------

#Criar a regressão. E para isso criarmos uma nova coluna com os valores:
#subset apenaas com o primeiro? ou segundo? quartil de 2001:
housing_sub_2001q1 = filter(housing, Date == 2001.25)

#Coluna com a regressão:
housing_sub_2001q1$pred_SC = predict(lm(Structure.Cost ~ log(Land.Value), data = housing_sub_2001q1))

myplot = ggplot(housing_sub_2001q1, aes(y = Structure.Cost, x = log(Land.Value)))
  
myplot + geom_point(aes(color = Home.Value)) + geom_line(aes(y = pred_SC))

# Smooth ------------------------------------------------------------------
myplot + geom_smooth() + geom_point(aes(color = Home.Value))

# Text Labels -------------------------------------------------------------
myplot + geom_text(aes(label = State), size = 3, check_overlap = T)

# install.packages('ggrepel')
library(ggrepel)
myplot + geom_point() +
  geom_text_repel(aes(label=State), size = 3)

# Entendendo a fundo a estética -------------------------------------------
myplot + geom_point(aes(color = Home.Value, shape = region))


# Statistical Transformations ---------------------------------------------
args(geom_histogram)
args(stat_bin)

myhist = ggplot(housing, aes(x = Home.Value))
myhist + geom_histogram(stat = "bin", binwidth = 40000)

#Função agregate que permite aplicar alguma função de acordo com um algum critério de
# filtro das linhas
housing_mean_state = aggregate(housing['Home.Value'], housing['State'], FUN = mean)

rbind(head(housing_mean_state), tail(housing_mean_state))

ggplot(housing_mean_state, aes(x=State, y=Home.Value)) +
  geom_bar(stat = 'identity')
       

