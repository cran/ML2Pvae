#' A reparameterization in order to sample from the learned standard normal distribution of the VAE
#'
#' @param arg a layer of tensors representing the mean and variance
sampling_independent <- function(arg){
  num_skills <- keras::k_int_shape(arg)[[2]] / 2
  z_mean <- arg[, 1:num_skills]
  z_log_var <- arg[, (num_skills + 1):(2 * num_skills)]
  b_size <- keras::k_int_shape(z_mean)[[1]]
  eps <- keras::k_random_normal(
    shape = c(b_size, keras::k_cast(num_skills, dtype = 'int32')),
    mean = 0, stddev = 1
  )
  z_mean + tensorflow::tf$multiply(keras::k_exp(z_log_var / 2), eps)
}

#' A reparameterization in order to sample from the learned multivariate normal distribution of the VAE
#'
#' @param arg a layer of tensors representing the mean and log cholesky transform of the covariance matrix
sampling_correlated <- function(arg){
  num_skills <- as.integer(-1.5 + sqrt(2 * keras::k_int_shape(arg)[[2]] + 9/4))
  z_mean <- arg[, 1:(num_skills)]
  b_size <- keras::k_int_shape(z_mean)[[1]]
  if (is.null(b_size)){
    b_size <- 1
  }
  b <- tfprobability::tfb_fill_triangular(upper=FALSE)
  z_log_cholesky <- b$forward(
    arg[1:b_size, (num_skills + 1):(keras::k_int_shape(arg)[[2]])])
  z_cholesky <- tensorflow::tf$linalg$expm(z_log_cholesky)
  eps <- keras::k_random_normal(
    shape = c(b_size, num_skills, 1),
    mean = 0, stddev = 1
  )
  z_mean + keras::k_reshape(tensorflow::tf$matmul(z_cholesky, eps), shape = c(-1, num_skills))
}

#' A custom kernel constraint function that restricts weights between the learned distribution and output. Nonzero weights are determined by the Q matrix.
#'
#' @param Q a binary matrix of size \code{num_skills} by \code{num_items}
#' @return returns a function whose parameters match keras kernel constraint format
q_constraint <- function(Q){
  constraint <- function(w){
    target <- w * Q
    diff = w - target
    w <- w * keras::k_cast(keras::k_equal(diff, 0), keras::k_floatx())
    w * keras::k_cast(keras::k_greater_equal(w, 0), keras::k_floatx())
  }
  constraint
}

#' A custom kernel constraint function that forces nonzero weights to be equal to one, so the VAE will estimate the 1-parameter logistic model. Nonzero weights are determined by the Q matrix.
#' @param Q a binary matrix of size \code{num_skills} by \code{num_items}
#' @return returns a function whose parameters match keras kernel constraint format
q_1pl_constraint <- function(Q){
  constraint <- function(w){
    Q
  }
  constraint
}
