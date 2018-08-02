library(sf)
library(tidyverse)
library(tidycensus)
library(ggplot2)

chicago_gdf <- st_read("chicago_tracts_2010.shp")
commarea <- as.character(chicago_gdf$commarea)

reports <- tibble(
  output_file = stringr::str_c("output/maps-commarea_", commarea, ".html"),
  params = map(commarea, ~list(commarea = .))
)

head(reports)

reports %>% pwalk(rmarkdown::render, input = "geospatial.rmd")