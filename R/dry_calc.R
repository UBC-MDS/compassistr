#' @title dry_calc
#' @description Calculates probability of at least one occurrence of an event given the number of attempts.
#'
#' @param p Probability of event occurrence.
#' @param n The number of attempts.
#' @param verbose Controls format of returned probability. Default (TRUE) returns result as a chr statement; FALSE returns result as a numeric.
#' @param plot Controls return of plot showing where the resulting probability lies on the binomial distribution. Default (TRUE) shows the plot.
#'
#' @return A number, the probability of at least one occurrence of event given the number of trials as a decimal (if verbose set to FALSE).
#' @export
#'
#' @examples
#' # return numeric probability and show plot
#' dry_calc(0.2, 5, verbose = FALSE, plot = TRUE)
#' # return probability in a chr statement and don't show plot
#' dry_calc(0.2, 5, verbose = TRUE, plot = FALSE)
#'
dry_calc <- function(p, n, verbose = TRUE, plot = TRUE){
  NULL
}
