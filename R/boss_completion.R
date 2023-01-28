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
  if round(sum(rates),3) 


}

library(testthat)

# Test base functionality
expect_equal(boss_completion(rates = c(7 / 24, 7 / 24, 3 / 24, 2 / 24, 2 / 24, 2 / 24, 1 / 24), base_rate = 1/20, attempts = 673, verbose = False), c(1,673,63.24))

# Test if still works when not returning a probability
expect_equal(boss_completion(rates = c(7 / 24, 7 / 24, 3 / 24, 2 / 24, 2 / 24, 2 / 24, 1 / 24), base_rate = 1/20, verbose = False), c(1,673))

# Expected behavior for no base rate (this is number of drops required in initial problem, not number of attempts)
expect_equal(boss_completion(rates = c(7 / 24, 7 / 24, 3 / 24, 2 / 24, 2 / 24, 2 / 24, 1 / 24)), c(1,33))

# Test where rates do not converge for base rate case
expect_equal(boss_completion(rates  = c(1,1,1), bate_rate = 1/2), NULL)

# Test 0 probability for less attempts than items desired
expect_equal(boss_completion(rates=c(1 / 5, 1 / 5, 1 / 5, 1 / 5, 1 / 5), attempts=3, verbose=False)[3],0)

# Test for a rate > 1
expect_equal(boss_completion(rates=c(2, 1 / 5, 1 / 5, 1 / 5, 1 / 5), attempts=3, verbose=False), NULL)

# Test for a rate < 0
expect_equal(boss_completion(rates=c(-1 / 5, 1 / 5, 1 / 5, 1 / 5, 1 / 5), attempts=3, verbose=False), NULL)