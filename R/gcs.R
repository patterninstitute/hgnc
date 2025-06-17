#
# Google Cloud Storage (GCS) JSON API
#

gcs_base_url <- function() {
  "https://storage.googleapis.com"
}

gcs_endpoint <- function() {
  "storage/v1/b/public-download-files/o"
}

req_gcs_table_of_files <- function(release = c("monthly", "quarterly")) {

  release <- match.arg(release)
  prefix <- paste0("hgnc/archive/archive/", release, "/tsv")

  req <-
    httr2::request(gcs_base_url()) |>
    httr2::req_url_path_append(gcs_endpoint()) |>
    httr2::req_url_query(prefix = prefix)

  req
}

table_of_hgnc_archive_files <- function(release = c("monthly", "quarterly")) {

  release <- match.arg(release)
  req <- req_gcs_table_of_files(release = release)
  resp <- httr2::req_perform(req = req)
  json_lst <- httr2::resp_body_json(resp = resp)

  dplyr::bind_rows(json_lst[[2]])
}

extract_date <- function(x) {
  stringr::str_match(x, "\\d{4}-\\d{2}-\\d{2}$")[, 1]
}

#' List monthly or quarterly archives
#'
#' This function lists the monthly and quarterly archives currently available
#' from the HGNC's Google Cloud Storage.
#'
#' @param release Series type: `"monthly"` or `"quarterly"`.
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
#' - `md5sum`: MD5 checksum.
#' - `url`: direct address to the archive.
#'
#' @examples
#' try(list_archives())
#'
#' @export
list_archives <- function(release = c("monthly", "quarterly")) {

  release <- match.arg(release)
  tbl <- table_of_hgnc_archive_files(release = release)

  tbl |>
    dplyr::transmute(
      series = release,
      archive = tools::file_path_sans_ext(basename(.data$name)),
      file = basename(.data$name),
      date = as.Date(extract_date(.data$archive), format = "%Y-%m-%d"),
      .data$size,
      last_modified = as.POSIXct(
        .data$timeFinalized,
        format = "%Y-%m-%dT%H:%M:%OSZ",
        tz = "UTC"
      ),
      md5sum = .data$md5Hash,
      url = .data$mediaLink
    ) |>
    dplyr::filter(.data$archive != ".gitignore") |>
    dplyr::mutate(size = trimws(prettyunits::pretty_bytes(as.integer(.data$size)))) |>
    dplyr::mutate(dataset = sub(pattern = "[-_]\\d{4}-\\d{2}-\\d{2}$", replacement = "", x = .data$archive), .after = "series")
}
