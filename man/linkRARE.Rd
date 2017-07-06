\name{linkRARE}
\alias{linkRARE}
\title{linkRARE}
\description{
This function incorporates linkage data in genetic association studies with 2 approaches: 1) Bayesian Hierarchical model and 2) frequentist approach for rare variants.
}
\usage{
linkRARE(x, y, npl, z = NULL, SEED = 1)
}

\arguments{
  \item{x}{
  is a matrix of rare variants in the region.
}
  \item{y}{
  is the outcome for case-control status. y=1 for case and y=0 for control.
}
  \item{npl}{
  is the NPL score.
}
  \item{z}{
  is the matrix (or vector) of covariates, default is NULL.
}
  \item{SEED}{
  sets the seed for SKAT. Default is 1.
}
}

\value{
\item{p-value }{The significance from SKAT with all subjects, and the significance from SKAT excluding subjects with NPL<0}
\item{rare variants }{The number of rare variants from all subjects, and the number of rare variants excluding subjects with NPL<0}
}
\references{
Lutz SM, Pelijto A, Thwing A, Zhang W, Fingerlin TE (2017) A Bayesian Approach to Integrate Family-Specific Linkage Scores in Case-Control Tests of Association. Genetic Epidemiology (Submitted)

Lutz SM, Pelijto A, Thwing A,  Zhang W, Fingerlin TE (2017) An Approach to Integrate Family-Specific Linkage Scores in Case-Control Tests of Associations of Rare Variants. BMC Genetics. (In preparation)
}
\author{
Sharon Lutz, Annie Thwing
}
\section{Warning}{
library(SKAT) is needed to run this function. 
}
\keyword{ link }
\keyword{ variants }
\keyword{ rare }