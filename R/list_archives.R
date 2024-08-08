#' List monthly and quarterly archives
#'
#' This function lists the monthly and quarterly archives currently available
#' from the HGNC FTP server:
#' \url{https://ftp.ebi.ac.uk/pub/databases/genenames/hgnc/archive/}.
#'
#' @param type The format of the archive: `"tsv"` or `"json"`.
#'
#' @return A [tibble][tibble::tibble-package] of available archives for
#'   download with the following columns:
#'
#' - `series`: whether `"monthly"` or `"quarterly"`.
#' - `dataset`: type of data set (`"hgnc_complete_set"`,
#' `"symbol-changes-monthly"`, `"withdrawn"` or `"symbol-changes-quarterly"`).
#' - `file`: file name.
#' - `date`: update date.
#' - `size`: file size.
#' - `last_modified`: date-time of file last modification on server.
#' - `url`: direct address to the archive.
#'
#' @examples
#' try(list_archives())
#'
#' @export
list_archives <- function(type = c('tsv', 'json')) {

  type <- match.arg(type)
  monthly_url <- rvest::url_absolute(paste0('monthly/', type, '/'), ftp_archive())
  quarterly_url <- rvest::url_absolute(paste0('quarterly/', type, '/'), ftp_archive())

  monthly_tbl <- ftp_ls(monthly_url) |>
    dplyr::mutate(series = 'monthly', .before = 1L)

  quarterly_tbl <- ftp_ls(quarterly_url) |>
    dplyr::mutate(series = 'quarterly', .before = 1L)

  dplyr::bind_rows(monthly_tbl, quarterly_tbl)

}
