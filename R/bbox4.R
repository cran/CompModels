#' A black-box computer model
#'
#' A black-box computer model that evaluates the objective and constraint functions for a given input value.
#'
#' @param x1 A scalar value between -10 and 0, inclusive
#' @param x2 A scalar value between -6.5 and 0, inclusive
#' @return The evaluation of running the black-box computer model at input (x1, x2).
#' \itemize{
#'   \item obj:  A scalar objective function value
#'   \item con:  A vector of constraint function values
#' }
#' @note A solution is feasible only if all of the constraint function values are less than or equal to 0.
#' @examples
#' ### Running the black-box computer model at x1 = -1, x2 = -1
#' ### obj = 15.00539 and con = 7
#' ### (x1,x2) = (-1,-1) is not a feasible solution
#'
#' bbox4(-1,-1)
#' @export
#' @useDynLib CompModels, .registration = TRUE
bbox4 <- function(x1,x2){

  if(!is.numeric(x1) | !is.numeric(x2) | length(x1) != 1 | length(x2) !=1){
    stop("Input is invalid.")
  }else if(x1 < -10 | x1 > 0 | x2 < -6.5 | x2 > 0){
    stop("Input is outside of the domain.")
  }else{
    ans <- .C("bbox4c",x1=x1,x2=x2,fx=0,c1x=0)
    return(list(obj = ans$fx, con = ans$c1x))
  }
}






