\name{generateSP23Design}
\alias{generateSP23Design}
\title{
  Generate a seamless Phase II-III design object given some the true
  parameters and clinical trial parameters
}
\description{
  Generate a seamless Phase II-III design object given some the true
  parameters and clinical trial parameters
}
\usage{
generateSP23Design(trueParameters, trialParameters)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{trueParameters}{ A list constisting of several components
    including
    \code{p0}, the true probability of response under control,
    \code{p1}, the true probability of response under treatment,
    \code{theta}, a list of three items \eqn{(\alpha,\beta,\gamma)},
    \code{baselineLambda}, the base line hazard rate (constant for now),
    \code{etaHyp}, the hypothesized non-null hazard \eqn{d}.
  }
  \item{trialParameters}{ A list constisting of several components
    including
    \code{numberRecruitedEachYear}, a vector of recruitment numbers for
      each year,
    \code{interimLookTime},  the calendar interim look times,
    \code{followupTime}, the follow-up time,
    \code{adminCensoringTime}, the administrative censoring time,
    \code{glrBoundarySidedness}, either one or two-sided generalized
      likelihood ratio boundaries, default one-sided,
    \code{typeIError}, the type I error desired,
    \code{type2Error}, the type II error desired, used only for computing
      futility boundaries (only nominally used; need to clarify),
    \code{epsTypeI}, the fraction to spend in interim looks for the
      modified Haybittle-Peto boundaries,
    \code{epsTypeII}, the fraction to spend in interim looks for the
      modified Haybittle-Peto boundaries.
  }
}
\details{
  Generates a design object that is used throughout the simulation or an
  actual analysis.
}
\value{
  An informal \code{sp23Design} object, a list of four items
  \item{trueParameters}{exactly the input above}
  \item{trialParameters}{exactly the input above}
  \item{glrBoundary}{a matrix of dimension number of interim looks by 4,
    containing the boundaries for futility and efficacy for both
    response and survival}
  \item{interimLookHistoryDF}{A data frame as described in
    \code{\link{exploreSP23Design}}.
  }
}
\references{
  Lai, Tze Leung and Lavori, Philip W. and Shih, Mei-Chiung. Sequential
  Design of Phase II-III Cancer Trials, Statistics in Medicine, Volume 31, issue 18, p.1944-1960, 2012.
}
\author{
  Mei-Chiung Shih, Balasubramanian Narasimhan, Pei He
}
\seealso{
  \code{\link{exploreSP23Design}} and examples in the \code{examples}
  subdirectory of this package
}
\examples{
## trial parameters in paper
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
}

\keyword{design}
