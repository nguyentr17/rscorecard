#' Subset results to those within specified area around zip code.
#'
#' @param sccall Current list of parameters carried forward from prior
#'     functions in the chain (ignore)
#' @param zip A zipcode
#' @param distance An integer distance in miles or kilometers
#' @param km A boolean value set to \code{TRUE} if distance should be
#'     in kilometers (default is \code{FALSE} for miles)
#' @examples
#' sc_zip(37203)
#' sc_zip(37203, 50)
#' sc_zip(37203, 50, km = TRUE)

#' @export
sc_zip <- function(sccall = ., zip, distance = 25, km = FALSE) {

    stub <- '&_zip=' %+% zip %+% '&_distance=' %+% distance

    if (km) {
        sccall[['zip']] <- stub %+% 'km'
    } else {
        sccall[['zip']] <- stub
    }

    sccall

}



