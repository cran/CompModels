#' A black-box computer model
#'
#' A black-box computer model that evaluates the objective and constraint functions for a given input value.
#'
#' @param x1 A scalar value between 0 and 10, inclusive
#' @return The evaluation of running the black-box computer model at input x1.
#' \itemize{
#'   \item obj:  A scalar objective function value
#'   \item con:  A vector of constraint function values
#' }
#' @note A solution is feasible only if the all of the constraint function values are less than or equal to 0.
#' @examples
#' ### Running the black-box computer model at x1 = 1
#' ### obj = 0.926574 and con = (0.4259819,0.6472136)
#' ### x1 = 1 is not a feasible solution
#'
#' bbox6(1)
#' @export
#' @useDynLib CompModels, .registration = TRUE
bbox6 <- function(x1){

  if(!is.numeric(x1) | length(x1) != 1){
    stop("Input is invalid.")
  }else if(x1 < 0 | x1 > 10){
    stop("Input is outside of the domain.")
  }else{
    ans <- .C("bbox4c",x1=x1,fx=0,c1x=0,c2x=0)
    return(list(obj = ans$fx, con = c(ans$c1x,ans$c2x)))
  }
}






