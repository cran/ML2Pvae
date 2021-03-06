#' Response data
#'
#' Simulated response sets for 5000 students on an exam with 30 items.
#'
#' @source Generated by sampling from the probability of student success
#' on a given item according to the ML2P model. Model parameters can be found in
#' \code{diff_true.rda}, \code{disc_true.rda}, and \code{theta_true.rda}.
#' @format A data frame with 30 columns and 5000 rows.
#' Entry \code{[j,i]} is 1 if student \code{j} answers item \code{i} correctly, and 0 otherwise.
#'
"responses"
