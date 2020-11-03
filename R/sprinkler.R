#' The spinkler computer model
#'
#' The sprinkler computer model is a multiobjective optimization problem. The objectives are to minimize the water consumption associated with using a garden sprinkler, while also maximizing the speed and range of the garden sprinkler.
#' The eight inputs to the computer model are the vertical (x1) and tangential (x2) nozzle angle, the nozzle profile (x3), the diameter of the sprinkler head (x4), the dynamic (x5) and static (x6) friction moment, the entrance pressure (x7), and the diameter flow line (x8).
#' @param x1 A scalar value between 0 and 90, inclusive, controlling the vertical nozzle angle.
#' @param x2 A scalar value between 0 and 90, inclusive, controlling the tangential nozzle angle.
#' @param x3 A scalar value between 2e-6 and 4e-6, inclusive, controlling the nozzle profile.
#' @param x4 A scalar value between 0.1 and 0.2, inclusive, controlling the diameter of the sprinkler head.
#' @param x5 A scalar value between 0.01 and 0.02, inclusive, controlling the dynamic friction moment.
#' @param x6 A scalar value between 0.01 and 0.02, inclusive, controlling the static friction moment.
#' @param x7 A scalar value between 1 and 2, inclusive, controlling the entrance pressure.
#' @param x8 A scalar value between 5 and 10, inclusive, controlling the diameter flow line.
#' @return The evaluation of running the sprinkler computer model at input (x1, x2, x3, x4, x5, x6, x7, x8).
#' \itemize{
#'   \item obj:  A vector of objective function values for consumption, speed, and range (in that order)
#' }
#' @note The order of the outputs of the sprinkler computer model is consumption (minimize), speed (maximize), and range (maximize).
#' @references Bebber, D. v., Hochkirchen, T., Siebertz, K. (2010). Statistische Versuchsplanung: Design of Experiments (DoE). Germany: Springer Berlin Heidelberg.
#' @examples
#' ### Running the function at x1 = 33, x2 = 18, x3 = 2e-6, x4 = 0.18,
#' ###                         x5 = 0.015, x6 = 0.0199, x7 = 1.54, x8 = 7.5.
#' ### obj = (4.218397, 5.321142, 3.124046)
#'
#' sprinkler(33,18,2e-6,0.18,0.015,0.0199,1.54,7.5)
#' @export
#' @useDynLib CompModels, .registration = TRUE
sprinkler <- function(x1,x2,x3,x4,x5,x6,x7,x8){

  if(!is.numeric(x1) | !is.numeric(x2) | !is.numeric(x3) | !is.numeric(x4) |
     !is.numeric(x5) | !is.numeric(x6) | !is.numeric(x7) | !is.numeric(x8) |
     length(x1) != 1 | length(x2) !=1 | length(x3) != 1 | length(x4) != 1  |
     length(x5) != 1 | length(x6) !=1 | length(x7) != 1 | length(x8) != 1){
    stop("Input is invalid.")
  }else if(x1 < 0  | x1 > 90 | x2 < 0 | x2 > 90 | x3 < 2e-6 | x3 > 4e-6 | x4 < 0.1 | x4 > 0.2 |
           x5 < 0.01  | x5 > 0.02 | x6 < 0.01 | x6 > 0.02 | x7 < 1 | x7 > 2 | x8 < 5 | x8 > 10){
    stop("Input is outside of the domain.")
  }else{
    ans <- .C("sprinklerc",x1=x1,x2=x2,x3=x3,x4=x4,x5=x5,x6=x6,x7=x7,x8=x8,f1x=0,f2x=0,f3x=0)
    return(list(obj = c(ans$f1x,ans$f2x,ans$f3x)))
  }
}






