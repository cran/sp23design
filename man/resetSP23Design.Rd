\name{resetSP23Design}
\alias{resetSP23Design}
\title{
  Reset the design object so that counts and results are zeroed out
}
\description{
  Reset the design object so that counts and results are zeroed out
}
\usage{
resetSP23Design(sp23Design)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sp23Design}{
    An object usually the result of \code{\link{generateSP23Design}}
}
}
\details{
  Reset the design object so that counts and results are zeroed out
}
\value{
  A new \code{sp23Design} object with counts and results zeroed out
}
\references{
  Lai, Tze Leung and Lavori, Philip W. and Shih, Mei-Chiung. Sequential
  Design of Phase II-III Cancer Trials, Statistics in Medicine, Volume 31, issue 18, p.1944-1960, 2012.
}
\author{
  Mei-Chiung Shih, Balasubramanian Narasimhan, Pei He
}
\examples{
\dontrun{
  trialParameters <- list(minimumNumberOfEvents = 20,
                      minimumIncreaseInV = 0.2,
                      numberRecruitedEachYear = c(80, 120, 160, 160),
                      followupTime = 3,
                      adminCensoringTime = 7,
                      interimLookTime = c(1, 2, 3, 5, 7),
                      type1ErrorForResponse = 0.05,
                      type2ErrorForResponse = 0.01,
                      glrBoundarySidedness = "one", # one sided or two-sided
                      type1Error = 0.05,
                      type2Error = 0.10,
                      epsType1 = 1/3,
                      epsType2 = 1/3)

  ## Case C of table 1 in paper
  caseC.TrueParameters <- list(p0 = 0.3,
                               p1 = 0.6,
                               pdiffHyp=0.3,
                               theta = list(
                                   alpha = 0,
                                   beta = 0,
                                   gamma = 0),
                               baselineLambda = 0.35,
                               etaHyp = 0.25)


  ## Do case C as example
  sp23Design <- generateSP23Design(caseC.TrueParameters, trialParameters)
  ## do something ...
  sp23Design <- resetSP23Design(sp23Design)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{design}
