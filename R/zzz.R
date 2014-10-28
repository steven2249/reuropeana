#' Check response from web, and catch and give errors to the user.
#' @keywords internal
check_response <- function(x){
  if(!x$status_code == 200){
    stnames <- names(content(x))
    if(!is.null(stnames)){
      if('error' %in% stnames){
        warning(sprintf("Error: (%s) - %s", x$status_code, content(x)$error))
      } else { warning(sprintf("Error: (%s)", x$status_code)) }
    } else { warn_for_status(x) }
  } else { return( x )  }
}

eu_GET <- function(url, args, ...){
  tt <- GET(url, query=args, ...)
  check_response(tt)
  stopifnot(tt$headers$`content-type` == "application/json;charset=UTF-8")
  res <- content(tt, as = "text")
  jsonlite::fromJSON(res, FALSE)
}

eubase <- function() 'http://europeana.eu/api/v2/'

euc <- function (l) Filter(Negate(is.null), l)
