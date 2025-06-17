
# col_types for read hgnc tsv file
hgnc_col_types <- list(
  hgnc_id = readr::col_character(),
  symbol = readr::col_character(),
  name = readr::col_character(),
  locus_group = readr::col_character(),
  locus_type = readr::col_character(),
  status = readr::col_character(),
  location = readr::col_character(),
  location_sortable = readr::col_character(),
  alias_symbol = readr::col_character(),
  alias_name = readr::col_character(),
  prev_symbol = readr::col_character(),
  prev_name = readr::col_character(),
  gene_group = readr::col_character(),
  gene_group_id = readr::col_character(),
  date_approved_reserved = readr::col_date(),
  date_symbol_changed = readr::col_date(),
  date_modified = readr::col_date(),
  date_name_changed = readr::col_date(),
  entrez_id = readr::col_character(),
  ensembl_gene_id = readr::col_character(),
  vega_id = readr::col_character(),
  ucsc_id = readr::col_character(),
  ena = readr::col_character(),
  refseq_accession = readr::col_character(),
  ccds_id = readr::col_character(),
  uniprot_ids = readr::col_character(),
  pubmed_id = readr::col_character(),
  mgd_id = readr::col_character(),
  rgd_id = readr::col_character(),
  lsdb  = readr::col_character(),
  cosmic = readr::col_character(),
  omim_id = readr::col_character(),
  mirbase= readr::col_character(),
  homeodb= readr::col_character(),
  snornabase= readr::col_character(),
  bioparadigms_slc = readr::col_character(),
  orphanet = readr::col_character(),
  `pseudogene.org` = readr::col_character(),
  horde_id = readr::col_character(),
  merops = readr::col_character(),
  imgt = readr::col_character(),
  iuphar = readr::col_character(),
  kznf_gene_catalog = readr::col_character(),
  `mamit-trnadb` = readr::col_character(),
  cd = readr::col_character(),
  lncrnadb = readr::col_character(),
  enzyme_id = readr::col_character(),
  intermediate_filament_db = readr::col_character(),
  rna_central_id = readr::col_character(),
  lncipedia = readr::col_character(),
  gtrnadb = readr::col_character(),
  agr = readr::col_character(),
  mane_select = readr::col_character(),
  gencc = readr::col_character()
)

# columns to convert to list columns
hgnc_list_cols <- c(
  'alias_symbol',
  'alias_name',
  'prev_symbol',
  'prev_name',
  'gene_group',
  'gene_group_id',
  'ena',
  'refseq_accession',
  'ccds_id',
  'uniprot_ids',
  'pubmed_id',
  'mgd_id',
  'rgd_id',
  'omim_id',
  'enzyme_id',
  'mane_select'
)


import_hgnc_dataset_ <- function(file = latest_archive_url()) {

  tbl <-readr::read_tsv(file = file, col_types = hgnc_col_types)

  # check for missing columns
  missing_cols <- setdiff(names(tbl), names(hgnc_col_types))
  if (length(missing_cols)) {
    warning("Expected column(s) missing from HGNC dataset: ", stringr::str_c(missing_cols, collapse = ', '))
  }
  # check for extra columns
  extra_cols <- setdiff(names(hgnc_col_types), names(tbl))
  if (length(extra_cols)) {
    warning("Extra column(s) present in HGNC dataset: ", stringr::str_c(extra_cols, collapse = ', '))
  }

  tbl |>
    # Create list-columns for those cases where multiples values are possible
    dplyr::mutate(dplyr::across(dplyr::any_of(hgnc_list_cols), ~ stringr::str_split(., pattern = '\\|'))) |>
    # Add integer column with 'HGNC:' removed
    dplyr::mutate(hgnc_id2 = as.integer(stringr::str_remove(.data$hgnc_id, '^HGNC:')), .after = 'hgnc_id')
}

#' Import HGNC data
#'
#' [import_hgnc_dataset()] imports HGNC data into R. Specify a directory `path`
#' in addition if you wish the save the data to disk.
#'
#' @param file A file or URL of the complete HGNC data set (in TSV format).
#' Use [list_archives()] to list previous versions of these data. Pass one
#' of the URLs (column `url`) to `file` to import that specific version. By
#' default the value of `file` is the URL corresponding to the latest version,
#' i.e. the returned value of [latest_archive_url()].
#'
#' @return A [tibble][tibble::tibble-package] of the HGNC data set consisting of
#'   55 columns:
#'
#' `r col_descriptions()`
#'
#' @examples
#' \dontrun{import_hgnc_dataset()}
#'
#' @export
import_hgnc_dataset <- function(file = latest_archive_url()) {

  import_hgnc_dataset_(file = file)

}


