col_descriptions <- function() {
  paste(
    paste("- `hgnc_id`:", desc_hgnc_id()),
    paste("- `hgnc_id2`:", desc_hgnc_id2()),
    paste("- `symbol`:", desc_symbol()),
    paste("- `name`:", desc_name()),
    paste("- `locus_group`:", desc_locus_group()),
    paste("- `locus_type`:", desc_locus_type()),
    paste("- `status`:", desc_status()),
    paste("- `location`:", desc_location()),
    paste("- `location_sortable`:", desc_location_sortable()),
    paste("- `alias_symbol`:", desc_alias_symbol()),
    paste("- `alias_name`:", desc_alias_name()),
    paste("- `prev_symbol`:", desc_prev_symbol()),
    paste("- `prev_name`:", desc_prev_name()),
    paste("- `gene_group`:", desc_gene_group()),
    paste("- `gene_group_id`:", desc_gene_group_id()),
    paste("- `date_approved_reserved`:", desc_date_approved_reserved()),
    paste("- `date_symbol_changed`:", desc_date_symbol_changed()),
    paste("- `date_name_changed`:", desc_date_name_changed()),
    paste("- `date_modified`:", desc_date_modified()),
    paste("- `entrez_id`:", desc_entrez_id()),
    paste("- `ensembl_gene_id`:", desc_ensembl_gene_id()),
    paste("- `vega_id`:", desc_vega_id()),
    paste("- `ucsc_id`:", desc_ucsc_id()),
    paste("- `ena`:", desc_ena()),
    paste("- `refseq_accession`:", desc_refseq_accession()),
    paste("- `ccds_id`:", desc_ccds_id()),
    paste("- `uniprot_ids`:", desc_uniprot_ids()),
    paste("- `pubmed_id`:", desc_pubmed_id()),
    paste("- `mgd_id`:", desc_mgd_id()),
    paste("- `rgd_id`:", desc_rgd_id()),
    paste("- `lsdb`:", desc_lsdb()),
    paste("- `cosmic`:", desc_cosmic()),
    paste("- `omim_id`:", desc_omim_id()),
    paste("- `mirbase`:", desc_mirbase()),
    paste("- `homeodb`:", desc_homeodb()),
    paste("- `snornabase`:", desc_snornabase()),
    paste("- `bioparadigms_slc`:", desc_bioparadigms_slc()),
    paste("- `orphanet`:", desc_orphanet()),
    paste("- `pseudogene_org`:", desc_pseudogene_org()),
    paste("- `horde_id`:", desc_horde_id()),
    paste("- `merops`:", desc_merops()),
    paste("- `imgt`:", desc_imgt()),
    paste("- `iuphar`:", desc_iuphar()),
    paste("- `kznf_gene_catalog`:", desc_kznf_gene_catalog()),
    paste("- `mamit_trnadb`:", desc_mamit_trnadb()),
    paste("- `cd`:", desc_cd()),
    paste("- `lncrnadb`:", desc_lncrnadb()),
    paste("- `enzyme_id`:", desc_enzyme_id()),
    paste("- `intermediate_filament_db`:", desc_intermediate_filament_db()),
    paste("- `rna_central_ids`:", desc_rna_central_ids()),
    paste("- `lncipedia`:", desc_lncipedia()),
    paste("- `gtrnadb`:", desc_gtrnadb()),
    paste("- `agr`:", desc_agr()),
    paste("- `mane_select`:", desc_mane_select()),
    paste("- `gencc`:", desc_gencc()),
    sep = "\n"
  )
}

desc_hgnc_id <- function() {
  paste(
    "A unique ID provided by HGNC for each gene with an approved symbol.",
    "IDs are of the format `'HGNC:n'`, where `n` is a unique number. HGNC IDs remain",
    "stable even if a name or symbol changes."
  )
}

desc_hgnc_id2 <- function() {
  paste(
    "A stripped down version of `hgnc_id` where the prefix `'HGNC:'` has been removed.",
    "This column is added by the package `{hgnc}`."
  )
}

desc_symbol <- function() {
  paste(
    "The official gene symbol approved by the HGNC, typically a short form of the gene name.",
    "Symbols are approved in accordance with the Guidelines for Human Gene Nomenclature."
  )
}

desc_name <- function() {
  paste(
    "The full gene name approved by the HGNC; corresponds to the approved symbol above."
  )
}

desc_locus_group <- function() {
  paste(
    "A group name for a set of related locus types as defined by the HGNC.",
    "One of: `'protein-coding gene'`, `'non-coding RNA'`, `'pseudogene'` or `'other'`."
  )
}

desc_locus_type <- function() {
  paste(
    "Specifies the genetic class of each gene entry, including various types of RNA",
    "and other gene-related categories, such as pseudogenes and virus integration sites."
  )
}

desc_status <- function() {
  paste(
    "Status of the symbol report, which can be either `'Approved'` or `'Entry Withdrawn'`."
  )
}

desc_location <- function() {
  paste(
    "Chromosomal location. Indicates the cytogenetic location of the gene or region on",
    "the chromosome, e.g., `'19q13.43'`. In the absence of that information,",
    "it may be listed as `'not on reference assembly'`, `'unplaced'`, or `'reserved'`."
  )
}

desc_location_sortable <- function() {
  paste(
    "A sortable version of the `location` column, allowing easier sorting by chromosomal",
    "location."
  )
}

desc_alias_symbol <- function() {
  paste(
    "Alternative symbols that have been used to refer to the gene. Aliases may be from",
    "literature, other databases, or represent membership of a gene group."
  )
}

desc_alias_name <- function() {
  paste(
    "Alternative names for the gene. Aliases may be from literature, other databases,",
    "or represent membership of a gene group."
  )
}

desc_prev_symbol <- function() {
  paste(
    "This field displays any symbols that were previously HGNC-approved nomenclature."
  )
}

desc_prev_name <- function() {
  paste(
    "This field displays any names that were previously HGNC-approved nomenclature."
  )
}

desc_gene_group <- function() {
  paste(
    "A gene group. Each gene has been assigned to one or more groups, according to either",
    "sequence similarity or information from publications, specialist advisors, or other databases."
  )
}

desc_gene_group_id <- function() {
  paste(
    "Gene group identifier, an integer number. This column contains the gene group identifiers.",
    "See `gene_group` for the gene group name."
  )
}

desc_date_approved_reserved <- function() {
  paste(
    "The date the entry was first approved."
  )
}

desc_date_symbol_changed <- function() {
  paste(
    "The date the gene symbol was last changed."
  )
}

desc_date_name_changed <- function() {
  paste(
    "The date the gene name was last changed."
  )
}

desc_date_modified <- function() {
  paste(
    "Date the entry was last modified."
  )
}

desc_entrez_id <- function() {
  paste(
    "Entrez gene identifier."
  )
}

desc_ensembl_gene_id <- function() {
  paste(
    "Ensembl gene identifier."
  )
}

desc_vega_id <- function() {
  paste(
    "VEGA gene identifier."
  )
}

desc_ucsc_id <- function() {
  paste(
    "UCSC gene identifier."
  )
}

desc_ena <- function() {
  paste(
    "International Nucleotide Sequence Database Collaboration (GenBank, ENA and DDBJ)",
    "accession number(s)."
  )
}

desc_refseq_accession <- function() {
  paste(
    "The Reference Sequence (RefSeq) identifier for that entry, provided by the NCBI."
  )
}

desc_ccds_id <- function() {
  paste(
    "Consensus CDS identifier."
  )
}

desc_uniprot_ids <- function() {
  paste(
    "UniProt protein accession."
  )
}

desc_pubmed_id <- function() {
  paste(
    "Pubmed and Europe Pubmed Central PMIDs."
  )
}

desc_mgd_id <- function() {
  paste(
    "Mouse genome informatics database identifier."
  )
}

desc_rgd_id <- function() {
  paste(
    "Rat genome database gene identifier."
  )
}

desc_lsdb <- function() {
  paste(
    "The name of the Locus Specific Mutation Database and URL for the gene."
  )
}

desc_cosmic <- function() {
  paste(
    "Symbol used within the Catalogue of somatic mutations in cancer for the gene."
  )
}

desc_omim_id <- function() {
  paste(
    "Online Mendelian Inheritance in Man (OMIM) identifier."
  )
}

desc_mirbase <- function() {
  paste(
    "miRBase identifier."
  )
}

desc_homeodb <- function() {
  paste(
    "Homeobox Database identifier."
  )
}

desc_snornabase <- function() {
  paste(
    "snoRNABase identifier."
  )
}

desc_bioparadigms_slc <- function() {
  paste(
    "Symbol used to link to the SLC tables database at bioparadigms.org for the gene."
  )
}

desc_orphanet <- function() {
  paste(
    "Orphanet identifier."
  )
}

desc_pseudogene_org <- function() {
  paste(
    "Pseudogene.org identifier."
  )
}

desc_horde_id <- function() {
  paste(
    "Symbol used within HORDE for the gene."
  )
}

desc_merops <- function() {
  paste(
    "Identifier used to link to the MEROPS peptidase database."
  )
}

desc_imgt <- function() {
  paste(
    "Symbol used within international ImMunoGeneTics information system."
  )
}

desc_iuphar <- function() {
  paste(
    "The objectId used to link to the IUPHAR/BPS Guide to PHARMACOLOGY database."
  )
}

desc_kznf_gene_catalog <- function() {
  paste(
    "Lawrence Livermore National Laboratory Human KZNF Gene Catalog (LLNL) identifier."
  )
}

desc_mamit_trnadb <- function() {
  paste(
    "Identifier to link to the Mamit-tRNA database."
  )
}

desc_cd <- function() {
  paste(
    "Symbol used within the Human Cell Differentiation Molecule database for the gene."
  )
}

desc_lncrnadb <- function() {
  paste(
    "lncRNA Database identifier."
  )
}

desc_enzyme_id <- function() {
  paste(
    "ENZYME EC accession number."
  )
}

desc_intermediate_filament_db <- function() {
  paste(
    "Identifier used to link to the Human Intermediate Filament Database."
  )
}

desc_rna_central_ids <- function() {
  paste(
    "Identifier in the RNAcentral, The non-coding RNA sequence database."
  )
}

desc_lncipedia <- function() {
  paste(
    "The LNCipedia identifier to which the gene belongs. This will only appear if the",
    "gene is a long non-coding RNA."
  )
}

desc_gtrnadb <- function() {
  paste(
    "The GtRNAdb identifier to which the gene belongs. This will only appear if the gene",
    "is a tRNA."
  )
}

desc_agr <- function() {
  paste(
    "The Alliance of Genomic Resources HGNC ID for the Human gene page within the resource."
  )
}

desc_mane_select <- function() {
  paste(
    "MANE Select nucleotide accession with version (i.e., NCBI RefSeq or Ensembl transcript",
    "ID and version)."
  )
}

desc_gencc <- function() {
  paste(
    "Gene Curation Coalition (GenCC) Database identifier."
  )
}
