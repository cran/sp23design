\name{computeDGivenXi}
\alias{computeDGivenXi}
\title{
  Given the estimates of the \eqn{\pi} and \eqn{\theta}, compute \eqn{d}.
}
\description{
  This function computes \eqn{d} via
  \deqn{d(\pi,\xi)=\{ \pi_0 a + (1-\pi_0)\} - \{\pi_1 abc + (1-\pi_1)b \} }
}
\usage{
computeDGivenXi(piVec, xiVec)
}
\arguments{
  \item{piVec}{ The two-element vector of \eqn{(\pi_0, \pi_1)}
  }
  \item{xiVec}{
    The three-element vector of \eqn{(a=e^\alpha, b=e^\beta, c=e^\gamma)}
  }
}
\details{
  This is an approximation to the hazard ratio
}
\value{
  The computed value of \eqn{d}, a scalar
}
\references{
  Lai, Tze Leung and Lavori, Philip W. and Shih, Mei-Chiung. Sequential
  Design of Phase II-III Cancer Trials, Statistics in Medicine, Volume 31, issue 18, p.1944-1960, 2012.
}
\author{
  Mei-Chiung Shih, Balasubramanian Narasimhan, Pei He
}
\keyword{ design }
