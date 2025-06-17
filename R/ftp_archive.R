archive_listing_base_url <- function() {
  "https://www.genenames.org/download/archive/"
}

ftp_base_url <- function() {
  'https://storage.googleapis.com/public-download-files/hgnc/archive/'
}

ftp_archive <- function() {
  paste0(ftp_base_url(), 'archive/')
}
