#' Subset results to those within specified area around zip code.
#'
#' @param sccall Current list of parameters carried forward from prior
#'     functions in the chain (ignore)
#' @param zip A 5-digit zipcode
#' @param distance An integer distance in miles or kilometers
#' @param km A boolean value set to \code{TRUE} if distance should be
#'     in kilometers (default is \code{FALSE} for miles)
#' @section Note: Zip codes with leading zeros (Northeast) can be
#'     called either using a string (\code{'02111'}) or as a numeric
#'     (\code{02111}). R will drop the leading zero from the second
#'     version, but \code{sc_zip()} will add it back before the
#'     call. The shortened version without the leading zero may also
#'     be used (2111 and '2111' both become '02111'), but is not
#'     recommended for clarity.
#' @examples
#' \dontrun{
#' sc_zip(37203)
#' sc_zip(37203, 50)
#' sc_zip(37203, 50, km = TRUE)
#' sc_zip('02111')              # 1. Using string
#' sc_zip(02111)                # 2. Dropped leading zero will be added
#' sc_zip(2111)                 # 3. Will become '02111' (not recommended)
#' }

#' @export
sc_zip <- function(sccall, zip, distance = 25, km = FALSE) {

    ## check first argument
    if (identical(class(try(sccall, silent = TRUE)), 'try-error')
        || !is.list(sccall)) {
        stop('Chain not properly initialized. Be sure to start with sc_init().',
             call. = FALSE)
    }

    ## check second argument
    if (missing(zip)) {
        stop('Must provide a zip code.', call. = FALSE)
    }

    if (suppressWarnings(is.na(as.numeric(zip))) {
        stop('Zip code must contain only digits.', call. = FALSE)
    }

    if (nchar(zip) > 5) {
        stop('Must provide only 5-digit zip code (no ZIP+4).', call. = FALSE)
    }

    if (nchar(zip) < 5) {
        zip <- sprintf('%05d', zip)
        message('Zip code has fewer than 5 characters. Leading zero(s) added.')
    }

    ## check third argument
    if (suppressWarnings(is.na(as.numeric(distance))) {
        stop('Distance may only contain digits.', call. = FALSE)
    }

    ## add to stub
    stub <- '&_zip=' %+% zip %+% '&_distance=' %+% distance

    if (km) {
        sccall[['zip']] <- stub %+% 'km'
    } else {
        sccall[['zip']] <- stub
    }

    sccall

}



