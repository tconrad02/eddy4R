% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/def.dp01.R
\name{def.dp01}
\alias{def.dp01}
\title{Definition function: Create NEON Level 1 data product descriptive statistics}
\usage{
def.dp01(data, vrbs = FALSE)
}
\arguments{
\item{data}{A numeric vector or data.frame containing the L0p (calibrated) input data at native resolution. Of class numeric". [-]}

\item{vrbs}{Verbose output, one of either TRUE of FALSE, defaults to FALSE. If \code{vrbs = FALSE} is selected, the returned object is a data.frame. If  \code{vrbs = TRUE} is selected, the returned object is a list supporting the propagation of unit attributes for individual variables in \code{data}. Of class logical". [-]}
}
\value{
Descriptive statistics, for \code{vrbs = FALSE} a data frame and for \code{vrbs = TRUE} a list:\cr
\code{mean} The mean of non-NA values in \code{data}
\code{min} The minimum value of non-NA values in \code{data}
\code{max} The maximum value of non-NA values in \code{data}
\code{vari} The variance of non-NA values in \code{data}
\code{num} The number of non-NA values in \code{data}
\code{se} The standard error of the mean of non-NA values in \code{data}
}
\description{
Function definition. Compute NEON Level 1 data product descriptive statistics (mean, minimum, maximum, variance, number of non-NA points) by aggregating the input data over its entire range.
}
\examples{
# argument vrbs changes format of reported object

   # Calibrated raw data
     data <- c(1,2,3,NA,5,6,7,NaN,9,10)
     
   # Level 1 descriptive statistics
     dp01 <- def.dp01(data = data)
     
   # Level 1 descriptive statistics in verbose output
     dp01Vrbs <- def.dp01(data = data, vrbs = TRUE)

# argument vrbs = TRUE is useful for preserving unit information on
# per-variable basis and use with lapply() and do.call()

   # data.frame which variables contain the unit attributes

     # create data.frame
     data <- data.frame(
       velo = rnorm(10),
       temp = rnorm(10),
       dist = rnorm(10)
     )
 
     # assign unit attribute
     attributes(data$velo)$unit <- "m s-1"
     attributes(data$temp)$unit <- "K"
     attributes(data$dist)$unit <- "m"

   # vrbs = FALSE does not propagate unit information
   attributes(def.dp01(data = data, vrbs = FALSE)$se.velo)$unit
   # NULL
   
   # vrbs = TRUE propagates unit information
   attributes(def.dp01(data = data, vrbs = TRUE)$se$velo)$unit
   # [1] "m s-1"
}
\references{
License: GNU AFFERO GENERAL PUBLIC LICENSE Version 3, 19 November 2007. \cr
NEON.DOC.003311 - NEON DATA PRODUCTS DEVELOPMENT PLAN
}
\seealso{
Currently none.
}
\author{
Stefan Metzger \email{eddy4R.info@gmail.com} \cr
Cove Sturtevant \email{eddy4R.info@gmail.com}
}
\keyword{aggregate,}
\keyword{average,}
\keyword{descriptive}
\keyword{statistics}
