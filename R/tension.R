#' The tension spring computer model
#'
#' The tension spring computer model is designed to minimize the weight of a tension spring. The three inputs to the computer model are the wire diameter (x1), mean coil diameter (x2), and the number of active coils (x3).
#' The tension spring weight is subject to four constraints on the shear stress, surge frequency, and deflection.
#' @param x1 A scalar value between 0.05 and 2, inclusive, controlling the wire diameter.
#' @param x2 A scalar value between 0.25 and 1.3, inclusive, controlling the mean coil diameter.
#' @param x3 A scalar value between 2 and 15, inclusive, controlling the number of active coils.
#' @return The evaluation of running the tension spring computer model at input (x1, x2, x3).
#' \itemize{
#'   \item obj:  A scalar objective function value
#'   \item con:  A vector of constraint function values
#' }
#' @note A solution is feasible only if of all of the constraint functions values are less than or equal to 0.
#' @examples
#' ### Running the function at x1 = 1, x2 = 1, x3 = 3.
#' ### obj = 5 and con = (1,45.82,-1,0.33)
#' ### (x1,x2,x3) = (1,1,3) is not a feasible solution
#'
#' tension(1,1,3)
#' @export
#' @useDynLib CompModels, .registration = TRUE
tension <- function(x1,x2,x3){

  if(!is.numeric(x1) | !is.numeric(x2) | !is.numeric(x3) |
     length(x1) != 1 | length(x2) !=1 | length(x3) != 1){
    stop("Input is invalid.")
  }else if(x1 < 0.05  | x1 > 2 | x2 < 0.25 | x2 > 1.3 | x3 < 2 | x3 > 15){
    stop("Input is outside of the domain.")
  }else{
    ans <- .C("tensionc",x1=x1,x2=x2,x3=x3,fx=0,c1x=0,c2x=0,c3x=0,c4x=0)
    return(list(obj = ans$fx, con = c(ans$c1x,ans$c2x,ans$c3x,ans$c4x)))
  }
}






