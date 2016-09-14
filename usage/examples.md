---
layout: page
title: "More examples"
---

<script src="{{ site.baseurl }}/libs/jquery-1.11.3/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="{{ site.baseurl }}/libs/bootstrap-3.3.5/js/bootstrap.min.js"></script>
<script src="{{ site.baseurl }}/libs/bootstrap-3.3.5/shim/html5shiv.min.js"></script>
<script src="{{ site.baseurl }}/libs/bootstrap-3.3.5/shim/respond.min.js"></script>
<script src="{{ site.baseurl }}/libs/htmlwidgets-0.6/htmlwidgets.js"></script>
<link href="{{ site.baseurl }}/libs/leaflet-0.7.3/leaflet.css" rel="stylesheet" />
<script src="{{ site.baseurl }}/libs/leaflet-0.7.3/leaflet.js"></script>
<link href="{{ site.baseurl }}/libs/leafletfix-1.0.0/leafletfix.css" rel="stylesheet" />
<script src="{{ site.baseurl }}/libs/leaflet-binding-1.0.1/leaflet.js"></script>

<style type="text/css">code{white-space: pre;}</style>
<link rel="stylesheet"
      href="{{ site.baseurl }}/libs/highlight/default.css"
      type="text/css" />
<script src="{{ site.baseurl }}/libs/highlight/highlight.js"></script>

<script type="text/javascript">
if (window.hljs && document.readyState && document.readyState === "complete") {
   window.setTimeout(function() {
      hljs.initHighlighting();
   }, 0);
}
</script>

## Using area within zip code

``` r
library(rscorecard)

## public schools within 50 miles of midtown Nashville, TN
df <- sc_init() %>%
    sc_filter(control == 1) %>%
    sc_select(instnm, longitude, latitude) %>%
    sc_year(2014) %>%
    sc_zip(37203, 50) %>%
    sc_get()

df

## Source: local data frame [10 x 4]
## 
##    latitude                                               instnm longitude
##       (dbl)                                                (chr)     (dbl)
## 1  35.84914                    Middle Tennessee State University -86.36209
## 2  36.13265    Tennessee College of Applied Technology Nashville -86.85634
## 3  36.05055      Tennessee College of Applied Technology-Dickson -87.36646
## 4  36.13545                    Nashville State Community College -86.85672
## 5  35.84758 Tennessee College of Applied Technology-Murfreesboro -86.44816
## 6  36.38719   Tennessee College of Applied Technology-Hartsville -86.14366
## 7  36.53332                         Austin Peay State University -87.35408
## 8  36.36360                    Volunteer State Community College -86.49732
## 9  35.61676                     Columbia State Community College -87.10192
## 10 36.16899                           Tennessee State University -86.82937
## Variables not shown: year (dbl)
```

### Mapping with Leaflet

``` r
library(leaflet)

## map public schools within 50 miles of midtown Nashville, TN
m <- leaflet(df) %>%
    addTiles() %>%
    addMarkers(~longitude, ~latitude, popup = ~instnm)
m
```

<div id="htmlwidget-4401" style="width:800px;height:600px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-4401">{"x":{"calls":[{"method":"addTiles","args":["http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"maxNativeZoom":null,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"continuousWorld":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":null,"unloadInvisibleTiles":null,"updateWhenIdle":null,"detectRetina":false,"reuseTiles":false,"attribution":"&copy; <a href=\"http://openstreetmap.org\">OpenStreetMap\u003c/a> contributors, <a href=\"http://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA\u003c/a>"}]},{"method":"addMarkers","args":[[35.849139,36.132649,36.050549,36.135453,35.847576,36.387191,36.533319,36.363603,35.616757,36.16899],[-86.362094,-86.856335,-87.366455,-86.856723,-86.448159,-86.14366,-87.354081,-86.497317,-87.101917,-86.82937],null,null,null,{"clickable":true,"draggable":false,"keyboard":true,"title":"","alt":"","zIndexOffset":0,"opacity":1,"riseOnHover":false,"riseOffset":250},["Middle Tennessee State University","Tennessee College of Applied Technology Nashville","Tennessee College of Applied Technology-Dickson","Nashville State Community College","Tennessee College of Applied Technology-Murfreesboro","Tennessee College of Applied Technology-Hartsville","Austin Peay State University","Volunteer State Community College","Columbia State Community College","Tennessee State University"],null,null]}],"limits":{"lat":[35.616757,36.533319],"lng":[-87.366455,-86.14366]}},"evals":[],"jsHooks":[]}</script>

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
