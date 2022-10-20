#' The modified Townsend function
#'
#' This function evaluates the objective and constraint functions for the modified Townsend function.
#'
#' @param x1 A scalar value between -2.25 and 2.5, inclusive
#' @param x2 A scalar value between -2.5 and 1.75, inclusive
#' @return The evaluation of running the modified Townsend function at input pair (x1, x2).
#' \itemize{
#'   \item obj:  A scalar objective function value
#'   \item con:  A scalar constraint function value
#' }
#' @note A solution is feasible when the constraint function is less than or equal to 0.
#' @examples
#' ### Running the modified Townsend function at x1 = 1 and x2 = 0.8
#' ### obj = 0.9073035 and con = 2.012166
#' ### (x1,x2) = (1,1) is not a feasible solution
#'
#' mtp(1,1)
#' @export
#' @useDynLib CompModels, .registration = TRUE
mtp <- function(x1,x2){

  if(!is.numeric(x1) | !is.numeric(x2) | length(x1) != 1 | length(x2) !=1){
    stop("Input is invalid.")
  }else if(x1 < -2.25  | x1 > 2.5 | x2 < -2.5 | x2 > 1.75){
    stop("Input is outside of the domain.")
  }else{
    ans <- .C("mtpc",x1=x1,x2=x2,fx=0,c1x=0)
    return(list(obj = ans$fx, con = ans$c1x))
  }
}






