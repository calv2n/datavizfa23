library(sf)
library(terra)
library(tidyverse)
library(spData)
library(spDataLarge)
library(tmap)    # for static and interactive maps
library(leaflet) # for interactive maps


nz_elev = rast(system.file("raster/nz_elev.tif", package = "spDataLarge"))

map_nz = tm_shape(nz) + tm_polygons()

map_nz1 = map_nz + tm_shape(nz_elev) + tm_raster()

nz_water = st_union(nz) %>% 
  st_buffer(22200) %>% 
  st_cast(to = "LINESTRING")

map_nz1 + tm_shape(nz_water) + tm_lines()


