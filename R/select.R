#' Select scorecard data variables.
#'
#' This function is used to select the variables returned in the final dataset.
#'
#' @param sccall Current list of parameters carried forward from prior
#'     functions in the chain (ignore)
#' @param ... Desired variable names separated by commas (not case sensitive)
#' @examples
#' \dontrun{
#' sc_select(UNITID)
#' sc_select(UNITID, INSTNM)
#' sc_select(unitid, instnm)
#' }

#' @export
sc_select <- function(sccall, ...) {

    ## vars in ... to list
    vars <- lapply(lazyeval::lazy_dots(...), function(x) bquote(.(x[['expr']])))

    ## give to _ version
    sc_select_(sccall, vars)

}

#' @describeIn sc_select Standard evaluation version of
#'     \code{\link{sc_select}} (\code{vars} must be string or vector
#'     of strings when using this version)
#'
#' @param vars Character string of variable name or vector of
#'     character string variable names
#'
#' @examples
#' \dontrun{
#' sc_select_('UNITID')
#' sc_select_(c('UNITID', 'INSTNM'))
#' sc_select_(c('unitid', 'instnm'))
#'
#' ## stored in object
#' vars_to_pull <- c('unitid','instnm')
#' sc_select(vars_to_pull)
#' }
#'
#' @export
sc_select_ <- function(sccall, vars) {

    ## check first argument
    if (identical(class(try(sccall, silent = TRUE)), 'try-error')) {
        stop('Chain not properly initialized. '
             %+% 'Be sure to start with sc_init().', call. = FALSE)
    }

    ## confirm has a least one variable
    if (missing(vars) || length(vars) < 1) {
        stop('Incomplete select! You must select at least one variable.',
             call. = FALSE)
    }

    ## confirm variables exist in dictionary
    for (v in vars) {
        if (!sc_dict(tolower(as.character(v)), confirm = TRUE)) {
            stop('Variable \"' %+% v %+% '\" not found in dictionary. '
                 %+% 'Please check your spelling or search dictionary: '
                 %+% '?sc_dict()', call. = FALSE)
        }
    }

    ## convert to developer-friendly names
    if (!sccall[['dfvars']]) {
        vars <- vapply(vars, function(x) { sc_hash[[tolower(as.character(x))]] },
                       character(1), USE.NAMES = FALSE)
    }

    ## grab categories
    cats <- vapply(vars, function(x) { sc_hash[[as.character(x) %+% '_c']] },
                   character(1), USE.NAMES = FALSE)

    ## paste, clean, and return
    vars <- paste(cats %+% '.' %+% vars, collapse = ',')
    vars <- gsub('root.', '', vars, fixed = TRUE)
    sccall[['select']] <- '&_fields=' %+% vars
    sccall

}




