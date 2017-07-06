\name{linkErrorCheck}
\alias{linkErrorCheck}
\title{linkErrorCheck}
\description{
Performs error checks on the input for the linkRARE function.
}
\usage{
linkErrorCheck(x, y, npl, z = NULL)
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
}

\value{
The function exits with an error message if the error checks are not met.
}
\author{
Sharon Lutz, Annie Thwing
}