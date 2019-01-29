pe <- function(x) {
  sapply(x, function(.x) {
    (sprintf("<html><body>%s</body></html>", .x) %>%
       xml2::read_html() %>%
       xml2::xml_text()) %||% NA_character_
  }, USE.NAMES = FALSE)
}

xt <- function(x, xpath) {
  (xml2::xml_find_first(x, xpath) %>% xml2::xml_text()) %||% NA_character_
}

xta <- function(x, xpath) {
  (xml2::xml_find_all(x, xpath) %>% xml2::xml_text()) %||% NA_character_
}

parse_feed <- function(x) {

  if (inherits(x, "response")) {
    x <- httr::content(x, as = "text")
    x <- xml2::read_xml(x)
  }

  x <- xml2::xml_ns_strip(x)

  xml2::xml_find_all(x, ".//item") %>%

    lapply(function(.x) {

      data.frame(
        key = "key",
        title = xt(.x, ".//title"),
        description = pe(xt(.x, ".//description")),
        traffic = xt(.x, ".//ht:approx_traffic"),
        link = xt(.x, ".//link"),
        pub_date = xt(.x, ".//pubDate"),
        picture = xt(.x, ".//ht:picture"),
        picture_source = xt(.x, ".//ht:picture_source"),
        stringsAsFactors = FALSE
      ) -> .y

      data.frame(
        key = "key",
        news_item_title = pe(xta(.x, ".//ht:news_item_title")),
        news_item_snippet = pe(xta(.x, ".//ht:news_item_snippet")),
        news_item_url = xta(.x, ".//ht:news_item_url"),
        news_item_source = pe(xta(.x, ".//ht:news_item_source")),
        stringsAsFactors = FALSE
      ) -> .z

      .y <- merge(.y, .z, by = "key", stringsAsFactors = FALSE)
      .y[["key"]] <- NULL

      .y

    }) -> out

  out <- do.call(rbind.data.frame, out)

  class(out) <- c("tbl_df", "tbl", "data.frame")

  out

}
