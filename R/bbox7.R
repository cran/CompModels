#' A black-box computer model
#'
#' A black-box computer model that evaluates the objective and constraint functions for a given input value.
#'
#' @param x1 A scalar value between 0 and 1, inclusive
#' @param x2 A scalar value between 0 and 1, inclusive
#' @param x3 A scalar value between 0 and 1, inclusive
#' @param x4 A scalar value between 0 and 1, inclusive
#' @param x5 A scalar value between 0 and 1, inclusive
#' @param x6 A scalar value between 0 and 1, inclusive
#' @param x7 A scalar value between 0 and 1, inclusive
#' @param x8 A scalar value between 0 and 1, inclusive
#' @return The evaluation of running the black-box computer model at input (x1, x2, x3, x4, x5, x6, x7, x8).
#' \itemize{
#'   \item obj:  A scalar objective function value
#'   \item con:  A vector of constraint function values
#' }
#' @note A solution is feasible only if all of the constraint function values are less than or equal to 0.
#' @examples
#' ### Running the black-box computer model at x1 = 0, x2 = 0, x3 = 0, x4 = 0,
#' ###                                         x5 = 0, x6 = 0, x7 = 0, x8 = 0
#' ### obj = 1 and con = (0.2,-0.8)
#' ### (x1,x2,x3,x4,x5,x6,x7,x8) = (0,0,0,0,0,0,0,0) is not a feasible solution
#'
#' bbox7(0,0,0,0,0,0,0,0)
#' @export
#' @useDynLib CompModels, .registration = TRUE
bbox7 <- function(x1,x2,x3,x4,x5,x6,x7,x8){

  if(!is.numeric(x1) | !is.numeric(x2) | length(x1) != 1 | length(x2) !=1 |
     !is.numeric(x3) | !is.numeric(x4) | length(x3) != 1 | length(x4) !=1 |
     !is.numeric(x5) | !is.numeric(x6) | length(x5) != 1 | length(x6) !=1 |
     !is.numeric(x7) | !is.numeric(x8) | length(x7) != 1 | length(x8) !=1){
    stop("Input is invalid.")
  }else if(x1 < 0 | x1 > 1 | x2 < 0 | x2 > 1 |
           x3 < 0 | x3 > 1 | x4 < 0 | x4 > 1 |
           x5 < 0 | x5 > 1 | x6 < 0 | x6 > 1 |
           x7 < 0 | x7 > 1 | x8 < 0 | x8 > 1){
    stop("Input is outside of the domain.")
  }else{
    ans <- .C("bbox7c",x1=x1,x2=x2,x3=x3,x4=x4,x5=x5,x6=x6,x7=x7,x8=x8,fx=0,c1x=0,c2x=0)
    return(list(obj = ans$fx, con = c(ans$c1x,ans$c2x)))
  }
}






