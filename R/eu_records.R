#' Get Europeana records
#'
#' @export
#' @param ids (character) Record ids
#' @param profile (character) Profile parameter controls the format and richness
#' of the response. One of full, similar, params.
#' @param hierarchy (character) One of 'self', 'parent', 'children', 'preceding-siblings',
#' 'following-siblings', or 'ancestor-self-siblings'
#' @param key (character) API key for Europeana
#' @param ... Curl options passed on to \code{\link[httr]{GET}}
#' @examples \dontrun{
#' eu_records('91916/C389BE4E26EC03D11E27C2F5D9CA209FD18D51EE')
#' eu_records('2020903/KMSB_37_106_7')
#' ids <- c('2020903/KMSB_37_106_7', '92099/BibliographicResource_2000081662431')
#' eu_records(ids)
#'
#' # profile param
#' id <- '91916/C389BE4E26EC03D11E27C2F5D9CA209FD18D51EE'
#' eu_records(id, profile = "full")
#' eu_records(id, profile = "similar")
#' eu_records(id, profile = "params")
#'
#' # should work even with ids that don't exist
#' eu_records(c('2020903/KMSB_37_106_7', 'notanid'))
#'
#' # hierarchy
#' eu_records(ids = '9200300/BibliographicResource_3000116310788', hierarchy = "parent")
#' ids <- c('9200300/BibliographicResource_3000116310788',
#'    '9200300/BibliographicResource_3000116311348')
#' eu_records(ids, hierarchy = "parent")
#' eu_records(ids, hierarchy = "children")
#' }
eu_records <- function(ids, profile = NULL, hierarchy = NULL, key = getOption("eu_key"), ...) {
  #urls <- file.path(eubase(), 'record', paste0(ids, '.json'))
  urls <- file.path(eubase(), 'record', ids)
  if (is.null(hierarchy)) {
    urls <- paste0(urls, '.json')
  } else {
    urls <- file.path(urls, paste0(hierarchy, '.json'))
  }
  out <- list()
  for (i in seq_along(urls)) {
    out[[i]] <- is_error(
      tryCatch(eu_GET(urls[i], args = list(wskey = key, profile = profile), ...),
               error = function(e) e)
    )
  }
  out
}
