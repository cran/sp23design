\name{sp23design-package}
\alias{sp23design-package}
\alias{sp23design}
\docType{package}
\title{
sp23design: A package for the design, exploration and execution of seamless Phase
II-II clinical trials
}
\description{
This package implements the methodology described in the paper below
}
\details{
\tabular{ll}{
Package: \tab sp23design\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2011-05-05\cr
License: \tab LGPL?\cr
LazyLoad: \tab yes\cr
}
The most important functions in this package are
\code{\link{generateSP23Design}}, \code{\link{exploreSP23Design}},
\code{\link{executeSP23Design}}, and \code{\link{analyzeSP23Design}}
}
\author{
Mei-Chiung Shih, Balasubramanian Narasimhan, Pei He

Maintainer: Balasubramanian Narasimhan <naras@stat.stanford.edu>
}
\references{
  Lai, Tze Leung and Lavori, Philip W. and Shih, Mei-Chiung. Sequential
  Design of Phase II-III Cancer Trials, Statistics in Medicine, Volume 31, issue 18, p.1944-1960, 2012.
}
\examples{
\dontrun{
  catn <- function(...) cat(..., "\n")

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

  trueParameters <- list(p0 = 0.3,
                         p1 = 0.3,
                         pdiffHyp=0.3,
                         theta = list(
                             alpha = 0,
                             beta = 0,
                             gamma = 0),
                         baselineLambda = 0.35,
                         etaHyp = 0.25)
  rngSeed <- 9872831
  sp23Design <- generateSP23Design(trueParameters, trialParameters)
  print(sp23Design)
  trialHistory <- exploreSP23Design(sp23Design, numberOfSimulations=25, rngSeed=rngSeed)
  result <- analyzeSP23Design(sp23Design, trialHistory)$designSummary
  catn("numberOfTimesH0RIsRejectedAtFirstLook", result[["numberOfTimesH0RIsRejectedAtFirstLook"]])
  catn("numberOfTimesH0RIsRejected", result[["numberOfTimesH0RIsRejected"]])
  catn("numberOfTimesStoppedForFutility", result[["numberOfTimesStoppedForFutility"]])
  catn("numberOfTimesH0SIsAccepted", result[["numberOfTimesH0SIsAccepted"]])
  catn("numberOfTimesH0SIsRejected", result[["numberOfTimesH0SIsRejected"]])
  catn("numberOfTimesFutilityDecidedAtLastLook",result[["numberOfTimesFutilityDecidedAtLastLook"]])
  catn("numberOfTimesTrialEndedAtLook", result[["numberOfTimesTrialEndedAtLook"]])
  catn("avgExitTime", result[["avgExitTime"]])
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{design}
