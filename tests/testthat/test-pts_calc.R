# testing for input variable data types and negative values
test_that("pts_calc input variables are not acceptable !", {
    expect_error(pts_calc(target_points = 'a'))
    expect_error(pts_calc(points_attempt = c(10, 10, 20), time_attempt = c('a')))
    expect_error(pts_calc(points_attempt = c(10, 10, -20), time_attempt = c(10,10,10), target_points = 100))
})

# Testing the output of the function
test_that("Output of the function pts_calc() is incorrect!", {
  expect_equal(pts_calc(c(100,20,120,150,200,30),c(2,3,2,5,6,2),200), 
               c(3.333, 4.0, 6.0, 6.667, 13.333, 29.999)
  )
})
