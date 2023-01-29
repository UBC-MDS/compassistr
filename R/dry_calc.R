#' @title dry_calc
#' @description Calculates probability of at least one occurrence of an event given the number of attempts.
#'
#' @param p Numeric probability of event occurrence.
#' @param n Integer indicating the number of attempts.
#' @param verbose Controls format of returned probability; Default (TRUE) prints result as a chr statement; FALSE returns result as a numeric decimal.
#' @param plot Controls printing of plot showing where the resulting probability lies on the binomial distribution; Default (TRUE) shows the plot.
#'
#' @return A number, the probability of at least one occurrence of the event given the number of trials is returned as a decimal (if verbose set to FALSE).
#' @export
#'
#' @examples
#' # return numeric probability and show plot
#' dry_calc(0.2, 5L, verbose = FALSE, plot = TRUE)
#' # return probability in a chr statement and don't show plot
#' dry_calc(0.5, 3L, verbose = TRUE, plot = FALSE)
dry_calc <- function(p, n, verbose = TRUE, plot = TRUE) {
  # check probability input is a number between 0 and 1
  if (!is.numeric(p) | !(0 <= p & p <= 1)) {
    stop("The probability, p, should be a number between 0 and 1!")
  }

  # check number of attempts is a positive integer
  if (!is.integer(n) | !(n >= 0)) {
    stop(
      "The number of attempts, n, should be an integer greater than or equal to 0!
         Integer n should be typed in as #L. For example, type in 3L for 3 attempts."
    )
  }

  # calculate p(0): binomial probability of the event occurring 0 times given n trials and probability p
  x <-  0
  p0 <- choose(n, x) * (p ** x) * ((1 - p) ** (n - x))

  # calculate probability of at least 1 occurrence: 1 - p(0)
  p1 <- 1 - p0
  p1_percent <- p1 * 100

  # check verbose argument and return result
  result <- if (verbose == TRUE) {
    statement <-
      paste0(
        "There is a ",
        round(p1_percent, 1),
        "% chance of the event occurring at least once after you play ",
        n,
        " attempts."
      )
    statement
  } else {
    p1
  }

  # print plot if requested
  if (plot == TRUE) {
    pn <- 0L
    pp <- dry_calc(p, pn, verbose = FALSE, plot = FALSE)

    # initiate x and y vectors
    px <- c(pn)
    py <- c(pp)
    while (pp <= 0.99) {
      pn <- pn + 1L
      pp <- dry_calc(p, pn, verbose = FALSE, plot = FALSE)
      px <- append(px, pn)
      py <- append(py, pp)
    }
    df <- data.frame(num_trials = px, prob = py) |>
      dplyr::mutate(highlight = ifelse(num_trials == n, TRUE, FALSE))

    pplot <-
      ggplot2::ggplot(df, ggplot2::aes(x = num_trials, y = prob, fill = highlight)) +
      ggplot2::geom_bar(stat = "identity", color = "white") +
      ggthemes::scale_fill_tableau() +
      ggplot2::theme(legend.position = 'none') +
      ggplot2::annotate(
        'text',
        label = round(p1, 2),
        x = n,
        y = p1,
        vjust = -0.3
      ) +
      ggplot2::labs(x = "Number of Attempts", y = "Probability")

    print(pplot)

  }

  return(result)

}
