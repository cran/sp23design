\name{solveForCGivenABD}
\alias{solveForCGivenABD}

\title{
  A convenience function to reduce dimension by solving for one variable
  \eqn{c} in terms of others \eqn{a}, \eqn{b}, \eqn{d}
}
\description{
  A convenience function to reduce dimension by solving for one variable
  \eqn{c} in terms of others \eqn{a}, \eqn{b}, \eqn{d}
  }
\usage{
solveForCGivenABD(piVec, a, b, d)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{piVec}{
    The two-element vector of \eqn{(\pi_0, \pi_1)}
}
  \item{a}{
    The value for \eqn{a}
}
  \item{b}{
    The value for \eqn{b}
}
  \item{d}{
    The value for \eqn{d}
}
}
\details{
  Just solves the equation in closed form
}
\value{
  the value for \eqn{c}
}
\references{
  Lai, Tze Leung and Lavori, Philip W. and Shih, Mei-Chiung. Sequential
  Design of Phase II-III Cancer Trials, Statistics in Medicine, Volume 31, issue 18, p.1944-1960, 2012.
}
\author{
  Mei-Chiung Shih, Balasubramanian Narasimhan, Pei He
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{design}
