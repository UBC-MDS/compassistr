#' Boss Completion
#'
#' @param rates A numeric vector of probabilities as floats between 1 and 0. When base_rate is defined must sum to 1
#' @param base_rate A probability between 1 and 0. In the case where there is a fixed rate of receiving an item table roll
#' @param attempts Number of attempts. Rounds to nearest int, rounds negatives to 0. Enables function to return probability of completion for number of attempts
#' @param verbose Enables printed output
#'
#' @return Returns a list
#' $conv should always converge to 1.0.
#' $count is the expected attempts for the given parameters.
#' $prob element is passed only when attempts in not NULL. It is the %prob of completion for given attempts
#' @export
#'
#' @examples

boss_completion <- function(rates, base_rate = NULL, attempts = NULL, verbose = TRUE){

  # Check that rates add to one for a base rate
  if (round(sum(rates),3) != 1.0  && is.null(base_rate) == FALSE){
    print("Rates do not add to 1 even though a base rate is provided")
    return (NULL)}

  # Check no rate is >1 or negative
  for (rate in rates)     {
    if (rate > 1 | rate < 0){
      print("Rates cannot be greater than 1 or less than 0")
      return (NULL)}}

  # generate permutations
  perms <- combinat::permn(rates)

  # initializing overall counters
  total_count <- 0
  total_probability <- 0

  for (perm in perms){

    # initializing permutation counters
    permutation_count <- 0
    remaining_prob <- 1
    permutation_prob <- 1

    # expected attempts for next permutation event, base rate
    if (!is.null(base_rate)){
      for (item in perm){
        permutation_count <- permutation_count + 1 / remaining_prob * 1 / base_rate
        remaining_prob <- remaining_prob - item
      }}

    # expected attempts for next permutation event, no base rate
    else {
      for (item in perm){
        permutation_count = permutation_count + 1 / remaining_prob
        remaining_prob = remaining_prob - item
      }}

    # probability of the permutation sequence
    for (i in 1:length(perm)) {
      j <- i - 1
      total <- 1
      while (j > 0) {
        total <- total - perm[j]
        j <- j - 1
      }
      permutation_prob <- permutation_prob * perm[i] / total
    }
    # count up total probabilities and total count
    total_probability <- total_probability + permutation_prob
    total_count <- total_count + permutation_count * permutation_prob
  }

  if (verbose == TRUE) {
    print(paste0("Expected Completion: ", as.integer(total_count)))}

  # Approximate probability as a single event for binomial probability
  if (!is.null(attempts)) {
    attempts <- as.integer(attempts)
    if (attempts < 0) {
      attempts <- 0
    }

    # edge case, 0% for less attempts than total items
    if (attempts < length(rates)) {
      if (verbose == TRUE) {
        print(paste("Probability of Completion at", attempts, "Attempts: 0%"))
      }
      p1_percent <- 0
      return_list <- list("conv" = round(total_probability, 3), "count" = as.integer(total_count), "prob" = round(p1_percent, 2))
      return (return_list)
    }

    #calculate prob not done
    else {
      x <-  0
      p0 <- choose(attempts, x) * (1/total_count ** x) * ((1 - 1/total_count) ** (attempts - x))


      p1 <- 1 - p0
      p1_percent <- p1 * 100

      if (verbose == TRUE) {
        print(paste0("Probability of Completion at ", attempts, " Attempts: ", round(p1_percent, 2), "%"))
      }
      return_list <- list("conv" = round(total_probability, 3), "count" = as.integer(total_count), "prob" = round(p1_percent, 2))
      return(return_list)
    }}
  return_list <- list("conv" = round(total_probability, 3), "count" = as.integer(total_count))
  return(return_list)
}
