context("eu_providers")

test_that("eu_providers", {
  aa <- eu_provides(key = "sMgTRPQ4Z")
  
  expect.is(aa, "list")
  expect.is(aa$meta, "list")
  expect.is(aa$meta[[1]], "character")
  expect.match(aa$meta[[1]], "sMgTRPQ4Z")
  expect.is(aa$meta[[2]], "logic")
  expect.is(aa$meta[[3]], "numeric")
  expect.is(aa$meta[[4]], "integer")
  expect.is(aa$meta[[5]], "integer")
  expect.is(aa$meta[[6]], "integer")
  expect.is(aa$meta[[7]], "integer")
               
               })
