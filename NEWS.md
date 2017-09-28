# rscorecard 0.4.0

* update dictionary for 28 September 2017 release of scorecard data
* update link in introduction vignette
* change contact information
* read data dictionary sheet by name instead of sheet number when
  making `sysdata.rda` in `./data-raw/make_dict_hash.R`
* correct `sc_get()` to use `floor()` instead of `ceiling()` so that
  it doesn't make unnecessary API request/pull (h/t @jjchern)

# rscorecard 0.3.3

### Bug fix
* allow `sc_filter()` to use subset object vectors

# rscorecard 0.3.2

* allow `sc_filter()` to use vectors stored in objects
* allow `sc_filter()` to use `%in%` operator

# rscorecard 0.3.1

* update dictionary for 13 January 2017 release of scorecard data
* update `sc_dict()` to search all columns by default
* update internal hash lookup environment to have less generic name

# rscorecard 0.2.5

* fixed `sc_dict()` bug that wouldn't allow for search by developer friendly names

# rscorecard 0.2.4

* initial release
