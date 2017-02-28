context("eu_providers")

test_that("eu_providers", {
  aa <- eu_provides()
  
  expect.is(aa, "")
