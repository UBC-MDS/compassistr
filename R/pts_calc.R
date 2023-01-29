#' Calculates and returns the list of time required (in ranked order) to achieve target points using the different options provided in input 
#'
#' @param points_attempt numeric vector for number of points obtained in each attempt
#' @param time_attempt numeric vector for time taken (in minutes) for each attempt
#' @param target_points Float / Integer number of points targetted to reach
#'
#' @return numeric vector for time required (in ranked order of minutes) to achieve target points using the different options provided in input
#' @export
#'
#' @examples
#' points_attempt = c(100,20,120,150,200,30)
#' time_attempt = c(2,3,2,5,6,2)
#' target_points = 200
#' pts_calc(points_attempt = points_attempt,time_attempt = time_attempt ,target_points = target_points)
pts_calc <- function(points_attempt, time_attempt,  target_points, verbose=TRUE){
  print(points_attempt)
}
