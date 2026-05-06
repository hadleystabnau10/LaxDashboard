# take a few minutes to read and run this code
# - what was this code probably written to do?
# - did you catch any likely errors?

library(tidyverse)

df <- tibble(
  a = rnorm(5), #randomly generating number from a normal distrbution
  b = rnorm(5),
  c = rnorm(5),
  d = rnorm(5),
)

df |> mutate(
  a = (a - min(a, na.rm = TRUE)) / 
    (max(a, na.rm = TRUE) - min(a, na.rm = TRUE)),
  b = (b - min(a, na.rm = TRUE)) / 
    (max(b, na.rm = TRUE) - min(b, na.rm = TRUE)),
  c = (c - min(c, na.rm = TRUE)) / 
    (max(c, na.rm = TRUE) - min(c, na.rm = TRUE)),
  d = (d - min(d, na.rm = TRUE)) / 
    (max(d, na.rm = TRUE) - min(d, na.rm = TRUE)),
)


functionname = function(vec){
  body
}

functionname(vec = 1:6)

rescale01 = function(a){
  return((a - min(a, na.rm = TRUE)) / 
    (max(a,na.am = TRUE) - min(a, na.rm = TRUE)))
}

rescale01(1:6)
