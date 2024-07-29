# Convert degrees decimal minutes into decimal degrees

# Load required libraries
library(parzer)
library(readxl)
library(tidyverse)

cm_ll <- read_excel("data/MNI_Marotte_log.xlsx", sheet = "sites") |> 
  select(Site, Lat_DDM, Long_DDM) |> 
  mutate(Dec_lat = parse_lat(Lat_DDM),       # parse_lat and long convert the values
         Dec_lon = parse_lon(Long_DDM))

head(cm_ll)

write_csv(cm_ll, file = "output/CMs_DecLoc.csv")
