library(tidyverse)
library(rvest)
library(dplyr)


oreoProblem <-read_html(x = "https://www.fakeurl.edu/data/problemOreo.csv") %>%
  html_elements(css = "table") %>%
  html_table()

oreoProblemRaw <- oreoProblem[[1]] 

oreoProblemPolished <- oreoProblemRaw %>%
  mutate(
    mass_in_grams = mass * 0.2,  
    mass_in_carats = mass         
  ) %>%
  select(type, mass_in_carats, mass_in_grams)