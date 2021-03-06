% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/disc_true.R
\docType{data}
\name{disc_true}
\alias{disc_true}
\title{Simulated discrimination parameters}
\format{
A data frame with 3 rows and 30 columns. Entry \code{[k,i]} represents the discrimination
parameter between item \code{i} and ability \code{k}.
}
\source{
Each entry is sampled uniformly from \code{[0.25,1.75]}.
If an entry in \code{q_matrix.rda} is 0, then so is the corresponding entry in \code{disc_true.rda}.
}
\usage{
disc_true
}
\description{
Difficulty parameters for an exam of 30 items assessing 3 latent abilities.
}
\keyword{datasets}
