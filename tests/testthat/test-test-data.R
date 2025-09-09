test_that("major_arcana objects has the correct structure", {
  # Test that the object is a list
  expect_type(.major_arcana_objects, "list")

  # Test that it has exactly 22 cards
  expect_length(.major_arcana_objects, 22)

  # Test that all elements in the list are arcana objects
  expect_true(all(purrr::map_lgl(
    .major_arcana_objects,
    ~ inherits(.x, "arcana")
  )))
})

test_that("each card in major_arcana_objects is valid", {
  # This test loops through every card to check its properties,
  # addressing your second requirement.
  purrr::walk(.major_arcana_objects, function(card) {
    # Check that the number is an integer
    expect_type(card@number, "integer")

    # Check that keywords is a list
    expect_type(card@keywords, "list")

    # Check that both orientations have a definition
    expect_named(card@keywords, c("upright", "reversed"))

    # Check that the keyword definitions are not empty
    expect_true(all(nchar(card@keywords$upright) > 0))
    expect_true(all(nchar(card@keywords$upright) > 0))
  })
})
