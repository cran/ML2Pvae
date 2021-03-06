% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/validate_inputs.R
\name{validate_inputs}
\alias{validate_inputs}
\title{Give error messages for invalid inputs in exported functions.}
\usage{
validate_inputs(
  num_items,
  num_skills,
  Q_matrix,
  model_type = 2,
  mean_vector = rep(0, num_skills),
  covariance_matrix = diag(num_skills),
  enc_hid_arch = c(ceiling((num_items + num_skills)/2)),
  hid_enc_activations = rep("sigmoid", length(enc_hid_arch)),
  output_activation = "sigmoid",
  kl_weight = 1,
  learning_rate = 0.001
)
}
\arguments{
\item{num_items}{the number of items on the assessment; also the number of nodes in the input/output layers of the VAE}

\item{num_skills}{the number of skills being evaluated; also the size of the distribution learned by the VAE}

\item{Q_matrix}{a binary, \code{num_skills} by \code{num_items} matrix relating the assessment items with skills}

\item{model_type}{either 1 or 2, specifying a 1 parameter (1PL) or 2 parameter (2PL) model}

\item{mean_vector}{a vector of length \code{num_skills} specifying the mean of each latent trait}

\item{covariance_matrix}{a symmetric, positive definite, \code{num_skills} by \code{num_skills}, matrix giving the covariance of the latent traits}

\item{enc_hid_arch}{a vector detailing the number an size of hidden layers in the encoder}

\item{hid_enc_activations}{a vector specifying the activation function in each hidden layer in the encoder; must be the same length as \code{enc_hid_arch}}

\item{output_activation}{a string specifying the activation function in the output of the decoder; the ML2P model alsways used 'sigmoid'}

\item{kl_weight}{an optional weight for the KL divergence term in the loss function}

\item{learning_rate}{an optional parameter for the adam optimizer}
}
\description{
Give error messages for invalid inputs in exported functions.
}
