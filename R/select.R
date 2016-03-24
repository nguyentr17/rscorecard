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

    ## check first argument
    if (identical(class(try(sccall, silent = TRUE)), 'try-error')) {
        stop('\nChain not properly initialized. '
             %+% 'Be sure to start with sc_init().\n\n', call. = FALSE)
    }

    ## get vars
    vars <- lapply(lazyeval::lazy_dots(...), function(x) bquote(.(x[['expr']])))

    ## confirm has a least one variable
    if (length(vars) < 1) {
        stop('\nIncomplete select! You must select at least one variable.\n\n',
             call. = FALSE)
    }

    ## confirm variables exist in dictionary
    for (v in vars) {
        if (!sc_dict(tolower(as.character(v)), confirm = TRUE)) {
            stop('\nVariable \"' %+% v %+% '\" not found in dictionary.\n'
                 %+% 'Please check your spelling or search dictionary: '
                 %+% '?sc_dict()\n\n', call. = FALSE)
        }
    }

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




