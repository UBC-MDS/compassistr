# test input checks for p are working
test_that("Non-numeric or out-of-range values for p should throw an error.", {
  expect_error(dry_calc("two", 5L, verbose = TRUE, plot = FALSE))
  expect_error(dry_calc(-0.3, 5L, verbose = FALSE, plot = TRUE))
  expect_error(dry_calc(25, 5L, verbose = FALSE, plot = TRUE))
})

# test input checks for n are working
test_that("Non-integer or out-of-range values for n should throw an error.", {
  expect_error(dry_calc(0.5,-1L, verbose = TRUE, plot = FALSE))
  expect_error(dry_calc(0.2, "three", verbose = FALSE, plot = TRUE))
  expect_error(dry_calc(0.75, 3, verbose = FALSE, plot = TRUE))
  expect_error(dry_calc(0.75, 3.5, verbose = TRUE, plot = TRUE))
})

# test the returned probability value is correct
test_that("The calculated probability is incorrect.", {
  expect_equal(dry_calc(0, 5L, verbose = FALSE, plot = FALSE), 0)
  expect_equal(dry_calc(0.2, 0L, verbose = FALSE, plot = FALSE), 0)
  expect_equal(dry_calc(0.2, 5L, verbose = FALSE, plot = FALSE), 1 - 0.32768)
  expect_equal(dry_calc(0.5, 10L, verbose = FALSE, plot = FALSE),
               1 - 0.0009765625)
})

# test that the returned probability is between 0 and 1
test_that("The calculated probability is outside the  correct range of values [0, 1].", {
  expect_lte(dry_calc(0.05, 10L, verbose = FALSE, plot = FALSE), 1)
  expect_gte(dry_calc(0.05, 10L, verbose = FALSE, plot = FALSE), 0)
  expect_lte(dry_calc(0.75, 7L, verbose = FALSE, plot = FALSE), 1)
  expect_gte(dry_calc(0.75, 7L, verbose = FALSE, plot = FALSE), 0)
  expect_lte(dry_calc(0.25, 0L, verbose = FALSE, plot = FALSE), 1)
  expect_gte(dry_calc(0.25, 0L, verbose = FALSE, plot = FALSE), 0)
})

# test that the returned result is the correct data type
test_that("The output is not the correct data type.", {
  expect_type(dry_calc(0, 5L, verbose = TRUE, plot = FALSE), "character")
  expect_type(dry_calc(0.2, 0L, verbose = FALSE, plot = FALSE), "double")
})
