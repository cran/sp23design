\name{hessian}
\alias{hessian}
\title{
  A utility function to compute the hessian of the generalized (conditional)
  partial likelihood ratio statistic
}
\description{
  A utility function to compute the hessian of the generalized (conditional)
  partial likelihood ratio statistic
}
\usage{
hessian(theta, pi, interimData)
}
\arguments{
  \item{theta}{
    The three-element vector \eqn{(\alpha, \beta, \gamma)}
}
  \item{pi}{
    The two-element vector \eqn{(\pi_0, \pi_1)}
}
  \item{interimData}{
    The interim data frame
}
}
\details{
  Computes the hessian
}
\value{
  A 3\eqn{\times}3 matrix of the hessian
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
