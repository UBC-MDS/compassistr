#' Title
#'
#' @param rates A list of probabilities as floats between 1 and 0. When base_rate is defined must sum to 1
#' @param base_rate A probability between 1 and 0. In the case where there is a fixed rate of receiving an item table roll
#' @param attempts Number of attempts. Rounds to nearest int, rounds negatives to 0. Enables function to return probability of completion for number of attempts
#' @param verbose Enables printed output
#'
#' @return
#' @export
#'
#' @examples
boss_completion <- function(rates, base_rate = NULL, attempts = NULL, verbose = TRUE){
  NULL
}
