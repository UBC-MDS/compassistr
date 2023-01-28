#' Boss Completion
#'
#' @param rates A numeric vector of probabilities as floats between 1 and 0. When base_rate is defined must sum to 1
#' @param base_rate A probability between 1 and 0. In the case where there is a fixed rate of receiving an item table roll
#' @param attempts Number of attempts. Rounds to nearest int, rounds negatives to 0. Enables function to return probability of completion for number of attempts
#' @param verbose Enables printed output
#'
#' @return Returns a numeric vector. 
#' First element should always converge to 1.0. 
#' Second element is the expected attempts for the given parameters. 
#' Third element is passed only when attempts in not NULL. It is the %prob of completion for given attempts 
#' @export
#'
#' @examples
boss_completion <- function(rates, base_rate = NULL, attempts = NULL, verbose = TRUE){
  NULL
}
