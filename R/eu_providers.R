#' Search Europeana data providers.
#'
#' @export
#'
#' @param providerid Provider ID
#' @param datasetid Dataset ID
#' @param datasets (logical) Whether to return datasets or not with provider information. Ignored
#' when providerid is NULL (the default for that parameter).
#' @param start (numeric) Record number to start with.
#' @param limit	(numeric) Size of the result set to fetch.
#' @param country_code (character) Two-letter ISO 3166-1 country code. Not all countries give data
#' back of course, for example, there is no data for country_code='US'.
#' @param key Your Europeana API key.
#' @param callopts Curl options passed on to httr::GET, see examples
#' @examples \dontrun{
#' eu_providers(limit=1)
#' eu_providers(limit=1, start=3)
#' out <- eu_providers(limit=3)
#' out$meta
#' out$items
#' eu_providers(start=3)
#' eu_providers(providerid=20239)
#' eu_providers(providerid=20239, datasets=TRUE)
#' eu_providers(datasetid=2023901)
#' identical(eu_providers(providerid=20239, datasets=TRUE)$items,
#'    eu_providers(datasetid=2023901)$items)
#'
#' # Country codes
#' out <- eu_providers(country_code='UK')
#' sapply(out$items, "[[", "country") # check that all country fields are UK
#'
#' # Curl debugging
#' library("httr")
#' eu_providers(limit=1, config=verbose())
#' }

eu_providers <- function(providerid = NULL, datasetid = NULL, datasets = FALSE, start = NULL,
  limit = 10, country_code = NULL, key = getOption("eu_key"), ...)
{
  stopifnot(if(!is.null(providerid)) is.null(datasetid) else TRUE)
  stopifnot(if(!is.null(datasetid)) is.null(providerid) else TRUE)

  url <- paste0(eubase(), 'providers.json')
  if(!is.null(providerid)){
    if(datasets){
      url <- sprintf('%sprovider/%s/datasets.json', eubase(), providerid)
    } else {
      url <- sprintf('%sprovider/%s.json', eubase(), providerid)
    }
  }
  if(!is.null(datasetid)) url <- sprintf('%s/dataset/%s.json', eubase(), datasetid)

  args <- euc(list(wskey=key, countryCode=country_code, offset=start, pagesize=limit))
  out <- eu_GET(url, args, ...)
  list(meta=out[ !names(out) %in% "items" ], items=out$items)
}
