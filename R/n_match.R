#' Count the Number of Matches for Each Element in a Vector
#'
#' This function counts how many times each element of vector `x` matches any element in vector `y`.
#'
#' @param x A vector of elements to be matched.
#' @param y A vector in which the elements from `x` will be matched.
#'
#' @return An integer vector of the same length as `x`, where each element indicates the number of times it matches in `y`.
#'
#' @examples
#' \dontrun{
#' x <- c(1, 2, 3)
#' y <- c(1, 1, 2, 4)
#' n_match(x, y)}
#'
#' @keywords internal
n_match <- function(x, y) {
  outer(X = x, Y = y, FUN = "==") |>
    rowSums()
}

#' Check if an Element Matches Exactly Once
#'
#' This function checks whether a specific element from vector `x` appears exactly once in vector `y`.
#'
#' @param x A vector containing the elements to match.
#' @param y A vector in which the elements from `x` will be matched.
#'
#' @return A logical vector of the same length as `x`, where each element is `TRUE` if it matches exactly once in `y`, and `FALSE` otherwise.
#'
#' @examples
#' \dontrun{
#' x <- c(1, 2, 3)
#' y <- c(1, 1, 2, 4)
#' matches_once(x, y)}
#'
#' @keywords internal
matches_once <- function(x, y) {
  n_match(x,y) == 1L
}
