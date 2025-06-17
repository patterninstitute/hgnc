
<!-- README.md is generated from README.Rmd. Please edit that file -->

# hgnc <img src='man/figures/logo.svg' align="right" height="139" />

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/hgnc)](https://CRAN.R-project.org/package=hgnc)
[![R-CMD-check](https://github.com/patterninstitute/hgnc/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/patterninstitute/hgnc/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of `{hgnc}` is to easily import Human Gene Nomenclature into R.

## Installation

Install `{hgnc}` from CRAN:

``` r
install.packages("hgnc")
```

## Usage

### Basic usage

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

### Convert between gene identifiers

Use `crosswalk()` to convert values found in one of the columns of an
HGNC gene data set to values in another:

``` r
# convert a set of hgnc_ids to symbols
hgnc_ids <- c("HGNC:44948", "HGNC:43240", "HGNC:23357", "HGNC:1855", "HGNC:39400")
crosswalk(hgnc_ids, from = 'hgnc_id', to = 'symbol')
#> [1] "GOLGA2P6"  "RNA5SP340" "MCTS1"     "CENPCP1"   "ASNSP4"

# convert a set of entrez_ids to ensembl_gene_ids
entrez_ids <- c(79933, 109623458, 158471, 54987, 81631)
crosswalk(entrez_ids, from = 'entrez_id', to = 'ensembl_gene_id')
#> [1] "ENSG00000166317" NA                "ENSG00000106772" "ENSG00000162384"
#> [5] "ENSG00000140941"
```

## Motivation

You could go to [www.genenames.org](https://www.genenames.org) and
download the files yourself. So why the need for this R package?

`{hgnc}` really is just a convenience package. The main advantage is
that the function `import_hgnc_dataset()` reads in the data in tabular
format with all the columns with the appropriate type (so you don’t have
to specify it yourself). As an extra step, those variables that contain
multiple values are encoded as list-columns.

Remember that list-columns can be expanded with `tidyr::unnest()`. E.g.,
`alias_symbol` is a list-column containing multiple alternative aliases
to the standard `symbol`:

``` r
hgnc_dataset |>
  dplyr::filter(symbol == 'TP53') |>
  dplyr::select(c('symbol', 'alias_symbol'))
#> # A tibble: 1 × 2
#>   symbol alias_symbol
#>   <chr>  <list>      
#> 1 TP53   <chr [2]>

hgnc_dataset |>
  dplyr::filter(symbol == 'TP53') |>
  dplyr::select(c('symbol', 'alias_symbol')) |>
  tidyr::unnest(cols = 'alias_symbol')
#> # A tibble: 2 × 2
#>   symbol alias_symbol
#>   <chr>  <chr>       
#> 1 TP53   p53         
#> 2 TP53   LFS1
```

In addition, we also provide the function `filter_by_keyword()` that
allows filtering the data set based on a keyword or regular expression.
By default this function will look into all columns that contain gene
symbols or names (`symbol`, `name`, `alias_symbol`, `alias_name`,
`prev_symbol` and `prev_name`). It works automatically with list-columns
too.

Look for entries in the data set that contain the keyword `"TP53"`:

``` r
hgnc_dataset |>
  filter_by_keyword('TP53') |>
  dplyr::select(1:4)
#> # A tibble: 66 × 4
#>    hgnc_id    hgnc_id2 symbol      name                                       
#>    <chr>         <int> <chr>       <chr>                                      
#>  1 HGNC:49685    49685 ABHD15-AS1  ABHD15 antisense RNA 1                     
#>  2 HGNC:56226    56226 FAM169A-AS1 FAM169A antisense RNA 1                    
#>  3 HGNC:4136      4136 GAMT        guanidinoacetate N-methyltransferase       
#>  4 HGNC:54868    54868 KLRK1-AS1   KLRK1 antisense RNA 1                      
#>  5 HGNC:6568      6568 LGALS7      galectin 7                                 
#>  6 HGNC:28298    28298 LIF-AS2     LIF antisense RNA 2                        
#>  7 HGNC:26628    26628 LINC00324   long intergenic non-protein coding RNA 324 
#>  8 HGNC:28278    28278 LINC00526   long intergenic non-protein coding RNA 526 
#>  9 HGNC:53222    53222 LINC02303   long intergenic non-protein coding RNA 2303
#> 10 HGNC:53545    53545 LINC02525   long intergenic non-protein coding RNA 2525
#> # ℹ 56 more rows
```

Restrict the search to the `symbol` column:

``` r
hgnc_dataset |>
  filter_by_keyword('TP53', cols = 'symbol') |>
  dplyr::select(1:4)
#> # A tibble: 23 × 4
#>    hgnc_id    hgnc_id2 symbol    name                                           
#>    <chr>         <int> <chr>     <chr>                                          
#>  1 HGNC:11998    11998 TP53      tumor protein p53                              
#>  2 HGNC:29984    29984 TP53AIP1  tumor protein p53 regulated apoptosis inducing…
#>  3 HGNC:11999    11999 TP53BP1   tumor protein p53 binding protein 1            
#>  4 HGNC:12000    12000 TP53BP2   tumor protein p53 binding protein 2            
#>  5 HGNC:16328    16328 TP53BP2P1 tumor protein p53 binding protein 2 pseudogene…
#>  6 HGNC:43652    43652 TP53COR1  tumor protein p53 pathway corepressor 1        
#>  7 HGNC:19373    19373 TP53I3    tumor protein p53 inducible protein 3          
#>  8 HGNC:16842    16842 TP53I11   tumor protein p53 inducible protein 11         
#>  9 HGNC:25102    25102 TP53I13   tumor protein p53 inducible protein 13         
#> 10 HGNC:18022    18022 TP53INP1  tumor protein p53 inducible nuclear protein 1  
#> # ℹ 13 more rows
```

Search for the whole word `"TP53"` exactly by taking advantage of
regular expressions:

``` r
hgnc_dataset |>
  filter_by_keyword('^TP53$', cols = 'symbol') |>
  dplyr::select(1:4)
#> # A tibble: 1 × 4
#>   hgnc_id    hgnc_id2 symbol name             
#>   <chr>         <int> <chr>  <chr>            
#> 1 HGNC:11998    11998 TP53   tumor protein p53
```

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
