# rscorecard

This package is meant to facilitate working with the U.S. [Department of Education College Scorecard](https://collegescorecard.ed.gov) data in R. It is a wrapper
for the Scorecard API that uses piped commands a la [`dplyr`](http://github.com/hadley/dplyr) to convert idiomatic R into the
correct url format.

Download the development version with

```{r}
devtools::install('btskinner/rscorecard')
```

This package relies on the following packages, available in CRAN:

* dplyr
* jsonlite
* lazyeval
* magrittr

## Example call

```{r}
df <- sc_init() %>% 
    sc_filter(region == 2, ccbasic == c(21,22,23), locale == 41:43) %>% 
    sc_select(unitid, instnm, stabbr) %>% 
    sc_year(2013) %>% 
    sc_get()
df
```

For more examples, see the vignette. For information about the data currently available through the API, see the [data documentation](https://collegescorecard.ed.gov/assets/FullDataDocumentation.pdf) or download the [data dictionary](https://collegescorecard.ed.gov/assets/CollegeScorecardDataDictionary-09-08-2015.csv)