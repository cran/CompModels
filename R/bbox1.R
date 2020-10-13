#' A black-box computer model
#'
#' A black-box computer model that evaluates the objective and constraint functions for a given input value.
#'
#' @param x1 A scalar value between -1.5 and 2.5, inclusive
#' @param x2 A scalar value between -3 and 3, inclusive
#' @return The evaluation of running the black-box computer model at input (x1, x2).
#' \itemize{
#'   \item obj:  A scalar objective function value
#'   \item con:  A vector of constraint function values
#' }
#' @note A solution is feasible only if of all of the constraint functions values are less than or equal to 0.
#' @examples
#' ### Running the black-box computer model at x1 = 1, x2 = 2
#' ### obj = -1.5 and con = (-3.5,-0.25)
#' ### (x1,x2) = (1,2) is a feasible solution
#'
#' bbox1(1,2)
#' @export
#' @useDynLib CompModels, .registration = TRUE
bbox1 <- function(x1,x2){

  if(!is.numeric(x1) | !is.numeric(x2) | length(x1) != 1 | length(x2) !=1){
    stop("Input is invalid.")
  }else if(x1 < -1.5  | x1 > 2.5 | x2 < -3 | x2 > 3){
    stop("Input is outside of the domain.")
  }else{
    ans <- .C("bbox1c",x1=x1,x2=x2,fx=0,c1x=0,c2x=0)
    return(list(obj = ans$fx, con = c(ans$c1x,ans$c2x)))
  }
}






