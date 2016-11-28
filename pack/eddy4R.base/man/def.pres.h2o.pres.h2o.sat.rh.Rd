% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/def.pres.h2o.pres.h2o.sat.rh.R
\name{def.pres.h2o.pres.h2o.sat.rh}
\alias{def.pres.h2o.pres.h2o.sat.rh}
\title{Calculate water vapor pressure from saturated water vapor pressure and relative humidity}
\usage{
def.pres.h2o.pres.h2o.sat.rh(presH2oSat, rh)
}
\arguments{
\item{\code{presH2oSat}}{Either a vector or an object of class numeric of saturated water vapor pressure and of the same length as \code{rh}. [Pa]}

\item{\code{rh}}{Either a vector or an object of class numeric of relative humidity and of the same length as \code{presH2oSat}. [-]}
}
\value{
Water vapor pressure and of the same length as \code{presH2oSat} and \code{rh}. [Pa]
}
\description{
Calculate water vapor pressure from saturated water vapor pressure and relative humidity.
}
\examples{
def.pres.h2o.pres.h2o.sat.rh(presH2oSat = 3160.057, rh = 0.65)
def.pres.h2o.pres.h2o.sat.rh(presH2oSat = c(422.19, 1701.67, 6265.31), rh = c(0.10, 0.45, 0.80))
}
\author{
Stefan Metzger \email{eddy4R.info@gmail.com} \cr
Natchaya Pingintha-Durden
}
\references{
License: Terms of use of the NEON FIU algorithm repository dated 2015-01-16
}
\seealso{
Currently none
}
\keyword{conversion}
\keyword{humidity}
