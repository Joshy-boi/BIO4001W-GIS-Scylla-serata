
#packages:

install.packages("rinat")
library(rinat)

library(tidyverse)
library(sf)

install.packages("mapview")
library(mapview)

install.packages("leafpop")
library(leafpop)


#pulling inat observations, might not use inat 

Scylla_occ_raw <- get_inat_obs(taxon_name = "Scylla serrata",
                 bounds = c(-34.28581259281925, 21.75014796812208, -27.91336641756689, 33.0660659368720),   #coordinates acquired from bounding box drawn around East coast and all occs in inat
                  maxresults = 100)
Scylla_occ_raw
 
#filtering raw data, there is an obscured point and that will be removed by
#the filer for positional accuracy

Scylla_occ_filtered <- Scylla_occ_raw %>% filter(positional_accuracy <100 &
  latitude <0 &
                      !is.na(latitude) &
                      captive_cultivated == "false" &
                      quality_grade == "research")
Scylla_occ_filtered


#changing data frame to spatial object:

scylla_occ_filtered_sf <- st_as_sf(Scylla_occ_filtered, coords= c("longitude", "latitude"), crs =4326  )

class(scylla_occ_filtered)



#now that i have the inat occ data, i am going to use map view to plot them and add a link to their observations

#using jaspers html formatting to make sure links can be clicked on

live_scylla_occ_filtered_sf <- scylla_occ_filtered_sf %>%
  mutate(click_url = paste("<b><a href='", url, "'>Link to iNat observation</a></b>"))


#making the map 

mapview(
  scylla_occ_filtered_sf, 
  zcol = "positional_accuracy", 
  
   layer.name = "Positional Accuracy (meters)", 
 
  col.regions = viridisLite::viridis(15),
  
  popup = popupTable(
    live_scylla_occ_filtered_sf, # Use the same object here
    zcol = c("observed_on", "user_login", "click_url") 
  ),
  map.types = "Esri.WorldImagery"
)
