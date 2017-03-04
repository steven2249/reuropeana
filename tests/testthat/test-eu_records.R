context("eu_records")

test_that("eu_records", {
  tt <- eu_records(ids = "9200300/BibliographicResource_3000116310788", key = "sMgTRPQ4Z")
  
  expect.is(tt, "list")
  expect.is(tt[[1]]$apikey, "character")
  expect.is(tt[[1]]$success, "logic")
  expect.equal(tt[[1]]$statsDuration, 12799)
  expect.equal(tt[[1]]$requestment, 999)
  expect.is(tt[[1]]$object, "list")
  })
