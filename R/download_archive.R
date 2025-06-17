#' Download the human gene nomenclature dataset
#'
#' [download_hgnc_dataset()] gets the latest HGNC approved data set.
#'
#' @param url A character string naming the URL of the HGNC dataset. It defaults
#'   to the latest available archive.
#'
#' @param path The directory path where the downloaded file is to be saved. By
#'   default, this value is `NULL` and the data is imported directly into memory
#'   without saving into disk.
#'
#' @param filename A character string with the name of the saved file. By
#'   default, this is inferred from the last part of the URL.
#'
#' @returns The path to the saved file.
#'
#' @export
download_hgnc_dataset <- function(url = latest_archive_url(),
                                  path = getwd(),
                                  filename = basename(url)) {

  download_archive(url = url,
                   path = path,
                   filename = filename)

}

download_archive <- function(url = latest_archive_url(),
                             path = getwd(),
                             filename = basename(url)) {

  destfile <- file.path(path, filename)
  utils::download.file(url = url, destfile = destfile)

  destfile
}
