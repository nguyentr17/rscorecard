#' Select scorecard data variables.
#'
#' This function is used to select the variables returned in the final dataset.
#'
#' @param sccall Current list of parameters carried forward from prior
#'     functions in the chain (ignore)
#' @param ... Desired variable names separated by commas (not case sensitive)
#' @examples
#' sc_select(UNITID)
#' sc_select(UNITID, INSTNM)
#' sc_select(unitid, instnm)

#' @export
sc_select <- function(sccall = ., ...) {

    vars <- lapply(lazyeval::lazy_dots(...), function(x) bquote(.(x[['expr']])))

    ## convert to developer-friendly names
    if (!sccall[['dfvars']]) {
        vars <- vapply(vars, function(x) { hash[[tolower(as.character(x))]] },
                       character(1), USE.NAMES = FALSE)
    }

    ## grab categories
    cats <- vapply(vars, function(x) { hash[[as.character(x) %+% '_c']] },
                   character(1), USE.NAMES = FALSE)

    ## paste, clean, and return
    vars <- paste(cats %+% '.' %+% vars, collapse = ',')
    vars <- gsub('root.', '', vars, fixed = TRUE)
    sccall[['select']] <- '&_fields=' %+% vars
    sccall

}




