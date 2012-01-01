\name{loglik1GivenDelta}
\alias{loglik1GivenDelta}
\title{
  Computes the constrained response log-likelihood (on the alternative)
}
\description{
  Computes the constrained response log-likelihood (on the alternative)
}
\usage{
loglik1GivenDelta(p, respSummary, delta = 0)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{p}{
    The probability \eqn{\pi_0}
}
  \item{respSummary}{
    A vector consisting of the summary of data described in
    \code{\link{computeResponseSummary}}
}
  \item{delta}{
    The scalar value of the difference \eqn{\pi_1-\pi_0}
}
}
\details{
  Computes the constrained response log-likelihood (on the alternative)
}
\value{
  the (constrained) response log likelihood
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
