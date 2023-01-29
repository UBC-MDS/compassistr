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
pts_calc <- function(points_attempt, time_attempt,  target_points){
    # Checking data types of input parameters
    if (!is.numeric(target_points)) {
    stop('target points must be of type float or int')
    }
    
    if (!is.numeric(points_attempt)) {
    stop('points_attempt must be of type list of float or int')
    }
    
    if (!is.numeric(time_attempt)) {
    stop('time_attempt must be of type list of float or int')
    }
    
    if (length(points_attempt) != length(time_attempt)) {
    stop('The length of points attempt and time taken do not match')
    }
    
    if (!all(points_attempt > 0)) {
    stop('points achieved cannot be negative or zero')
    }
    
    if (!all(time_attempt > 0)) {
    stop('time taken cannot be negative or zero')
    }
    
    # Creating a tibble using the input vectors points_attempt and time_attempt
    time_required <- tibble::tibble(points_attempt, time_attempt)
    
    # Calculating the scoring rate based on different options provided in the input parameters naming it scoring_rate
    time_required <- time_required |> dplyr::mutate(scoring_rate = round(points_attempt / time_attempt, 3))
    
    # Calculating the time required to achieve the target goal provided naming it time
    time_required <- time_required |> dplyr::mutate(time = round(target_points / scoring_rate, 3))
    
    # Sorting (Ranking) in ascending order the time in minutes it will take to reach the target points
    time_required <- time_required |> dplyr::arrange(time)
    
    # Returning the numeric vector that contains ranked (ordered) time in minutes to reach target points.
    sorted_time_required <- as.numeric(time_required$time)
    sorted_time_required
    
}