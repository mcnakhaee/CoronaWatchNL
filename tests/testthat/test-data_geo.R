test_that("get_national_cases returns the correct number of columns", {
  result <- get_national_cases()
  expect_equal(length(result), 4)

})

test_that("get_provincial_cases returns the correct number of columns", {
  result <- get_provincial_cases()
  expect_equal(length(result), 6)

})


test_that("the results are up-to-date",{
  result_national <- get_national_cases()
  expect_gte(max(result_national$Datum),Sys.Date()-1)
})
