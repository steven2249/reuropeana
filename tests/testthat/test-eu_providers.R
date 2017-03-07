context("eu_providers")

test_that("eu_providers", {
  aa <- eu_providers(key = "sMgTRPQ4Z")
  
  expect_is(aa, "list")
  expect_is(aa$meta, "list")
  expect_is(aa$meta[[1]], "character")
  expect_match(aa$meta[[1]], "sMgTRPQ4Z")
  expect_is(aa$meta[[2]], "logical")
  expect_is(aa$meta[[3]], "numeric")
  expect_is(aa$meta[[4]], "integer")
  expect_is(aa$meta[[5]], "integer")
  expect_is(aa$meta[[6]], "integer")
  expect_is(aa$meta[[7]], "integer")
  })
