# test whether the legal inputs check is being done
test_that("shiny_hunt() input check is not working!", {
  expect_error(shiny_hunt(gen = 'eight'))
  expect_error(shiny_hunt(gen = 8, masuda = 1))
  expect_error(shiny_hunt(gen = 8, shiny_charm = 'no'))
  expect_error(shiny_hunt(gen = 8, attempt_time = TRUE))
  expect_error(shiny_hunt(gen = 8, encounter_rate = '65'))
})

# test whether shiny_hunt gives correct output
test_that("shiny_hunt() output is incorrect!", {
  expect_equal(shiny_hunt(gen = 3, masuda = FALSE, shiny_charm = FALSE, encounter_rate = 45, attempt_time = 25),
               tibble::tibble(perc_chance = c('25%', '50%', '75%', '90%', '99%'),
                              attempts = c(9079, 21869, 43738, 72648, 145295),
                              hours = c(63.05, 151.87, 303.74, 504.50, 1008.99))
  )
})

# test whether the range detection of inputs in shiny_hunt is working
test_that("shiny_hunt() input range check is not working!", {
  expect_error(shiny_hunt(gen = 15))
  expect_error(shiny_hunt(gen = -1))
  expect_error(shiny_hunt(gen = 8, attempt_time = -5))
  expect_error(shiny_hunt(gen = 8, encounter_rate = 105))
  expect_error(shiny_hunt(gen = 8, encounter_rate = -10))
})
