% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sprinkler.R
\name{sprinkler}
\alias{sprinkler}
\title{The spinkler computer model}
\usage{
sprinkler(x1, x2, x3, x4, x5, x6, x7, x8)
}
\arguments{
\item{x1}{A scalar value between 0 and 90, inclusive, controlling the vertical nozzle angle.}

\item{x2}{A scalar value between 0 and 90, inclusive, controlling the tangential nozzle angle.}

\item{x3}{A scalar value between 2e-6 and 4e-6, inclusive, controlling the nozzle profile.}

\item{x4}{A scalar value between 0.1 and 0.2, inclusive, controlling the diameter of the sprinkler head.}

\item{x5}{A scalar value between 0.01 and 0.02, inclusive, controlling the dynamic friction moment.}

\item{x6}{A scalar value between 0.01 and 0.02, inclusive, controlling the static friction moment.}

\item{x7}{A scalar value between 1 and 2, inclusive, controlling the entrance pressure.}

\item{x8}{A scalar value between 5 and 10, inclusive, controlling the diameter flow line.}
}
\value{
The evaluation of running the sprinkler computer model at input (x1, x2, x3, x4, x5, x6, x7, x8).
\itemize{
  \item obj:  A vector of objective function values for consumption, speed, and range (in that order)
}
}
\description{
The sprinkler computer model is a multiobjective optimization problem. The objectives are to minimize the water consumption associated with using a garden sprinkler, while also maximizing the speed and range of the garden sprinkler.
The eight inputs to the computer model are the vertical (x1) and tangential (x2) nozzle angle, the nozzle profile (x3), the diameter of the sprinkler head (x4), the dynamic (x5) and static (x6) friction moment, the entrance pressure (x7), and the diameter flow line (x8).
}
\note{
The order of the outputs of the sprinkler computer model is consumption (minimize), speed (maximize), and range (maximize).
}
\examples{
### Running the function at x1 = 33, x2 = 18, x3 = 2e-6, x4 = 0.18,
###                         x5 = 0.015, x6 = 0.0199, x7 = 1.54, x8 = 7.5.
### obj = (4.218397, 5.321142, 3.124046)

sprinkler(33,18,2e-6,0.18,0.015,0.0199,1.54,7.5)
}
\references{
Bebber, D. v., Hochkirchen, T., Siebertz, K. (2010). Statistische Versuchsplanung: Design of Experiments (DoE). Germany: Springer Berlin Heidelberg.
}
