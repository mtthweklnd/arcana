test_that("arcana object properties have the correct types", {
  card <- arcana(
    name = "The Test",
    number = 99L,
    emoji = "\U0001F525",
    keywords = list(upright = "a, b", reversed = "c, d")
  )

  # Test that the object is the correct S7 class
  expect_s7_class(card, arcana)

  # Test that properties have the correct data types
  expect_type(card@name, "character")
  expect_type(card@number, "integer")
  expect_type(card@keywords, "list")
})

test_that("arcana validators throw errors for bad input", {
  expect_error(
    arcana(
      name = "Error Card",
      number = 1L,
      emoji = "e",
      keywords = list(upright = "a", reversed = "b"),
      orientation = "sideways"
    ),
    "unused argument"
  )

  # This tests that the keywords list must have the correct names
  expect_error(
    arcana(
      name = "Error Card",
      number = 1L,
      emoji = "e",
      keywords = list(up = "a", down = "b")
    ),
    "must contain 'upright' and 'reversed' names"
  )

  expect_error(
    arcana(
      name = "Error Card",
      number = 10,
      emoji = "e",
      keywords = list(up = "a", down = "b")
    ),
    "@number must be <integer>"
  )
})
