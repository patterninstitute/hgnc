.onLoad <- function(libname, pkgname) {
  import_hgnc_dataset <<- memoise::memoise(import_hgnc_dataset)
  list_archives <<- memoise::memoise(list_archives)
  latest_archive_url <<- memoise::memoise(latest_archive_url)
}
