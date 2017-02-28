context("eu_search")

test_that("eu_search", {
  aa <- eu_search(query = "Mona Lisa", key = "sMgTRPQ4Z")
  
  expect.is(aa, "list")
  expect.equal(aa$apikey, "sMgTRPQ4Z")
  expect.equal(aa$success, TRUE)
  expect.equal(aa$requestNumber, 999)
  expect.equal(aa$itemsCount, 10)
  expect.equal(aa$totalResults, 499)
  expect.is(aa$items, "list")
  expect.is(aa$items[[1]], "list")
  expect.is(aa$items[[2]], "list")
  expect.equal(aa$items[[1]]$id, "/92066/bib_chccsa000071993")
  })
