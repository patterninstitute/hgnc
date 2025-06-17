library(hgnc)
library(tidyverse)

path <- here::here("inst/extdata/hgnc_complete_set.rds")
hgnc_dt <- import_hgnc_dataset() |>
  dplyr::slice(1:10000)

hgnc_last_update <- last_update()
attr(hgnc_dt, "last_update") <- hgnc_last_update

readr::write_rds(x = hgnc_dt, file = path, compress = "xz")
