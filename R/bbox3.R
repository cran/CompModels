#' A black-box computer model
#'
#' A black-box computer model that evaluates the objective function for a given input value.
#'
#' @param x1 A scalar value between -2 and 2, inclusive
#' @param x2 A scalar value between -2 and 2, inclusive
#' @return The evaluation of running the black-box computer model at input (x1, x2).
#' \itemize{
#'   \item obj:  A scalar objective function value
#' }
#' @examples
#' ### Running the black-box computer model at x1 = 1, x2 = 1
#' ### obj = 1876
#'
#' bbox3(1,1)
#' @export
#' @useDynLib CompModels, .registration = TRUE
bbox3 <- function(x1,x2){

  if(!is.numeric(x1) | !is.numeric(x2) | length(x1) != 1 | length(x2) !=1){
    stop("Input is invalid.")
  }else if(x1 < -2  | x1 > 2 | x2 < -2 | x2 > 2){
    stop("Input is outside of the domain.")
  }else{
    ans <- .C("bbox3c",x1=x1,x2=x2,fx=0)
    return(list(obj = ans$fx))
  }
}






