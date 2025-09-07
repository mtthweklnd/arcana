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
new_arcana <- function(name, orientation, keywords, number) {
  structure(
    list(
      name = name,
      orientation = orientation,
      keywords = keywords,
      number = number
    ),
    class = "arcana"
  )
}