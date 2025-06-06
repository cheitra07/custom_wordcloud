test_that("custom_wordcloud works", {
  expect_error(custom_wordcloud(c("a", "b"), c(10, 20)), NA)
})

