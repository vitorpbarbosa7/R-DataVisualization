install.packages("leaflet")
library(leaflet)

map = leaflet()
map

map = leaflet() %>% addTiles()

map = leaflet() %>% 
  addProviderTiles("Stamen.Watercolor") %>%
  addTiles()  %>%
  addMarkers(lat = -23.566678, lng = -46.710370, popup='Home')

map

#Using a dataset:

#Location of earthquakes
data(quakes)

map2 = leaflet(quakes) %>%
  addTiles() %>%
  addMarkers(clusterOptions = markerClusterOptions())

map2
