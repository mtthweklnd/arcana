#' @title The Arcana Class
#'
#' @description
#' The `arcana` class defines a tarot card. It uses the `S7` object-oriented
#' framework to ensure that each card object has a consistent structure with
#' validated properties.
#'
#' @param name The name of the card (e.g., "The Fool").
#' @param number The cards number (an integer), from 0 to 21.
#' @param keywords A comma-separated character string of keywords. These will
#' be automatically converted to a character vector.
#' @param emoji The emoji associated with the card.
#'
#' @returns An `S7` object of class `arcana`.
#'
#' @examples
#'  card <- major_arcana_list$the_fool
#'  the_fool <- arcana(
#'    name = card$name,
#'    number = card$number,
#'    emoji = card$emoji,
#'    keywords = list(
#'      upright = card$upright,
#'      reversed = card$reversed
#'    )
#'  )
#'
#' @export
arcana <- S7::new_class(
  "arcana",
  properties = list(
    name = S7::class_character,
    number = S7::class_integer,
    emoji = S7::class_character,
    keywords = S7::new_property(
      class = S7::class_list,
      validator = function(value) {
        if (!all(c("upright", "reversed") %in% names(value))) {
          "keywords list must contain 'upright' and 'reversed' names"
        }
      }
    ),
    orientation = S7::new_property(
      getter = function(self) sample(c("upright", "reversed"), 1)
    )
  )
)

#' @export
S7::method(print, arcana) <- function(x, ...) {
  name <- x@name
  number <- x@number
  emoji <- x@emoji
  orientation <- x@orientation
  keywords <- x@keywords[[orientation]]

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
