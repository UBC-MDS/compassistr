#' Calculates number of attempts/hrs to encounter/hatch a shiny
#'
#' @param gen Integer denoting generation of pokemon
#' @param masuda Is the player using masuda method
#' @param shiny_charm Does the player have a shiny charm
#' @param encounter_rate Rate of encounter of the pokemon (only for wild encounters)
#' @param atempt_time Time (in seconds) representing average time taken to encounter a pokemon, or soft reset
#' @param hatch_time Time (in seconds) to hatch a single pokemon egg
#' @param verbose Controls format of returned probability. Default (True) prints results as statements, False returns a dict.
#'
#' @return Dictionary containing probabilities as keys and number of attempts/hrs values as tuples
#' @export
#'
#' @examples
shiny_hunt <- function(gen, masuda = FALSE, shiny_charm = FALSE, encounter_rate = 100, atempt_time = 15, hatch_time = NULL, verbose = FALSE){
  print(gen)
  gen
}
