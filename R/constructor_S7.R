# constructor_S7.R

#' @import S7
NULL

#' The Arcana Class
#'
#' @description
#' The `arcana` class defines a tarot card. It uses the S7 object-oriented
#' framework to ensure that each card object has a consistent structure with
#' validated properties.
#'
#' @param name The name of the card (e.g., "The Fool").
#' @param number The card's number, from 0 to 21.
#' @param orientation Either "upright" or "reversed".
#' @param keywords A comma-separated character string of keywords. These will be
#'   automatically converted to a character vector.
#' @param emoji The emoji associated with the card.
#'
#' @return An S7 object of class `arcana`.
#' @export
arcana <- S7::new_class(
  "arcana",
  properties = list(
    name = S7::class_character,
    number = S7::class_integer,
    emoji = S7::class_character,
    # NEW: keywords is now a list holding both upright and reversed meanings
    keywords = S7::new_property(
      class = S7::class_list,
      validator = function(value) {
        if (!all(c("upright", "reversed") %in% names(value))) {
          "keywords list must contain 'upright' and 'reversed' names"
        }
      }
    ),
    # This property now represents the card's current state
    orientation = S7::class_character
  ),
  validator = function(self) {
    # The main validator still checks if the orientation is a valid state
    if (!(self@orientation %in% c("upright", "reversed"))) {
      "@orientation must be either 'upright' or 'reversed'"
    }
  }
)
# print.arcana

# Define a new generic for printing, if one doesn't exist
print <- S7::new_generic("print", "x")

# Define the print method for our arcana class
S7::method(print, arcana) <- function(x, ...) {
  name <- x@name
  number <- x@number
  emoji <- x@emoji
  orientation <- x@orientation

  # DYNAMICALLY select keywords based on the orientation "state"
  keywords_to_display <- x@keywords[[orientation]]
  keywords <- stringr::str_split(keywords_to_display, ", ", simplify = TRUE)

  roman <- if (number == 0) {
    "0"
  } else {
    as.character(utils::as.roman(number))
  }

  color <- if (orientation == "upright") {
    "#0cc9ba"
  } else {
    "#c91649"
  }

  card_theme <- list(
    .box = list(
      border = "single",
      "border-col" = "grey",
      padding = 1
    ),
    span.splash = list(color = color, "font-weight" = "bold"),
    span.h3 = list(padding = 0)
  )

  cli::cli_div(id = "box", theme = card_theme)
  cli::cli_rule("{.strong {roman} - {name} {emoji}}")
  cli::cli_text("── {.splash {toupper(orientation)}}")
  cli::cli_ul(keywords)
  cli::cli_end()
}
