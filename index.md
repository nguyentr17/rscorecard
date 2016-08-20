---
layout: default
title: rscorecard
---

# About 

**rscorecard** is meant to facilitate working with the [U.S. Department of Education College Scorecard](https://collegescorecard.ed.gov) data in R. It is a wrapper for the Scorecard API that uses piped commands a la [`dplyr`](http://github.com/hadley/dplyr) to convert idiomatic R synax into the correct url format.

# Installation

## CRAN

Install the latest released version from CRAN with

```r
install.packages('rscorecard')
```

## GitHub

Install the latest development version from Github with

```r
devtools::install_github('btskinner/rscorecard')
```

This package relies on the following packages, available in CRAN:

* dplyr
* jsonlite
* lazyeval
* magrittr

# Example call

``` r
library(rscorecard)
df <- sc_init() %>% 
    sc_filter(region == 2, ccbasic == c(21,22,23), locale == 41:43) %>% 
    sc_select(unitid, instnm, stabbr) %>% 
    sc_year(2013) %>% 
    sc_get()
df
#> Source: local data frame [8 x 4]
#> 
#>   unitid                                                   instnm stabbr
#>    (int)                                                    (chr)  (chr)
#> 1 194392                  Paul Smiths College of Arts and Science     NY
#> 2 191676                                         Houghton College     NY
#> 3 196051                                Morrisville State College     NY
#> 4 197230                                            Wells College     NY
#> 5 191515                                         Hamilton College     NY
#> 6 214643    Pennsylvania State University-Penn State Wilkes-Barre     PA
#> 7 214759 Pennsylvania State University-Penn State Fayette- Eberly     PA
#> 8 214625  Pennsylvania State University-Penn State New Kensington     PA
#> Variables not shown: year (dbl)
```

