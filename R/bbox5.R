#' A black-box computer model
#'
#' A black-box computer model that evaluates the objective function for a given input value.
#'
#' @param x1 A scalar value between -pi and pi, inclusive
#' @param x2 A scalar value between -pi and pi, inclusive
#' @param x3 A scalar value between -pi and pi, inclusive
#' @return The evaluation of running the black-box computer model at input (x1, x2, x3).
#' \itemize{
#'   \item obj:  A scalar objective function value
#' }
#' @examples
#' ### Running the black-box computer model at x1 = 1, x2 = 1, x3 =1
#' ### obj = 5.840058
#'
#' bbox5(1,1,1)
#' @export
#' @useDynLib CompModels, .registration = TRUE
bbox5 <- function(x1,x2,x3){

  if(!is.numeric(x1) | !is.numeric(x2) | length(x1) != 1 | length(x2) !=1 | length(x3) != 1 | length(x3) !=1){
    stop("Input is invalid.")
  }else if(x1 < -pi  | x1 > pi | x2 < -pi | x2 > pi | x3 < -pi | x3 > pi){
    stop("Input is outside of the domain.")
  }else{
    ans <- .C("bbox5c",x1=x1,x2=x2,x3=x3,fx=0)
    return(list(obj = ans$fx))
  }
}






