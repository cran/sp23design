\name{generateClinicalTrialData}
\alias{generateClinicalTrialData}
\title{
  A function to generate some clinical trial data according the joint
  model of response and survival for simulations
}
\description{
  The data is generated according to the model specified in the
  reference below, specifically,
  \deqn{  \lambda(t \mid Y,Z)=\lambda_0(t) \exp(\alpha Y + \beta Z + \gamma Y
  Z)}
}
\usage{
generateClinicalTrialData(nRec, nFUp, pi0, pi1, theta, lambda0, blockSize = 10)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{nRec}{
    the number of patients recruited every year. Length(nRec) is the number of years of recruitment
  }
  \item{nFUp}{
    the number of additional years of followup
  }
  \item{pi0}{
    the probability of response under control arm
  }
  \item{pi1}{
    the probability of response under treatment arm
  }
  \item{theta}{
    the three dimensional parameter \eqn{(\alpha, \beta, \gamma)} of the
    joint response/survival model
  }
  \item{lambda0}{
    the baseline hazard rate
  }
  \item{blockSize}{
    the size of the blocks for randomization of the treatment/control;
    we use block randomization
  }
}
\details{
  Generates data from an exponentail distribution according to the model
  and adhering to the recruitment goals for each calendar year
}
\value{
  A data frame consisting of the following variables.
  \item{entryTime}{entry time of the patient into the trial}
  \item{responseIndicator}{an indicator of patient being a responder or not}
  \item{treatmentIndicator}{an indicator of patient being in treatment
    arm or control}
  \item{timeToEvent}{the time to event or death in the language of the paper}
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

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{design}
