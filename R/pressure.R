#' The pressure vessel computer model
#'
#' The pressure vessel computer model is designed to minimize the total cost of constructing a pressure vessel considering the cost of material, forming, and welding.
#' The four inputs to the computer model are the thickness of the shell (x1), the thickness of the head (x2), the inner radius (x3), and the length of the cylindrical section of the vessel (x4) not including the head.
#' Note, the thicknesses of the variables are integer multiples of 0.0625 inches. The cost of the pressure vessel is subject to four constraints.
#' @param x1 A scalar value between 0 and 99, inclusive, controlling the thickness of the shell.
#' @param x2 A scalar value between 0 and 99, inclusive, controlling the thickness of the head.
#' @param x3 A scalar value between 0 and 200, inclusive, controlling the inner radius.
#' @param x4 A scalar value between 0 and 200, inclusive, controlling the length of the cylindrical section of the vessel (x4) not including the head.
#' @return The evaluation of running the tension spring computer model at input (x1, x2, x3).
#' \itemize{
#'   \item obj:  A scalar objective function value
#'   \item con:  A vector of constraint function values
#' }
#' @note A solution is feasible only if of all of the constraint functions values are less than or equal to 0.
#' @examples
#' ### Running the function at x1 = 10, x2 = 4, x3 = 21, x4 = 24.
#' ### obj = 55536.1 and con = (-10.4053, -20.77104, 12223956.99727, -216)
#' ### (x1,x2,x3,x4) = (10,4,21,24) is not a feasible solution
#'
#' pressure(10,4,21,24)
#' @export
#' @useDynLib CompModels, .registration = TRUE
pressure <- function(x1,x2,x3,x4){

  if(!is.numeric(x1) | !is.numeric(x2) | !is.numeric(x3) | !is.numeric(x4) |
     length(x1) != 1 | length(x2) !=1 | length(x3) != 1 | length(x4) != 1){
    stop("Input is invalid.")
  }else if(x1 < 0  | x1 > 99 | x2 < 0 | x2 > 99 | x3 < 0 | x3 > 200 | x4 < 0 | x4 > 200){
    stop("Input is outside of the domain.")
  }else{
    ans <- .C("pressurec",x1=x1,x2=x2,x3=x3,x4=x4,fx=0,c1x=0,c2x=0,c3x=0,c4x=0)
    return(list(obj = ans$fx, con = c(ans$c1x,ans$c2x,ans$c3x,ans$c4x)))
  }
}






