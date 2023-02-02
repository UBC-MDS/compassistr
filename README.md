
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `compassistr`

## Completionist Assistant

#### Authors/ Main Contributors: Samson Bakos, Marian Agyby, Waiel Tinwala, Ashwin Babu

A set of tools to help compute task time/ probabilities for video game
completionist tasks.

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

-   `shiny_hunt()`: Designed for hunting Shiny Pokemon. Computes the
    time to find a specific Shiny Pokemon based on the occurrence rate
    of that Pokemon in a specific region, and Pokemon generation/game.

-   `boss_completion():` A weighted permutation probability calculator
    that computes the expected attempts to complete a task as a function
    of the probabilities of all desired outcomes (i.e. expected boss
    kills to get all items based on all item drop rates). Includes
    optional arguments to also show probability of overall completion/
    completing each task for a given number of attempts.

-   `dry_calc()`: Computes the probability of obtaining at least one of
    a specific outcome in a given number of trials based on binomial
    probability (i.e. probability of obtaining an item from a boss in a
    given number of kills). Displays a plot showing probability of
    obtaining a drop over a range of trial counts, indicating location
    of provided trials on this curve.

-   `pts_calc()`: Computes the expected play time to obtain a target
    point level (i.e. price of an item, expected number of points per
    item drop) as a function of a player’s points per attempt and time
    per attempt. When passed multiple sets of points/ times, it ranks
    all of the possible strategies and provides a list of time required
    (in ranked order least to maximum).

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
#> Downloading GitHub repo UBC-MDS/compassistr@HEAD
#> colorspace (2.0-3  -> 2.1-0 ) [CRAN]
#> cli        (3.4.1  -> 3.6.0 ) [CRAN]
#> utf8       (1.2.2  -> 1.2.3 ) [CRAN]
#> fansi      (1.0.3  -> 1.0.4 ) [CRAN]
#> stringi    (1.7.8  -> 1.7.12) [CRAN]
#> cpp11      (0.4.2  -> 0.4.3 ) [CRAN]
#> vctrs      (0.5.1  -> 0.5.2 ) [CRAN]
#> stringr    (1.4.1  -> 1.5.0 ) [CRAN]
#> purrr      (0.3.4  -> 1.0.1 ) [CRAN]
#> dplyr      (1.0.9  -> 1.1.0 ) [CRAN]
#> sys        (3.4    -> 3.4.1 ) [CRAN]
#> openssl    (2.0.2  -> 2.0.5 ) [CRAN]
#> jsonlite   (1.8.0  -> 1.8.4 ) [CRAN]
#> curl       (4.3.2  -> 5.0.0 ) [CRAN]
#> ps         (1.7.1  -> 1.7.2 ) [CRAN]
#> digest     (0.6.29 -> 0.6.31) [CRAN]
#> sass       (0.4.2  -> 0.4.5 ) [CRAN]
#> tinytex    (0.41   -> 0.44  ) [CRAN]
#> htmltools  (0.5.3  -> 0.5.4 ) [CRAN]
#> bslib      (0.4.0  -> 0.4.2 ) [CRAN]
#> xfun       (0.32   -> 0.37  ) [CRAN]
#> yaml       (2.3.5  -> 2.3.7 ) [CRAN]
#> highr      (0.9    -> 0.10  ) [CRAN]
#> evaluate   (0.16   -> 0.20  ) [CRAN]
#> processx   (3.7.0  -> 3.8.0 ) [CRAN]
#> rmarkdown  (2.16   -> 2.20  ) [CRAN]
#> knitr      (1.40   -> 1.42  ) [CRAN]
#> fs         (1.5.2  -> 1.6.0 ) [CRAN]
#> callr      (3.7.2  -> 3.7.3 ) [CRAN]
#> crayon     (1.5.1  -> 1.5.2 ) [CRAN]
#> bit        (4.0.4  -> 4.0.5 ) [CRAN]
#> vroom      (1.5.7  -> 1.6.1 ) [CRAN]
#> tidyr      (1.2.0  -> 1.3.0 ) [CRAN]
#> broom      (1.0.0  -> 1.0.3 ) [CRAN]
#> readr      (2.1.2  -> 2.1.3 ) [CRAN]
#> forcats    (0.5.2  -> 1.0.0 ) [CRAN]
#> gargle     (1.2.0  -> 1.3.0 ) [CRAN]
#> isoband    (0.2.5  -> 0.2.7 ) [CRAN]
#> gtable     (0.3.0  -> 0.3.1 ) [CRAN]
#> data.table (1.14.2 -> 1.14.6) [CRAN]
#> modelr     (0.1.9  -> 0.1.10) [CRAN]
#> lubridate  (1.8.0  -> 1.9.1 ) [CRAN]
#> dbplyr     (2.2.1  -> 2.3.0 ) [CRAN]
#> Installing 43 packages: colorspace, cli, utf8, fansi, stringi, cpp11, vctrs, stringr, purrr, dplyr, sys, openssl, jsonlite, curl, ps, digest, sass, tinytex, htmltools, bslib, xfun, yaml, highr, evaluate, processx, rmarkdown, knitr, fs, callr, crayon, bit, vroom, tidyr, broom, readr, forcats, gargle, isoband, gtable, data.table, modelr, lubridate, dbplyr
#> Installing packages into '/private/var/folders/22/y06w1gk96hx1hj0kj0zt3pcw0000gn/T/RtmpTAQTcO/temp_libpath309824b5bfc0'
#> (as 'lib' is unspecified)
#> 
#> The downloaded binary packages are in
#>  /var/folders/22/y06w1gk96hx1hj0kj0zt3pcw0000gn/T//Rtmp7lwSgY/downloaded_packages
#> * checking for file ‘/private/var/folders/22/y06w1gk96hx1hj0kj0zt3pcw0000gn/T/Rtmp7lwSgY/remotes330b402a3c8b/UBC-MDS-compassistr-c8ab10b/DESCRIPTION’ ... OK
#> * preparing ‘compassistr’:
#> * checking DESCRIPTION meta-information ... OK
#> * checking for LF line-endings in source and make files and shell scripts
#> * checking for empty or unneeded directories
#> * building ‘compassistr_0.0.0.9000.tar.gz’
#> Installing package into '/private/var/folders/22/y06w1gk96hx1hj0kj0zt3pcw0000gn/T/RtmpTAQTcO/temp_libpath309824b5bfc0'
#> (as 'lib' is unspecified)
```

## Usage

``` r
library(compassistr)
```

See Docs/ Vignettes for usage examples for each individual function
