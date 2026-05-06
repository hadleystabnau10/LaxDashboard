# create dates_factor

library(tidyverse)

some_dates = c("Dec", "Apr", "Jan", "Mar")

dates_factor <- fct(
  some_dates,
  levels = c(
    "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
  )
)

dates_factor
sort(dates_factor)
