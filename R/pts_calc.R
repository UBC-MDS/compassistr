#' Calculates and returns the list of time required (in ranked order) to achieve target points using the different options provided in input 
#'
#' @param points_attempt list of number of points obtained in each attempt
#' @param time_attempt list of time taken (in minutes) for each attempt
#' @param target_points number of points targetted to reach
#' @param verbose bool Controls format of returned time taken. Default (True) prints results as statements, False returns a list.
#'
#' @return list of time required (in ranked order of minutes) to achieve target points using the different options provided in input
#' @export
#'
#' @examples
pts_calc <- function(points_attempt, time_attempt,  target_points, verbose=TRUE){
  print(points_attempt)
}
