rscorecard <img src="man/figures/logo.png" align="right" />
===========================================================

[![Build
Status](https://travis-ci.org/btskinner/rscorecard.svg?branch=master)](https://travis-ci.org/btskinner/rscorecard)
[![GitHub
release](https://img.shields.io/github/release/btskinner/rscorecard.svg)](https://github.com/btskinner/rscorecard)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/rscorecard)](http://cran.r-project.org/package=rscorecard)

This package is an R wrapper for the [U.S. Department of Education
College Scorecard](https://collegescorecard.ed.gov) API. It allows users
to select and filter Scorecard variables with piped commands a la
[`dplyr`](http://github.com/hadley/dplyr).

Installation
------------

Install the latest released version from CRAN with

    install.packages('rscorecard')

Install the latest development version from Github with

    devtools::install_github('btskinner/rscorecard')

This package relies on the Scorecard data dictionary, so I will attempt
to update it in a timely fashion whenever new Scorecard data are
released. Because it sometimes takes a few days to get a package on
CRAN, you may want to download the developmental version in the days
immediately following a data update.

Usage
-----

### Set API key

Get your Data.gov API key at <https://api.data.gov/signup/>. Save your
key in your R environment at the start of your R session using
`sc_key()`:

    ## use your real key in place of the Xs
    sc_key('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')

### Request data

    library(rscorecard)

    df <- sc_init() %>% 
        sc_filter(region == 2, ccbasic == c(21,22,23), locale == 41:43) %>% 
        sc_select(unitid, instnm, stabbr) %>% 
        sc_year(2013) %>% 
        sc_get()

    ## Request complete!

    df

    ## # A tibble: 8 x 4
    ##   instnm                                                   stabbr unitid  year
    ## * <chr>                                                    <chr>   <int> <dbl>
    ## 1 Pennsylvania State University-Penn State Wilkes-Barre    PA     214643  2013
    ## 2 Pennsylvania State University-Penn State New Kensington  PA     214625  2013
    ## 3 Paul Smiths College of Arts and Science                  NY     194392  2013
    ## 4 Houghton College                                         NY     191676  2013
    ## 5 Hamilton College                                         NY     191515  2013
    ## 6 Morrisville State College                                NY     196051  2013
    ## 7 Wells College                                            NY     197230  2013
    ## 8 Pennsylvania State University-Penn State Fayette- Eberly PA     214759  2013

For more example calls, see the [extended
vignette](http://btskinner.me/rscorecard).

### Data dictionary

To look up information about data elements, use the `sc_dict()`
function.

    sc_dict('control')

    ## 
    ## ---------------------------------------------------------------------
    ## varname: control                                     category: school
    ## ---------------------------------------------------------------------
    ## DEVELOPER FRIENDLY NAME:
    ## 
    ## ownership
    ## 
    ## DESCRIPTION:
    ## 
    ## Control of institution
    ## 
    ## VALUES: 
    ## 
    ## 1 = Public
    ## 2 = Private nonprofit
    ## 3 = Private for-profit
    ## 
    ## Printed information for 1 of out 1 variables.

Further references
------------------

-   [College Scorecard Website](https://collegescorecard.ed.gov)
-   [Data
    documentation](https://collegescorecard.ed.gov/assets/FullDataDocumentation.pdf)
-   [Data dictionary
    \[XLS\]](https://collegescorecard.ed.gov/assets/CollegeScorecardDataDictionary.xlsx)
-   Reports
    -   [Policy
        paper](https://collegescorecard.ed.gov/assets/BetterInformationForBetterCollegeChoiceAndInstitutionalPerformance.pdf)
    -   [Technical
        paper](https://collegescorecard.ed.gov/assets/UsingFederalDataToMeasureAndImprovePerformance.pdf)
