test_that("base line functionality for various use cases", {

  # Test base functionality
  expect_equal(boss_completion(rates = c(7 / 24, 7 / 24, 3 / 24, 2 / 24, 2 / 24, 2 / 24, 1 / 24), base_rate = 1/20, attempts = 673, verbose = FALSE)$count, 673)

  expect_equal(boss_completion(rates = c(7 / 24, 7 / 24, 3 / 24, 2 / 24, 2 / 24, 2 / 24, 1 / 24), base_rate = 1/20, attempts = 673, verbose = FALSE)$prob, 63.24)

  # Test if still works when not returning a probability
  expect_equal(boss_completion(rates = c(7 / 24, 7 / 24, 3 / 24, 2 / 24, 2 / 24, 2 / 24, 1 / 24), base_rate = 1/20, verbose = FALSE)$count, 673)

  # Expected behavior for no base rate (this is number of drops required in initial problem, not number of attempts)
  expect_equal(boss_completion(rates = c(7 / 24, 7 / 24, 3 / 24, 2 / 24, 2 / 24, 2 / 24, 1 / 24))$count, 33)
})


test_that("returning a nonzero prob for an impossible outcome", {
  # Test 0 probability for less attempts than items desired
  expect_equal(boss_completion(rates=c(1 / 5, 1 / 5, 1 / 5, 1 / 5, 1 / 5), attempts=3, verbose=FALSE)$prob, 0)})


test_that("failing to return NULL for invalid rate parameters",{
  # Test for a rate > 1
  expect_equal(boss_completion(rates=c(2, 1 / 5, 1 / 5, 1 / 5, 1 / 5), attempts=3, verbose=FALSE), NULL)

  # Test for a rate < 0
  expect_equal(boss_completion(rates=c(-1 / 5, 1 / 5, 1 / 5, 1 / 5, 1 / 5), attempts=3, verbose=FALSE), NULL)})
