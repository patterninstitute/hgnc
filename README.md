
<!-- README.md is generated from README.Rmd. Please edit that file -->

# hgnc <img src='man/figures/logo.svg' align="right" height="139" />

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/hgnc)](https://CRAN.R-project.org/package=hgnc)
[![R-CMD-check](https://github.com/patterninstitute/hgnc/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/patterninstitute/hgnc/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of `{hgnc}` is to easily import [Human Gene
Nomenclature](https://www.genenames.org) into R.

## Installation

Install `{hgnc}` from CRAN:

``` r
install.packages("hgnc")
```

## Usage

To import the latest HGNC gene data set in tabular format directly into
memory as a tibble do as follows:

``` r
library(hgnc)

# Check the date of HGNC last update
last_update()
#> [1] "2025-06-17 11:10:30 UTC"

# Import the data set in tidy tabular format
(hgnc_dataset <- import_hgnc_dataset())
#> # A tibble: 44,117 × 55
#>    hgnc_id    hgnc_id2 symbol    name     locus_group locus_type status location
#>    <chr>         <int> <chr>     <chr>    <chr>       <chr>      <chr>  <chr>   
#>  1 HGNC:5            5 A1BG      alpha-1… protein-co… gene with… Appro… 19q13.43
#>  2 HGNC:37133    37133 A1BG-AS1  A1BG an… non-coding… RNA, long… Appro… 19q13.43
#>  3 HGNC:24086    24086 A1CF      APOBEC1… protein-co… gene with… Appro… 10q11.23
#>  4 HGNC:7            7 A2M       alpha-2… protein-co… gene with… Appro… 12p13.31
#>  5 HGNC:27057    27057 A2M-AS1   A2M ant… non-coding… RNA, long… Appro… 12p13.31
#>  6 HGNC:23336    23336 A2ML1     alpha-2… protein-co… gene with… Appro… 12p13.31
#>  7 HGNC:41022    41022 A2ML1-AS1 A2ML1 a… non-coding… RNA, long… Appro… 12p13.31
#>  8 HGNC:41523    41523 A2ML1-AS2 A2ML1 a… non-coding… RNA, long… Appro… 12p13.31
#>  9 HGNC:8            8 A2MP1     alpha-2… pseudogene  pseudogene Appro… 12p13.31
#> 10 HGNC:30005    30005 A3GALT2   alpha 1… protein-co… gene with… Appro… 1p35.1  
#> # ℹ 44,107 more rows
#> # ℹ 47 more variables: location_sortable <chr>, alias_symbol <list>,
#> #   alias_name <list>, prev_symbol <list>, prev_name <list>, gene_group <list>,
#> #   gene_group_id <list>, date_approved_reserved <date>,
#> #   date_symbol_changed <date>, date_name_changed <date>, date_modified <date>,
#> #   entrez_id <chr>, ensembl_gene_id <chr>, vega_id <chr>, ucsc_id <chr>,
#> #   ena <list>, refseq_accession <list>, ccds_id <list>, uniprot_ids <list>, …
```

## Learn more

Learn more about this package by reading the documentation at
<https://www.pattern.institute/hgnc/>.

## Citing the HGNC

To cite HGNC nomenclature resources use:

- Tweedie S, Braschi B, Gray KA, Jones TEM, Seal RL, Yates B, Bruford
  EA. *Genenames.org: the HGNC and VGNC resources in 2021.* Nucleic
  Acids Res. 49, D939–D946 (2021). doi:
  [10.1093/nar/gkaa980](https://doi.org/10.1093/nar/gkaa980)

To cite data within the database use the following format:

- HGNC Database, HUGO Gene Nomenclature Committee (HGNC), European
  Molecular Biology Laboratory, European Bioinformatics Institute
  (EMBL-EBI), Wellcome Genome Campus, Hinxton, Cambridge CB10 1SD,
  United Kingdom www.genenames.org.

Please include the month and year you retrieved the data cited.
