---
layout: page
title: "Data dictionary"
---

## `sc_dict()`

To look up information about data elements, use the `sc_dict()` function. 

```r
## search variable descriptions for those containing 'tuition'
sc_dict('tuition')

## search for variable names for those starting with 'st'
sc_dict('^st', search_col = 'varname')

## print entire dictionary (not recommended)
sc_dict('.', limit = Inf)
```