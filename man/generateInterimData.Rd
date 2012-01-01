\name{generateInterimData}
\alias{generateInterimData}
\title{
  Generate interim data for a clinical trial from a data set.
}
\description{
  Generate interim data at a given time from a dataset
}
\usage{
generateInterimData(clinicalTrialDF, interimTime, administrativeCensoringTime)
}
\arguments{
  \item{clinicalTrialDF}{
    The data frame from which to generate the interim data. It is assumed
    that the variables \code{entryTime}, \code{responseIndicator},
    \code{treatmentIndicator} and \code{timeToEvent} are present

}
  \item{interimTime}{
    the interim time for which the data is to generated
}
  \item{administrativeCensoringTime}{
    The administrative censoring time when the study concludes
}
}
\details{
  As it stands this function also is geared towards the simulation
  scenario. Needs to be cleaned up a bit.
}
\value{
  Returns a subset of the input data frame with the following additional
  variables.
  \item{delta}{the event indicator}
  \item{eventTime}{calendar event time}
  Furthermore, the \code{timeToEvent} variable is appropriately
  calculated
}
\references{
  Lai, Tze Leung and Lavori, Philip W. and Shih, Mei-Chiung. Sequential
  Design of Phase II-III Cancer Trials, Statistics in Medicine, Volume 31, issue 18, p.1944-1960, 2012.
}
\author{
  Mei-Chiung Shih, Balasubramanian Narasimhan, Pei He
}
\examples{
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

  d <- generateClinicalTrialData(nRec = trialParameters$numberRecruitedEachYear,
                                     nFUp = trialParameters$followupTime,
                                     pi0 = trueParameters$p0,
                                     pi1 = trueParameters$p1,
                                     theta = trueParameters$theta,
                                     lambda0 = trueParameters$baselineLambda)
  dInterim <- generateInterimData(d, trialParameters$interimLookTime[2],
                                     trialParameters$adminCensoringTime)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{design}
