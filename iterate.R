library(sf)
library(tidyverse)
library(tidycensus)

chicago_gdf <- st_read("chicago_tracts_2010.shp")
commarea <- as.character(chicago_gdf$commarea)

## This is creating the parameter reports:

reports <- tibble(
  output_file = stringr::str_c("output/maps-commarea_", commarea, ".html"),
  params = map(commarea, ~list(commarea = .))
)

## Look at reports:
glimpse(reports)

reports %>% pwalk(rmarkdown::render, input = "geospatial.rmd")