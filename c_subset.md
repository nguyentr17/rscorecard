---
layout: page
title: Subsetting
---

The following commands are structured to behave like [`dplyr`](https://cran.r-project.org/package=dplyr). They can be placed in any order in the piped command chain and each one relies (for the most part) on [non-standard evaluation](https://cran.r-project.org/web/packages/dplyr/vignettes/nse.html) for its arguments. This means that you don't have to quote variable names.

## `sc_select()`

Use `sc_select()` to select the variables (columns) you want in your final dataframe. These variables do not have to be the same as those used to filter the data and are case insensitive. Separate the variable names with commas. The Scorecard API requires that most of the variables be prepended with their category. `sc_select()` uses a hash table to do this automatically for you so you do not have to know or include those (and in fact should not). This command is the only one of the subsetting commands that is required to pull data.

## `sc_filter()`

Use `sc_filter()` to filter the rows you want in your final dataframe. Its main job is to convert idiomatic R code into the format required by the Scorecard API. Like `sc_select()`, `sc_filter` prepends variable categories automatically and variables are case insensitive. Like with `dplyr::filter()`, separate each filtering expression with a comma.There are a few points to note owing to the idiosyncracies of the Scorecard API. First, there are the conversions between R and the Scorecard, shown in the table below.

| Scorecard      |   R   |              R example              |              Conversion              |
|:---------------|:-----:|:-----------------------------------:|:------------------------------------:|
| `,`            | `c()` | `sc_filter(stabbr == c('KY','TN'))` |         `school.state=KY,TN`         |
| `__not`        |  `!=` |     `sc_filter(stabbr != 'KY')`     |        `school.state__not=KY`        |
| `__range`,`..` | `#:#` |     `sc_filter(ccbasic==10:14)`     | `school.carnegie_basic__range=1..14` |
| spaces (`%20`) |  ' '  |  `sc_filter(instnm == 'New York')`  |       `school.name=New%20York`       |

A few notes:

1.  While R can handle a mixture of discrete and ranged values of a single variable (`c(1,2,5:10)`), it does not appear that Scorecard API can. You will either have to overselect and then filter the downloaded dataframe or list every value discretely.
2.  The Scorecard API does not appear to handle `>` or `<` symbols. This means that if you want to select a range of values above a certain threshold (*e.g.,* enrollments above 10,000 students), you may have to give a range of from 10001 to an artifically large number. Same thing but reversed for values under a certain threshold.
3.  Ranged values are inclusive so `1:10` will convert to `__range=1..10` and include both 1 and 10.

## `sc_year()`

All Scorecard variables except those in the root and school categories take a year option. Simply set the data year you want.

**Two important points:**

1.  There is not a consistent scheme mapping data to year. In some cases, data year is the year of collection. In school-year spans (*e.g.,* 2010-2011), the data year is 2010. In some cases, the Scorecard data are defaulted to a different year. You should consult the [Scorecard Documentation](https://collegescorecard.ed.gov/assets/FullDataDocumentation.pdf) to be sure you are getting what you expect.
2.  At this time is only possible to pull down a single year of data at a time.

## `sc_zip()`

Use `sc_zip()` to subset the sample to those institutions within a certain distance around a given zip code. Only one zip code may be given. The default is distance is 25 miles, but both the distance and metric (miles or kilometers) can be changed.
