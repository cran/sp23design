\name{mHP.b}
\alias{mHP.b}
\title{
  Compute the modified Haybittle-Peto boundary
}
\description{
  Compute the modified Haybittle-Peto boundary
}
\usage{
mHP.b(mu = c(0, 0), v = c(1, 2), alpha = 0.05, eps = 1/2, side = c("one", "two"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{mu}{
    The mean vector
}
  \item{v}{
    The variance vector, usually proportional to information in calendar time
}
  \item{alpha}{
    The significance desired
}
  \item{eps}{
    The fraction of alpha to use
}
  \item{side}{
    one-sided or two-sided (\code{one} or \code{two})
}
}
\details{
  Compute the modified Haybittle-Peto boundary
}
\value{
  the modified Haybittle-Peto boundary
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
