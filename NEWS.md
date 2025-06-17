# hgnc 0.3.0

* Update upstream HGNC server addresses: now provided via Google Storage Bucket.
* Package's source repository is now hosted at <https://github.com/patterninstitute/hgnc>.

# hgnc 0.1.4

* Fix https://github.com/ramiromagno/hgnc/issues/2.

# hgnc 0.1.3

* Transition documentation from https://maialab.org to https://rmagno.eu.
* Updated `ftp_ls()` to reflect server side changes.

# hgnc 0.1.2

* Fixed code examples that relied on Internet resources --- these examples no
longer fail if the resources are not available.
* Eliminated the dependency on *memoise* altogether because of
<https://github.com/r-lib/memoise/issues/76>.

# hgnc 0.1.1

* `filter_by_keyword()` is now vectorised over `keyword`.
* `import_hgnc_dataset()` is now memoised.

# hgnc 0.1.0

* First version of `{hgnc}`.
