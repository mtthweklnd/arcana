#' Create an Arcana Object
#'
#' Constructor function for the arcana S3 class.
#'
#' @param name Character string, name of the tarot card
#' @param orientation Character string, either "upright" or "reversed"
#' @param keywords Character string, comma-separated keywords for the card
#' @param number Integer, the card number (0-21)
#'
#' @return An object of class "arcana"
#' @export
new_arcana <- function(name, orientation, keywords, number, emoji) {
  structure(
    list(
      name = name,
      orientation = orientation,
      keywords = keywords,
      number = number,
      emoji = emoji
    ),
    class = "arcana"
  )
}

#'Print Method for Arcana Objects
#' A styled print method for arcana objects using the cli package.
#'
#' @param x An object of class "arcana"
#' @param ... Additional arguments (unused)
#'
#' @return Invisibly returns the input object
#'
#' @importFrom cli make_ansi_style cli_div cli_h1 cli_text col_silver style_bold cli_ul
#' @export
print.arcana <- function(x, ...) {
  name <- x$name
  number <- x$number
  emoji <- x$emoji
  roman <- if (number == 0) {
    0
  } else {
    as.character(utils::as.roman(number))
  }
  orientation <- x$orientation
  keywords <- trimws(strsplit(x$keywords, ",")[[1]])

  color <- if (orientation == "upright") {
    color <- "#0cc9ba"
  } else {
    color <- "#c91649"
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

  # invisible(x)
}
