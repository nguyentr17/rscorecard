% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/select.R
\name{sc_select}
\alias{sc_select}
\title{Select scorecard data variables.}
\usage{
sc_select(sccall, ...)
}
\arguments{
\item{sccall}{Current list of parameters carried forward from prior
functions in the chain (ignore)}

\item{...}{Desired variable names separated by commas (not case sensitive)}
}
\description{
This function is used to select the variables returned in the final dataset.
}
\examples{
\dontrun{
sc_select(UNITID)
sc_select(UNITID, INSTNM)
sc_select(unitid, instnm)
}
}
