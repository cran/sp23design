\name{analyzeSP23Design}
\alias{analyzeSP23Design}
\title{
  Analyses the results of running a design. If a trial history, such as
  the result of the function \code{\link{executeSP23Design}} or a history
  of the actual conduct of a single trial is provided, it returns the
  analysis results.
}

\description{
  Produces analysis results from the run of a single trial or a number
  of simulations.
}
\usage{
analyzeSP23Design(sp23Design, trialHistory = NULL, data = NULL,
  col=c("red", "red", "brown", "brown"), lty=c(1,2,1,2))
}
\arguments{
  \item{sp23Design}{
    The design object typically produced by calling
  \code{\link{generateSP23Design}}.
}
  \item{trialHistory}{
    Typically the result of calling \code{\link{executeSP23Design}}
    which is a single data frame, or, the result produced by calling
  \code{\link{exploreSP23Design}} which is a list of data frames, one
  for each simulation.
}
  \item{data}{
    This is only used when the argument \code{trialHistory} is a single
    data frame, in which case, it should be the data generated in the
    clinical trial.
  }

  \item{col}{
    Colors used for the survival plots
  }

  \item{lty}{
    Line types for the survival plots
  }
}
\details{
  If \code{trialHistory} is a single data frame, the naive response
  estimates and a survival plot are produced. Otherwise, the counts of
  the number of times the various hypothesis are rejected and other
  details are returned.
}
\value{
  A list of two items named \code{responseSummary} and \code{designSummary}
  If \code{trialHistory} is a single data frame, the naive response
  estimates are returned in \code{responseSummary} and a survival plot
  is produced. Otherwise, the counts of the number of times the various
  hypothesis are rejected and other details are returned in
  \code{designSummary}.
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
  catn("numberOfTimesH0RIsRejectedAtFirstLook",result[["numberOfTimesH0RIsRejectedAtFirstLook"]])
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
