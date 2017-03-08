context("eu_providers")

test_that("eu_providers", {
  tt <- eu_providers(key = getOption("eu_key"))
  
  expect_is(tt, "list")
  expect_is(tt$meta, "list")
  expect_is(tt$meta[[1]], "character")
  expect_is(tt$meta[[2]], "logical")
  expect_is(tt$meta[[3]], "numeric")
  expect_is(tt$meta[[4]], "integer")
  expect_is(tt$meta[[5]], "integer")
  expect_is(tt$meta[[6]], "integer")
  expect_is(tt$meta[[7]], "integer")
})
