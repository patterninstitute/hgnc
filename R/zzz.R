.onLoad <- function(libname, pkgname) {
  import_hgnc_dataset_ <<- memoise::memoise(import_hgnc_dataset_)
  download_archive <<- memoise::memoise(download_archive)
  # list_archives <<- memoise::memoise(list_archives)
  latest_archive_url <<- memoise::memoise(latest_archive_url)
  last_update <<- memoise::memoise(last_update)
}
