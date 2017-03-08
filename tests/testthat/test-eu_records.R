context("eu_records")

test_that("eu_records", {
  tt <- eu_records(ids = "9200300/BibliographicResource_3000116310788", key = getOption("eu_key"))
  
  expect_is(tt, "list")
  expect_is(tt[[1]]$apikey, "character")
  expect_is(tt[[1]]$success, "logical")
  expect_is(tt[[1]]$statsDuration, "integer")
  expect_is(tt[[1]]$object, "list")
})
