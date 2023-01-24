# test whether the legal inputs check is being done
test_that("shiny_hunt() input check is not working!", {
  expect_error(shiny_hunt(gen = 'eight'))
  expect_error(shiny_hunt(gen = 8, masuda = 1))
  expect_error(shiny_hunt(gen = 8, shiny_charm = 'no'))
  expect_error(shiny_hunt(gen = 8, attempt_time = TRUE))
  expect_error(shiny_hunt(gen = 8, encounter_rate = '65'))
})
