% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bbox4.R
\name{bbox4}
\alias{bbox4}
\title{A black-box computer model}
\usage{
bbox4(x1, x2)
}
\arguments{
\item{x1}{A scalar value between -10 and 0, inclusive}

\item{x2}{A scalar value between -6.5 and 0, inclusive}
}
\value{
The evaluation of running the black-box computer model at input (x1, x2).
\itemize{
  \item obj:  A scalar objective function value
  \item con:  A vector of constraint function values
}
}
\description{
A black-box computer model that evaluates the objective and constraint functions for a given input value.
}
\note{
A solution is feasible only if all of the constraint function values are less than or equal to 0.
}
\examples{
### Running the black-box computer model at x1 = -1, x2 = -1
### obj = 15.00539 and con = 7
### (x1,x2) = (-1,-1) is not a feasible solution

bbox4(-1,-1)
}
