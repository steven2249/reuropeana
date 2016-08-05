#' Search the Europeana database.
#'
#' @export
#' @param query (character) Query string
#' @param profile (character) Profile parameter controls the format and richness of the response.
#' See Details.
#' @param qf (character) Facet filtering query. This parameter can be defined more than once.
#' @param reusability (character) Filter by copyright status. Possible values are 'open',
#' 'restricted' or 'permission', see http://labs.europeana.eu/api/search#reusability-parameter
#' @param media (character) Filter by records where an URL to the full media file is
#' present in the edm:isShownBy or edm:hasView metadata and is resolvable.
#' @param thumbnail (character) Filter by records where a thumbnail image has been generated
#' for any of the WebResource media resources (thumbnail available in the edmPreview field).
#' @param landingpage (character) Filter by records where the link to the original object on
#' the providers website (edm:isShownAt) is present and verified to be working.
#' @param colourpalette (character) Filter by images where one of the colours of an image
#' matches the provided colour code. You can provide this parameter multiple times, the
#' search will then do an 'AND' search on all the provided colours. See colour palette.
#' @param facet (character) Name of an individual facet. See individual facets.
#' @param limit (numeric) The number of records to return. Maximum is 100. Default: 10
#' @param start (numeric) The item in the search results to start with. The first item is 1.
#' Default: 1
#' @param sort (character) Sort by a field, e.g., \code{timestamp_update+desc}
#' @param key (character) API key for Europeana
#' @param ... Curl options passed on to \code{\link[httr]{GET}}
#' @param cursor (character) IGNORED FOR NOW, will add support later
#'
#' @details
#' Possible values of the profile parameter:
#' \itemize{
#'  \item minimal - Returns minimal set of metadata
#'  \item standard - TBD
#'  \item facets - Information about facets is added. For the records the Standard profile is used.
#'  \item breadcrumbs - information about the query is added in the form of breadcrumbs.
#'  \item portal - Standard, Facets, and Breadcrumb combined
#'  \item params - The header of the response will contain a params key, which lists the requested
#'  and default parameters of the API call.
#' }
#'
#' @examples \dontrun{
#' eu_search(query='Mona Lisa')
#' eu_search(query='who:"Leonardo da Vinci"')
#' eu_search(query='mona AND lisa')
#' out <- eu_search(query='Lasioglossum')
#' out$itemsCount
#' out$items[[6]]
#' library("httr")
#' GET(out$items[[6]]$link)
#' browseURL(out$items[[6]]$guid)
#'
#' # Using the profile parameter
#' eu_search(query='Mona Lisa', profile='minimal', limit=1)
#' eu_search(query='Mona Lisa', profile='standard', limit=1)
#' eu_search(query='Mona Lisa', profile='facets', limit=1)
#' eu_search(query='Mona Lisa', profile='breadcrumbs', limit=1)
#' eu_search(query='Mona Lisa', profile='portal', limit=1)
#' eu_search(query='Mona Lisa', profile='params', limit=1)
#'
#' # Range search
#' eu_search(query='[a TO b]', limit=3)
#'
#' # Time range search
#' eu_search(query='YEAR:[1525 TO 1527]', limit=3)
#'
#' # Date search
#' eu_search(query='timestamp_updated:"2013-03-16T20:26:27.168Z"')
#'
#' # Geographical bounding box search
#' eu_search(query='pl_wgs84_pos_lat:[45 TO 47] AND pl_wgs84_pos_long:[7 TO 8]', limit=3)
#'
#' # Using faceting via the qf parameter
#' out <- eu_search(query='Westminster', qf='where:London')
#' out$items[[1]]
#' ## objects containing the term Paris among images
#' eu_search(query='Paris', qf='TYPE:IMAGE')
#' ## objects containing the term Paris among images, with profile='facets'
#' eu_search(query='Paris', qf='TYPE:IMAGE', profile='facets')
#' ## objects containing the term Paris among objects described in French
#' eu_search(query='Paris', qf='LANGUAGE:FR')
#' ## objects dated by the year 1789
#' eu_search(query='Paris', qf='YEAR:1789')
#' ## objects provided by an institution based in France
#' eu_search(query='Paris', qf='COUNTRY:france')
#' ## objects protected by the Rights Reserved - Free Access licence
#' eu_search(query='Paris', qf='RIGHTS:http://www.europeana.eu/rights/rr-f/')
#' ## objects provided by the user community:
#' eu_search(query='Paris', qf='UGC:true')
#'
#' # reusability
#' eu_search(query = 'Paris', reusability = 'open')
#'
#' # find all records that are of Paris and have large images
#' eu_search(query = 'Paris', qf = 'IMAGE_SIZE:large')
#'
#' # query Paris, thumbnail image, mime type 'image/jpeg' & aspect ratio of 'landscape'
#' xx <- eu_search(query = 'Paris', thumbnail = TRUE,
#'    qf = list('MIME_TYPE:image%2Fjpeg', 'IMAGE_ASPECTRATIO:landscape'), config=verbose())
#'
#' # subject is opera & results are sound files with a long duration
#' eu_search(query = 'what:opera', qf = 'SOUND_DURATION:long', config=verbose())
#'
#' # records where one of the images has a (dominant) red colour
#' eu_search(query = '*:*', colourpalette = '%23FF0000', config=verbose())
#' }

eu_search <- function(query, profile = NULL, qf = NULL, reusability = NULL,
  media = NULL, thumbnail = NULL, landingpage = NULL, colourpalette = NULL,
  facet = NULL, sort = NULL, limit = 10, start = 1, cursor = NULL,
  key = getOption("eu_key"), ...) {

  args <- euc(list(query = query, profile = profile, reusability = reusability,
                   media = media, thumbnail = thumbnail,
                   landingpage = landingpage, colourpalette = colourpalette,
                   facet = facet, sort = sort, rows = limit, start = start,
                   wskey = key))

  # args that can be repeated
  todonames <- "qf"
  args <- c(args, collect_args(todonames))

  out <- eu_GET(file.path(eubase(), 'search.json'), args, ...)
  if ('error' %in% names(out)) {
    NA
  } else {
    out
  }
}
