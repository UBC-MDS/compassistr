#' @title dry_calc
#' @description Calculates probability of at least one occurrence of an event given the number of attempts.
#'
#' @param p Probability of event occurrence.
#' @param n The number of attempts.
#' @param verbose Controls format of returned probability. Default (TRUE) returns result as a chr statement; FALSE returns result as a numeric.
#' @param plot Controls return of plot showing where the resulting probability lies on the binomial distribution. Default (TRUE) shows the plot.
#'
#' @return A number, the probability of at least one occurrence of event given the number of trials as a decimal (if verbose set to FALSE).
#' @export
#'
#' @examples
#' # return numeric probability and show plot
#' dry_calc(0.2, 5, verbose = FALSE, plot = TRUE)
#' # return probability in a chr statement and don't show plot
#' dry_calc(0.2, 5, verbose = TRUE, plot = FALSE)
#'
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
      mutate(highlight = ifelse(num_trials == n, TRUE, FALSE))

    pplot <-
      ggplot(df, aes(x = num_trials, y = prob, fill = highlight)) +
      geom_bar(stat = "identity", color = "white") +
      ggthemes::scale_fill_tableau() +
      theme(legend.position = 'none') +
      annotate(
        'text',
        label = round(p1, 2),
        x = n,
        y = p1,
        vjust = -0.3
      ) +
      labs(x = "Number of Attempts", y = "Probability")

    print(pplot)

  }

  return(result)

}
