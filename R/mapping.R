whole <- function(str) paste0('^', str, '$')

is_string <- function(x) {
  is.character(x) && (length(x) == 1L)
}

#' Convert an HGNC value to another
#'
#' @description
#'
#' [crosswalk()] will convert values found in one of the columns of an
#' HGNC gene data set to values in another.
#'
#' @param value A character vector of values to be matched in the `from` column.
#'   These values must match once and only once in the `from` column values,
#'   otherwise `NA` is returned.
#'
#' @param from The name of the column in the HGNC gene data set (`hgnc_dataset`)
#' where values passed in `value` are used as queries.
#'
#' @param to The name of the column whose values are to be returned,
#' corresponding to matches in the `from` column.
#'
#' @param hgnc_dataset A data frame corresponding to a HGNC gene data set.
#' Typically, you'd get hold of a HGNC gene data set with
#' [import_hgnc_dataset()]. For testing purposes and an offline solution,
#' you may use alternatively the function [hgnc_dataset_example()]
#' providing a subset.
#'
#' @examples
#' \dontrun{
#' # Map a gene symbol to its HUGO identifier.
#' crosswalk(value = "A1BG", from = "symbol", to = "hgnc_id")
#'
#' # If `from` and `to` refer to the same column, `crosswalk()` will filter
#' # out unmatched values by converting them to `NA`.
#' crosswalk(value = c("A1BG", "Not a gene"), from = "symbol", to = "symbol")
#'
#' # This is the default behavior, so you can simply call:
#' crosswalk(value = c("A1BG", "Not a gene"), from = "symbol")
#' }
#'
#' @export
crosswalk <- function(value,
                      from,
                      to = from,
                      hgnc_dataset = import_hgnc_dataset()) {

  if (!is_string(from)) cli::cli_abort("{.var from} must be a column name as a string.")
  if (!is_string(to)) cli::cli_abort("{.var to} must be a column name as a string.")
  if (!is.data.frame(hgnc_dataset)) cli::cli_abort("{.var hgnc_dataset} must be a data frame.")

  from_cols <- from_cols(hgnc_dataset)
  if (!(from %in% from_cols)) cli::cli_abort("{.code from} must be one of: {.val {from_cols}}.")
  if (!(to %in% colnames(hgnc_dataset))) cli::cli_abort("{.var to} must be a column name of {.var hgnc_dataset}.")

  single_match <- matches_once(x = value, y = hgnc_dataset[[from]])
  value[!single_match] <- NA_character_

  dplyr::left_join(tibble::tibble("..from.." = value), hgnc_dataset, by = c("..from.." = from), keep = TRUE) |>
  dplyr::pull(dplyr::all_of(to))
}

from_cols <- function(hgnc_dataset) {
  are_character_cols <- sapply(hgnc_dataset, is.character)
  colnames(hgnc_dataset)[are_character_cols]
}
