% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/construction_functions.R
\name{q_constraint}
\alias{q_constraint}
\title{A custom kernel constraint function that restricts weights between the learned distribution and output. Nonzero weights are determined by the Q matrix.}
\usage{
q_constraint(Q)
}
\arguments{
\item{Q}{a binary matrix of size \code{num_skills} by \code{num_items}}
}
\value{
returns a function whose parameters match keras kernel constraint format
}
\description{
A custom kernel constraint function that restricts weights between the learned distribution and output. Nonzero weights are determined by the Q matrix.
}
