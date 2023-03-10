
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `compassistr`

<!-- badges: start -->

[![R-CMD-check](https://github.com/UBC-MDS/compassistr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/UBC-MDS/compassistr/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

<!-- badges: start -->

[![codecov](https://codecov.io/gh/UBC-MDS/compassistr/branch/main/graph/badge.svg?token=dGNyqkOa7g)](https://codecov.io/gh/UBC-MDS/compassistr)
<!-- badges: end -->

## Completionist Assistant

#### Authors/ Main Contributors: Samson Bakos, Marian Agyby, Waiel Tinwala, Ashwin Babu

A set of tools to help compute task time/ probabilities for video game
completionist tasks.

Visit the site here! <https://ubc-mds.github.io/compassistr/>

“Completionism” is a common goal in video games, referring to the goal
of achieving every objective in a game (or individual extraneous
side-objectives), as opposed to merely doing enough to win. Common
examples include hunting for Shiny Pokemon, the Runescape Collection
Log, World of Warcraft Achievement Log, among many others. Completionism
is generally an exercise in goal setting, dedication, time-commitment,
and efficiency. As an example of the time scales involved, hunting a
single shiny Pokemon can takes dozens of hours, completing individual
Runescape bosses can take from less than ten to many thousands of hours,
and the impossible task of completing the entire collection log is
estimated to be more than 500 years of play time. Small optimizations
have the potential to save large amounts of time and effort, and as such
completionist players are often very efficiency-oriented by necessity.

This package provides tools to help completionist players focus and
analyze their goals. These tools compute and visualize expected
attempts, play times, and probabilities to help players understand their
goals and compare the efficiency of different methods. Current tools are
developed with use cases focusing on goals in the games Oldschool
Runescape and Pokemon, but the use cases are easily generalized to other
applications.

The following functions are currently available:

- `shiny_hunt()`: Designed for hunting Shiny Pokemon. Computes the time
  to find a specific Shiny Pokemon based on the occurrence rate of that
  Pokemon in a specific region, and Pokemon generation/game.

- `boss_completion():` A weighted permutation probability calculator
  that computes the expected attempts to complete a task as a function
  of the probabilities of all desired outcomes (i.e. expected boss kills
  to get all items based on all item drop rates). Includes optional
  arguments to also show probability of overall completion/ completing
  each task for a given number of attempts.

- `dry_calc()`: Computes the probability of obtaining at least one of a
  specific outcome in a given number of trials based on binomial
  probability (i.e. probability of obtaining an item from a boss in a
  given number of kills). Displays a plot showing probability of
  obtaining a drop over a range of trial counts, indicating location of
  provided trials on this curve.

- `pts_calc()`: Computes the expected play time to obtain a target point
  level (i.e. price of an item, expected number of points per item drop)
  as a function of a player’s points per attempt and time per attempt.
  When passed multiple sets of points/ times, it ranks all of the
  possible strategies and provides a list of time required (in ranked
  order least to maximum).

There are some tools that perform similar functions to functions in
`compassist`. For example, the `giovanni` package
<https://github.com/tgsmith61591/giovanni> provides similar applications
for hunting Shiny Pokemon. Users with sufficient understanding can also
use mainstream statistical tools (i.e. `scipy`
<https://github.com/scipy/scipy>) to replicate the basic functionalities
of functions like `dry_calc`. The unique application of this package is
to provide a centralized location for multiple different tools, to
simplify calculation for users with less statistical understanding and
tailor outputs to specific video game applications, as well as to
provide additional helpful functionalities such as visualizations and
rankings.

## Installation

You can install the development version of `compassistr` from Github

``` r
# install.packages("devtools")
devtools::install_github("UBC-MDS/compassistr")
```

## Usage

``` r
library(compassistr)
```

See Docs/ Vignettes for usage examples for each individual function
https://ubc-mds.github.io/compassistr/articles/compassistr.html
