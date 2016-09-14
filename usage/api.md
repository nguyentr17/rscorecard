---
layout: page
title: "Set API key"
---


## `sc_key()`
Once you've gotten your API key from <https://api.data.gov/signup>, you can store it using `sc_key()`. 

``` r
# NB: You must use a real key, of course... 
sc_key('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')
```
In the absence of a key value argument, `sc_get()` will search your R environment for `DATAGOV_API_KEY`. It will complete the data request if found. The `sc_key()` command will store your key in `DATAGOV_API_KEY`, which will persist until the R session is closed.

If you want a more permanent solution, you can add the following line (with your actual key, of course) to your `.Renviron` file. See this [appendix](ftp://cran.r-project.org/pub/R/web/packages/httr/vignettes/api-packages.html) for more information.

``` r
# NB: You must use a real key, of course... 
DATAGOV_API_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```
