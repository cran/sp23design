\name{computeResponseSummary}
\alias{computeResponseSummary}
\title{
  Given interim data, compute the response end-point summary
}
\description{
  Compute the response end-point summary for interim data. This will
  include the proportion of responses, the proportion of people on
  treatment and control etc.
}
\usage{
computeResponseSummary(interimData)
}
\arguments{
  \item{interimData}{
    The interim data for the clinical trial
  }
}
\details{
  The result is a vector of counts and proportions
}
\value{
  \item{m0}{number on control arm}
  \item{m1}{number on treatment arm}
  \item{y0}{number of responses in control}
  \item{y1}{number of responses in treatment}
  \item{numberOfTotalResponses}{number of total responses in both arms}
  \item{controlRespProp}{the proportion of responders in control arm}
  \item{treatmentRespProp}{the proportion of responders in the treatment
    arm}
  \item{pooledProp}{ the pooled response proportion}
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
  computeResponseSummary(dInterim)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{design}
