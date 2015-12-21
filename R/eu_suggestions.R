#' Get Europeana records
#'
#' DOESN"T WORK, THE SUGGESTIONS API SEEMS TO BE NOT WORKING
#'
#' @export
#' @param query (character) Query string
#' @param key (character) API key for Europeana
#' @param ... Curl options passed on to \code{\link[httr]{GET}}
#' @examples \dontrun{
#' eu_suggestions(query = "war")
#' }
eu_suggestions <- function(query, limit = 10, start = NULL, key = getOption("eu_key"), ...) {
  args <- euc(list(query = query, rows = limit, start = start, wskey = key))
  eu_GET(file.path(eubase(), 'suggestions.json'), args = args, ...)
}
