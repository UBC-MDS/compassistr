#' Calculates number of attempts/hrs to encounter/hatch a shiny
#'
#' @param gen Integer denoting generation of pokemon
#' @param masuda Is the player using masuda method. Default is FALSE
#' @param shiny_charm Does the player have a shiny charm. Default is FALSE
#' @param encounter_rate Rate of encounter of the pokemon (only for wild encounters). Default is 100%
#' @param atempt_time Time (in seconds) representing average time taken to encounter a pokemon, or soft reset. Default value is 15 seconds per encounter
#' @param hatch_time Time (in seconds) to hatch a single pokemon egg. Default value is 0
#'
#' @return Tibble containing probabilities, number of attempts, and hours
#' @export
#'
#' @examples
#' gen = 8
#' e_rate = 75
#' att = 20
#' shiny_hunt(gen = gen, encounter_rate = e_rate, attempt_time = att, shiny_charm = TRUE)
shiny_hunt <- function(gen, masuda = FALSE, shiny_charm = FALSE, encounter_rate = 100, attempt_time = 15, hatch_time = 0) {

  # making sure all inputs are legal
  # gen
  if (!is.numeric(gen)) {
    stop('Gen must be an integer!')
  }
  if (gen %% 1) {
    stop('Gen must be an integer')
  }
  if (gen < 1 | gen > 9) {
    stop('Gen must be in range [1-9]')
  }

  # masuda
  if (class(masuda) != 'logical') {
    stop('Masuda must be logical!')
  }

  # shiny_charm
  if (class(shiny_charm) != 'logical') {
    stop('Shiny charm must be a logical!')
  }

  # encounter_rate
  if (class(encounter_rate) != 'numeric') {
    stop('Encounter rate must be numeric!')
  }
  if (encounter_rate <= 0 | encounter_rate > 100) {
    stop('Encounter rate must be in range [0-100] (not including 0)')
  }

  # attempt_time
  if (class(attempt_time) != 'numeric') {
    stop('Attempt time must be an integer!')
  }
  if (attempt_time %% 1) {
    stop('Attempt time must be an integer')
  }
  if (attempt_time < 0) {
    stop('Attempt time cannot be negative')
  }

  # shiny_charm cannot be true before gen 5
  if (shiny_charm & gen < 5) {
    stop('Shiny charm did not exist prior to generation 5')
  }

  # masuda cannot be true before gen 4
  if (masuda & gen < 4) {
    stop('Masuda methd did not exist prior to generation 4')
  }

  # base rate of encountering a shiny pokemon before gen 6
  base_rate <- 1/8192

  # base rate doubles in gen 6 and above
  if (gen > 5) {
    base_rate <- base_rate * 2
  }

  prob <- base_rate

  # probability increases if player has shiny charm equipped
  if (shiny_charm) {
    prob <- prob + (2 * base_rate)
  }

  # probability increases further when using masuda method
  if (masuda) {
    prob <- prob + (4 * base_rate)
    if (gen > 4) {
      prob <- prob + base_rate
    }
  }

  expected_values <- c(0.25, 0.5, 0.75, 0.9, 0.99)
  results <- tibble::tibble(perc_chance = expected_values * 100)

  # calculate number of attempts required
  results <- results |> dplyr::mutate(attempts = ceiling(log(1 - perc_chance/100)/log(1 - prob)))

  if (masuda) {
    if (hatch_time) {
      results <- results |> dplyr::mutate(hours = round(attempts * hatch_time / 3600, 2))
    }
  } else if (encounter_rate < 100) {
    encounter_attempts <- log(0.1) / log(1 - (encounter_rate / 100))
    results <- results |> dplyr::mutate(attempts = ceiling(attempts * encounter_attempts),
                                 hours = round(attempts * attempt_time / 3600, 2))
  } else {
    results <- results |> dplyr::mutate(hours = round(attempts * attempt_time / 3600, 2))
  }
  results <- results |> dplyr::mutate(perc_chance = paste0(as.character(perc_chance), '%'))
  results
}
