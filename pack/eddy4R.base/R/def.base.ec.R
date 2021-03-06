##############################################################################################
#' @title Definition function: Base state for eddy-covariance calculation

#' @author 
#' Stefan Metzger \email{eddy4R.info@gmail.com} \cr
#' Cove Sturtevant \email{eddy4R.info@gmail.com} \cr
#' Natchaya Pingintha-Durden \email{ndurden@battelleecology.org}

#' @description Function definition. Determine base state for eddy-covariance calculation.

#' @param idxTime time index used for interpolation [-]
#' @param var variable of interest []
#' @param AlgBase c("mean", "trnd", "ord03") algorithm used to determine base state, where \cr
#' "mean" is the simple algorithmic mean, \cr
#' "trnd" is the least squares linear (1st order) trend, and \cr
#' "ord03" is the least squares 3rd order polynomial fit

#' @return Vector that contains the chosen base-signal for \code{var}.

#' @references 
#' License: GNU AFFERO GENERAL PUBLIC LICENSE Version 3, 19 November 2007

#' @keywords base state, mean

#' @examples Currently none

#' @seealso Currently none

#' @export
#' 
# changelog and author contributions / copyrights
#   Stefan Metzger (2011-01-23)
#     original creation of a file with global constants that is called via source()
#   Stefan Metzger (2015-11-28)
#     re-formualtion as function() to allow packaging
#   Cove Sturtevant (2016-02-09 & 2016-02-16)
#     conformed code to EC TES coding convention (prev func name: base.state.r)
#   Natchaya P-Durden (2016-11-27)
#     rename function to def.base.ec()
#   Natchaya P-Durden (2018-04-03)
#     update @param format
#   Natchaya P-Durden (2018-04-11)
#    applied eddy4R term name convention; replaced pos by idxTime
#   Natchaya P-Durden (2019-10-31)
#    update function to handle all NaN inputs when running "trnd" option 
#    generated in NAs in varBase to have the same length as idxTime
#   Natchaya P-Durden (2019-11-22)
#    bug fix in "trnd" option
##############################################################################################



def.base.ec <- function(idxTime,var,AlgBase){
#average:
if(AlgBase == "mean") {
  varBase<-mean(var,na.rm=TRUE)
}
  
# linear trend:
if(AlgBase == "trnd") {
  if (length(which(!is.na(var))) < 3){#change to 3; approx function need at least 3 points 
    varBase <- rep(NaN, length(var))
  }else{
    var<-approx(idxTime, var, xout=idxTime)[[2]]	#get rid of NAs in var
    trnd<-lm(var~idxTime)
    varBase<- fitted.values(trnd)
    #fill in NAs so varBase has the same length as idxTime
    if (length(varBase) != length(idxTime)){
      length(varBase) <- length(idxTime)
      }
    }
#coefficients(trnd)[1]+
#coefficients(trnd)[2]*idxTime
}
  
#third order polynomial:
if(AlgBase == "ord03") {
  var<-approx(idxTime, var, xout=idxTime)[[2]]	#get rid of NAs in var
  fitPoly <- lm(var ~ idxTime + I(idxTime^2) + I(idxTime^3))
  varBase<- fitted.values(fitPoly)
#coefficients(poly)[1]+
#coefficients(poly)[2]*idxTime+
#coefficients(poly)[3]*idxTime^2+
#coefficients(poly)[4]*idxTime^3
}
return(varBase)
}
