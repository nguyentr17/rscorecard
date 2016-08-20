---
layout: page
title: "More examples"
---

## Using area within zip code

``` r
## public schools within 50 miles of midtown Nashville, TN
df <- sc_init() %>% 
    sc_filter(control == 1) %>% 
    sc_select(unitid, instnm, stabbr) %>% 
    sc_year(2013) %>% 
    sc_zip(37203, 50) %>%
    sc_get()
df
#> Source: local data frame [10 x 4]
#> 
#>    unitid                                               instnm stabbr
#>     (int)                                                (chr)  (chr)
#> 1  221102 Tennessee College of Applied Technology-Murfreesboro     TN
#> 2  221184                    Nashville State Community College     TN
#> 3  219888                     Columbia State Community College     TN
#> 4  219602                         Austin Peay State University     TN
#> 5  220978                    Middle Tennessee State University     TN
#> 6  219994      Tennessee College of Applied Technology-Dickson     TN
#> 7  222053                    Volunteer State Community College     TN
#> 8  221838                           Tennessee State University     TN
#> 9  220279   Tennessee College of Applied Technology-Hartsville     TN
#> 10 248925    Tennessee College of Applied Technology-Nashville     TN
#> Variables not shown: year (dbl)
```

## Large pull

``` r
## median earnings for students who first enrolled in a public
## college in the New England or Mid-Atlantic regions: 10 years later
df <- sc_init() %>% 
    sc_filter(control == 1, region == 1:2, ccbasic == 1:24) %>% 
    sc_select(unitid, instnm, md_earn_wne_p10) %>% 
    sc_year(2009) %>%
    sc_get()
#> Large request will require: 3 additional pulls.
#> Request chunk 1
#> Request chunk 2
#> Request chunk 3
df
#> Source: local data frame [283 x 4]
#> 
#>    unitid                                    instnm md_earn_wne_p10  year
#>     (int)                                     (chr)           (int) (dbl)
#> 1  191083                    Erie Community College           26600  2009
#> 2  128780                 Charter Oak State College               0  2009
#> 3  366395          Suffolk County Community College           38200  2009
#> 4  434672 The Community College of Baltimore County           36200  2009
#> 5  436836        University of Connecticut-Stamford           54500  2009
#> 6  436818      University of Connecticut-Tri-Campus           54500  2009
#> 7  436827     University of Connecticut-Avery Point           54500  2009
#> 8  166513        University of Massachusetts-Lowell           50800  2009
#> 9  166638        University of Massachusetts-Boston           46000  2009
#> 10 166647       Massachusetts Bay Community College           40100  2009
#> ..    ...                                       ...             ...   ...
```
