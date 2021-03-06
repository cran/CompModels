% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bbox2.R
\name{bbox2}
\alias{bbox2}
\title{A black-box computer model}
\usage{
bbox2(x1, x2)
}
\arguments{
\item{x1}{A scalar value between -3 and 3, inclusive}

\item{x2}{A scalar value between -2 and 2, inclusive}
}
\value{
The evaluation of running the black-box computer model at input (x1, x2).
\itemize{
  \item obj:  A scalar objective function value
}
}
\description{
A black-box computer model that evaluates the objective function for a given input value.
}
\examples{
### Running the black-box computer model at x1 = 1, x2 = 1
### obj = 3.23333

bbox2(1,1)
}
