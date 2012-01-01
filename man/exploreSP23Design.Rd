\name{exploreSP23Design}
\alias{exploreSP23Design}
\title{
  Explore a specified design by simulation
}
\description{
  Explore a chosen design by generating simulated datasets and storing
  data from simulations for further analysis
}
\usage{
exploreSP23Design(sp23Design, numberOfSimulations = 25, rngSeed = 12345,
showProgress = TRUE)
}
\arguments{
  \item{sp23Design}{
    A design object typically created by the function \code{\link{generateSP23Design}}
}
  \item{numberOfSimulations}{
    The number of simulations to use, default 25
}
  \item{rngSeed}{
    A seed for the random number generator for reproducibility
}
  \item{showProgress}{
    A flag (default \code{TRUE}) to show progress or not
}
}
\details{
  This function is used while exploring the characteristics of a
  design. Results are accumulated and can be fed into analysis functions
  to inform choices.
}
\value{
  A list of length \code{numberOfSimulations} where each entry is a data
  frame with number of interim looks rows and the following variables in
  the column.
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
  Design of Phase II-III Cancer Trials, Statistics in Medicine, 2011,
  (submitted).
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
  trialHistory <- exploreSP23Design(sp23Design, numberOfSimulations=25, rngSeed=2387487)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{design}
