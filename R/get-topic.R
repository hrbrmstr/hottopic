#' Retrieve Hot Topics (Trends) for a Given Country
#'
#' @param country_name The country name (see [topic_countries()])
#' @return data frame
#' @export
#' @examples
#' x <- get_topic()
get_topic <- function(country = "United States") {

  if (!(country %in% names(.topic_ccs))) {
    stop("Unknown/unsupported country.", call.=FALSE)
  }

  httr::GET(
    url = .topic_url,
    .hottopic_ua,
    query = list(
      pn = .topic_ccs[[country]] %||% "p1"
    )
  ) -> res

  httr::stop_for_status(res)

  out <- parse_feed(res)

  out

}

#' Return a character vector of supported countries
#'
#' Use a regular expression in `pattern` to filter the list.
#'
#' @param pattern a valid regular expression used to filter the list
#' @return character vector
#' @export
#' @examples
#' head(topic_countries())
topic_countries <- function() {
  return(sort(names(.topic_ccs)))
}