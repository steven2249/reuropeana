context("eu_search")

test_that("eu_search", {
  tt <- eu_search(query = "Mona Lisa", key = "sMgTRPQ4Z")
  
  expect_is(tt, "list")
  expect_equal(tt$apikey, "sMgTRPQ4Z")
  expect_equal(tt$success, TRUE)
  expect_is(tt$requestNumber, "integer")
  expect_is(tt$itemsCount, "integer")
  expect_is(tt$totalResults, "integer")
  expect_is(tt$items, "list")
  expect_is(aa$items[[1]], "list")
  expect_is(aa$items[[2]], "list")
  })
