#' Last update of HGNC data set
#'
#' This function returns the date of the most recent update of the HGNC data
#' set.
#'
#' @return A POSIXct date-time object.
#' @examples
#' try(last_update())
#' @export
last_update <- function() {

  # Endpoint: https://www.genenames.org/cgi-bin/statistics/symbol-reports-by-chromosome
  # This is an endpoint I found
  # https://www.genenames.org/download/statistics-and-files/ to be calling
  # behind the scenes that contains that last update date.
  #
  # The last update is provided
  # https://www.genenames.org/download/statistics-and-files/ but is dynamically
  # generated and only accessible through the browser, or using alternative
  # methods (e.g. V8).
  #
  # The approach taken also gets the job done and is simpler. We just have to be
  # vigilant in case this endpoint no longer works.
  #
  url <- 'https://www.genenames.org/cgi-bin/statistics/symbol-reports-by-chromosome'
  response <- readLines(url, warn = FALSE)

  pattern <- '\\{"date":"[^,]*",'
  m <- regexpr(pattern, response)
  date_time_json <- regmatches(response, m = m)

  date_time_txt <-
    date_time_json |>
    sub(pattern = '\\{"date":"',
        replacement = "",
        x = _) |>
    sub(pattern = '",',
        replacement = "",
        x = _)

  lubridate::parse_date_time(date_time_txt, 'dmy HMS')
}


