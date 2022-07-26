test_that("uss_make_matches works", {

  # use the function to get a table to run the tests against
  spain <- uss_make_matches(engsoccerdata::spain, "Spain")
  # Check that the table is a tibble
  expect_true(tibble::is_tibble(spain))
  # Check that the expected columns are in the expected order
  expect_named(spain, c("country", "tier", "season", "date",
                        "home", "visitor", "goals_home","goals_visitor"))
  # Check that the country column we added does correspond to the country
  # we expect this table to represent
  expect_identical(unique(spain$country), "Spain")
  expect_s3_class(spain$tier, "factor")
  expect_snapshot(dplyr::glimpse(spain))
})
