check_response <- function(x) {
  if (!x$status_code == 200) {
    txt <- contutf8(x)
    if (is(txt, "character")) {
      stop(http_status(tt)$message, call. = FALSE)
    }
    stnames <- names(jsonlite::fromJSON(txt, FALSE))
    if (!is.null(stnames)) {
      if ('error' %in% stnames) {
        warning(sprintf("Error: (%s) - %s",
                        x$status_code,
                        jsonlite::fromJSON(contutf8(x), FALSE)$error), call. = FALSE)
      } else {
        warning(sprintf("Error: (%s)", x$status_code), call. = FALSE)
      }
    } else {
      warn_for_status(x)
    }
  } else {
    return( x )
  }
}

eu_GET <- function(url, args, ...) {
  tt <- GET(url, query = args, ...)
  check_response(tt)
  stopifnot(tt$headers$`content-type` == "application/json;charset=UTF-8")
  res <- contutf8(tt)
  jsonlite::fromJSON(res, FALSE)
}

eubase <- function() 'http://europeana.eu/api/v2'

euc <- function(l) Filter(Negate(is.null), l)

contutf8 <- function(x) content(x, "text", encoding = "UTF-8")

is_error <- function(x) {
  if (is(x, "error")) {
    NULL
  } else {
    x
  }
}
