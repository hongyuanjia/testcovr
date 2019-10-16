test_that("A", {
    a <- A$new("string")
    add_binding(a, "y")
    expect_equal(a$y, "y")
})
