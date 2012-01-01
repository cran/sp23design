\name{loglik2.repar0}
\alias{loglik2.repar0}
\title{
  Computes the constrained survival log-likelihood
}
\description{
  Computes the constrained survival log-likelihood
}
\usage{
loglik2.repar0(xi, interimData, pi0, pi1, eta.hyp = 0)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{xi}{
    the three-element vector of \eqn{(a=e^\alpha, b=e^\beta,
      c=e^\gamma)}
}
  \item{interimData}{
    the interim data
}
  \item{pi0}{
    the value \eqn{\pi_0}
}
\item{pi1}{
    the value \eqn{\pi_1}
}
  \item{eta.hyp}{
    The hypothesised difference \eqn{d} in the alternative hypothesis
}
}
\details{
  This uses the reparametrization above in terms of \eqn{(a,b,c)} rather
  than \eqn{(\alpha, \beta, \gamma )}
}
\value{
  The constrained survival log-likelihood
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
