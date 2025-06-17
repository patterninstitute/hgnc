#' Example HGNC data set
#'
#' @description
#' [hgnc_dataset_example()] provides an example HGNC data set. This example
#' contains only the first 10,000 gene entries of the HGNC data set dated of
#' `r attr(hgnc_dataset_example(), "last_update")`.
#'
#' This is mostly used in example code as it does not require internet
#' connection.
#'
#' @returns A [tibble][tibble::tibble-package] whose structure is documented
#' in [import_hgnc_dataset()].
#'
#' @examples
#' hgnc_dataset_example()
#'
#' @export
hgnc_dataset_example <- function() {

  path <- system.file("extdata/hgnc_complete_set.rds", package = "hgnc", mustWork = TRUE)
  readr::read_rds(file = path)
}
