#' The Gramacy et. al 2016 test function
#'
#' The computer model test function introduced in Gramacy et. al 2016.
#'
#' @param x1 A scalar value between 0 and 1, inclusive
#' @param x2 A scalar value between 0 and 1, inclusive
#' @return The evaluation of running the Gramacy et. al 2016 test function at input (x1, x2).
#' \itemize{
#'   \item obj:  A scalar objective function value
#'   \item con:  A vector of constraint function values
#' }
#' @note A solution is feasible only if of all of the constraint functions values are less than or equal to 0.
#' @references Gramacy, R.B., Gray, G.A., Digabel, S.L., Lee, H.K.H., Ranjan, P., Wells, G., and Wild, S.M. (2016). Modeling an augmented Lagrangian for blackbox constrained optimization. Technometrics, 58(1):1-11.
#' @examples
#' ### Running the function at x1 = 0.2 and x2 = 0.2
#' ### obj = 0.4 and con = (1.29,-1.42)
#' ### (x1,x2) = (0.2,0.2) is not a feasible solution
#'
#' gram(0.2,0.2)
#' @export
#' @useDynLib CompModels, .registration = TRUE
gram <- function(x1,x2){

  if(!is.numeric(x1) | !is.numeric(x2) | length(x1) != 1 | length(x2) !=1){
    stop("Input is invalid.")
  }else if(x1 < 0  | x1 > 1 | x2 < 0 | x2 > 1){
    stop("Input is outside of the domain.")
  }else{
    ans <- .C("gramc",x1=x1,x2=x2,fx=0,c1x=0,c2x=0)
    return(list(obj = ans$fx, con = c(ans$c1x,ans$c2x)))
  }
}






