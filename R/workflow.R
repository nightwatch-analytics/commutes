source("R/toolkit.R")

tx_tracts <- tracts(state = "TX", cb = TRUE) %>%
  select(GEOID)

tx_lodes <- get_lodes("TX")

tx_lodes <- tx_tracts %>%
  left_join(tx_lodes, by = c("GEOID" = "w_tract"))

cma <- counties(state = "TX", cb = TRUE) %>%
  filter(NAME == "Brazos") %>%
  select(GEOID, NAME)

cma_tracts <- tx_tracts %>%
  st_intersection(cma)

cma_lodes <- tx_lodes %>%
  filter(h_tract %in% cma_tracts$GEOID)

radius50 <- cma %>%
  st_centroid() %>% st_buffer(dist = 88000,endCapStyle = "FLAT")

