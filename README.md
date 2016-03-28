# rscorecard

[![Build Status](https://travis-ci.org/btskinner/rscorecard.svg?branch=master)](https://travis-ci.org/btskinner/rscorecard)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/rscorecard)](http://cran.r-project.org/package=rscorecard)

This package is meant to facilitate working with the [U.S. Department of Education College Scorecard](https://collegescorecard.ed.gov) data in R. It is a wrapper
for the Scorecard API that uses piped commands a la [`dplyr`](http://github.com/hadley/dplyr) to convert idiomatic R synax into the correct url format.

Install the latest released version from CRAN with

```{r}
install.packages('rscorecard')
```

Install the latest development version from Github with

```{r}
devtools::install_github('btskinner/rscorecard')
```

This package relies on the following packages, available in CRAN:

* dplyr
* jsonlite
* lazyeval
* magrittr

## Example call

```{r}
library(rscorecard)

df <- sc_init() %>% 
    sc_filter(region == 2, ccbasic == c(21,22,23), locale == 41:43) %>% 
    sc_select(unitid, instnm, stabbr) %>% 
    sc_year(2013) %>% 
    sc_get()
df
```

For more example calls, see the vignette. 

## Data dictionary

To look up information about data elements, use the `sc_dict()` function. 

```{r}
## search variable descriptions for those containing 'tuition'
sc_dict('tuition')

## search for variable names for those starting with 'st'
sc_dict('^st', search_col = 'varname')

## print entire dictionary (not recommended)
sc_dict('.', limit = Inf)
```

## API key

Get your Data.gov API key at [https://api.data.gov/signup/]().
Save your key in your R environment at the start of your R session using `sc_key()`:

```{r}
## use your real key in place of the Xs
sc_key('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')
```

## Further references

* [College Scorecard Website](https://collegescorecard.ed.gov)
* [Data documentation](https://collegescorecard.ed.gov/assets/FullDataDocumentation.pdf) 
* [Data dictionary [CSV]](https://collegescorecard.ed.gov/assets/CollegeScorecardDataDictionary-09-08-2015.csv)
* Reports
	* [Policy paper](https://collegescorecard.ed.gov/assets/BetterInformationForBetterCollegeChoiceAndInstitutionalPerformance.pdf)
	* [Technical paper](https://collegescorecard.ed.gov/assets/UsingFederalDataToMeasureAndImprovePerformance.pdf)