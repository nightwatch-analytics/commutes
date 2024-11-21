# Setup ----
library(janitor)
library(lehdr)
library(sf)
library(tidycensus)
library(tidyverse)
library(tigris)

options(tigris_use_cache = TRUE)

# Import ----
get_lodes <- function(state) {
  grab_lodes(state = state,
             year = 2021,
             lodes_type = "od",
             job_type = "JT01",
             segment = "S000",
             agg_geo = "tract",
             state_part = "main",
             use_cache = T) %>%
    select(w_tract, h_tract, S000)
}

# Tidy ----


# Transform ----


# Visualize ----


# Model ----


# Communicate ----

