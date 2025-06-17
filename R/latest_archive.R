latest_archive <- function() {

  basename <- 'hgnc_complete_set'
  extension <- "tsv"
  filename <- paste0(basename, '.', extension)
  url <- paste0(ftp_base_url(), extension, '/', filename)

  datetime <- last_update()

  tbl <-
    tibble::tibble(
      dataset = 'hgnc_complete_set',
      file = filename,
      datetime = datetime,
      date = as.Date(datetime),
      time = format(as.POSIXct(datetime), format = "%H:%M:%S"),
      size = NA_integer_,
      url = url
    )

  return(tbl)

}

#' Latest HGNC archive URL
#'
#' @returns A string with the latest HGNC archive URL.
#'
#' @examples
#' try(latest_archive_url())
#'
#' @export
latest_archive_url <- function() {

  base_url <- "https://storage.googleapis.com/public-download-files/"
  basename <- 'hgnc_complete_set'
  extension <- "tsv"
  type <- extension
  filename <- paste0(basename, '.', extension)
  url <- paste0(base_url, "hgnc/", type, "/", type, '/', filename)
  attr(url, 'last_update') <- last_update()

  return(url)
}

#' Latest HGNC monthly URL
#'
#' @return A string with the latest HGNC monthly archive URL.
#'
#' @examples
#' try(latest_monthly_url())
#'
#' @export
latest_monthly_url <- function() {

  url <-
    list_archives(release = "monthly") |>
    dplyr::filter(.data$dataset == 'hgnc_complete_set') |>
    dplyr::arrange(date) |>
    dplyr::pull(url) |>
    dplyr::last()

  stopifnot(length(url) == 1L)

  return(url)
}

#' Latest HGNC quarterly URL
#'
#' @return A string with the latest HGNC monthly archive URL.
#'
#' @examples
#' try(latest_quarterly_url())
#'
#' @export
latest_quarterly_url <- function() {

  url <-
    list_archives(release = "quarterly") |>
    dplyr::filter(.data$dataset == 'hgnc_complete_set') |>
    dplyr::arrange(date) |>
    dplyr::pull(url) |>
    dplyr::last()

  stopifnot(length(url) == 1L)

  return(url)
}
