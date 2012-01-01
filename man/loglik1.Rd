\name{loglik1}
\alias{loglik1}
\title{
  Compute the response log-likelihood
}
\description{
  Compute the response log-likelihood
}
\usage{
loglik1(piVec, respSummary)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{piVec}{
    The two-element vector of \eqn{(\pi_0, \pi_1)}
}
  \item{respSummary}{
    A vector consisting of the summary of data described in
    \code{\link{computeResponseSummary}}
}
}
\details{
  Computes the log-likelihood
}
\value{ the log-likelihood
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
