#' @importFrom magrittr %>%
#' @export
magrittr::`%>%`

#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @importFrom lazyeval interp

## paste pipes
`%+%`  <- function(a,b) paste(a, b, sep = '')
`%+|%` <- function(a,b) paste(a, b, sep = '|')
`%+&%` <- function(a,b) paste(a, b, sep = '&')

