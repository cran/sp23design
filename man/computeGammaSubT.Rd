\name{computeGammaSubT}
\alias{computeGammaSubT}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Compute the estimate of the variance of the generalized
  likelihood ratio statistic at time \eqn{t}
}
\description{
  This function computes the variance of the generalized
  likelihood ratio statistic at interim stopping times
}
\usage{
computeGammaSubT(thetaHat, pi, interimData)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{thetaHat}{
    The three-element vector of \eqn{(\alpha, \beta, \gamma)}
}
  \item{pi}{
    The two-element vector of \eqn{(\pi_0, \pi_1)}
}
  \item{interimData}{
    The interim data at time \eqn{t} as a data frame
}
}
\details{
  The function builds a hessian matrix and uses a reparametrization to
  compute \eqn{\Gamma_t}, the variance of the generalized likelihood
  ration stochastic process at time
  $t$.
}
\value{
  A scalar value of the variance \eqn{\Gamma_t}
}
\references{
  Lai, Tze Leung and Lavori, Philip W. and Shih, Mei-Chiung. Sequential
  Design of Phase II-III Cancer Trials, Statistics in Medicine, Volume 31, issue 18, p.1944-1960, 2012.
}
\author{
  Mei-Chiung Shih, Balasubramanian Narasimhan, Pei He
}
\keyword{ design }
