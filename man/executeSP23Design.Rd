\name{executeSP23Design}
\alias{executeSP23Design}
\title{
  Given a design object, interim data and the current calendar time,
  conduct the interim analysis for the time
}
\description{
  This function is designed to be used in the field. Assuming a
  particular design is chosen, it conducts the interim analysis for a
  specific calendar time and provides the means for deciding whether to
  stop for futility or efficacy.
}
\usage{
executeSP23Design(sp23DesignObject, data, currentCalendarTime)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sp23DesignObject}{
    A seamless phase II-III design object, typically one produced by the
    \code{\link{generateSP23Design}} function
}
  \item{data}{
    The interim data, something akin to that produced by the function
    \code{\link{generateInterimData}}
}
  \item{currentCalendarTime}{
    The current calendar time of the interim data. This better be one of
    the specified interim looks, or the function stops.
}
}
\details{
  This function is designed to be used in the field, although there are
  parts of it that are currently problematic. For example, in the field,
  there is typically no inkling of a responder or non-responder and yet
  the function as it currently stands is too wedded to the simulation
  scenario. Not hard to fix though.
}
\value{ A vector of quantities is returned.
  \item{m0}{number on control arm}
  \item{m1}{number on treatment arm}
  \item{y0}{number of responses in control}
  \item{y1}{number of responses in treatment}
  \item{pi0Hat}{estimate of the proportion of responders among control}
  \item{pi1Hat}{estimate of the proportion of responders among treatment}
  \item{pi0HatH0}{ estimate of the proportion of responders among control
  under \eqn{H_0}}
  \item{pi1HatH0}{estimate of the proportion of responders among control
  under \eqn{H_0}}
  \item{pi0HatH1}{estimate of the proportion of responders among control
  under \eqn{H_1}}
  \item{pi1HatH1}{estimate of the proportion of responders among control
  under \eqn{H_1}}
  \item{glrRespH0}{estimate of the generalized likelihood ratio
  statistic for response under \eqn{H_0}}
  \item{glrRespH1}{estimate of the generalized likelihood ratio
  statistic for response under \eqn{H_1}}
  \item{glrSurvH0}{estimate of the generalized likelihood ratio
  statistic for survival under \eqn{H_0}}
  \item{glrSurvH1}{estimate of the generalized likelihood ratio
  statistic for survival under \eqn{H_1}}
  \item{alphaHat}{the estimate of \eqn{\alpha}}
  \item{alphaHatH0}{the estimate of \eqn{\alpha} under \eqn{H_0}}
  \item{alphaHatH1}{the estimate of \eqn{\alpha} under \eqn{H_1}}
  \item{betaHat}{the estimate of \eqn{\beta}}
  \item{betaHatH0}{the estimate of \eqn{\beta} under \eqn{H_0}}
  \item{betaHatH1}{the estimate of \eqn{\beta} under \eqn{H_1}}
  \item{gammaHat}{the estimate of \eqn{\gamma}}
  \item{gammaHatH0}{the estimate of \eqn{\gamma} under \eqn{H_0}}
  \item{gammaHatH1}{the estimate of \eqn{\gamma} under \eqn{H_1}}
  \item{hazard}{the estimate of \eqn{d}}
  \item{v}{the estimate of \eqn{\Gamma_t}}
  \item{rejectH0R}{a flag indicating if $H_0^R$ was rejected at the
  interim look}
  \item{acceptH0R}{a flag indicating if $H_0^R$ was accepted
  (futility) at the interim look}
  \item{rejectH0S}{a flag indicating if $H_0^S$ was rejected at the
  interim look}
  \item{acceptH0S}{a flag indicating if $H_0^S$ was accepted
  (futility) at the interim look}
  \item{b.metas.Last}{the last Haybittle-Peto boundary for the
  survival end-point, if computed}
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

  sp23Design <- generateSP23Design(trueParameters, trialParameters)
  d <- generateClinicalTrialData(nRec = trialParameters$numberRecruitedEachYear,
                                 nFUp = trialParameters$followupTime,
                                 pi0 = trueParameters$p0,
                                 pi1 = trueParameters$p1,
                                 theta = trueParameters$theta,
                                 lambda0 = trueParameters$baselineLambda)
  result <- executeSP23Design(sp23Design, d, trialParameters$interimLookTime[2])
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{design}
