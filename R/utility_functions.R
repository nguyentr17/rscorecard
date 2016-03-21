#' @importFrom magrittr %>%
#' @export
magrittr::`%>%`

#' @importFrom jsonlite fromJSON

## paste pipes
`%+%`  <- function(a,b) paste(a, b, sep = '')
`%+|%` <- function(a,b) paste(a, b, sep = '|')
`%+&%` <- function(a,b) paste(a, b, sep = '&')
