#' @title Remove empty rows and/or columns from a data.frame.
#'
#' @description
#' Removes all rows and/or columns from a data.frame that are composed entirely of \code{NA} values.
#'
#' @param dat the input data.frame.
#' @param which one of "rows", "cols", or \code{c("rows", "cols")}
#' @return Returns the data.frame without its missing rows or columns.
#' @export
#' @examples
#' # not run:
#' # dat %>% remove_empty("rows")

remove_empty <- function(dat, which) {
  if (missing(which) ||
    sum(which %in% c("rows", "cols")) != length(which)) {
    stop("\"which\" must be one of \"rows\", \"cols\", or c(\"rows\", \"cols\")")
  }
  if ("rows" %in% which) {
    dat <- dat[rowSums(is.na(dat)) != ncol(dat), ]
  }
  if ("cols" %in% which) {
    dat <- dat[colSums(!is.na(dat)) > 0]
  }
  dat
}


### Deprecated separate functions

#' @title Removes empty rows from a data.frame.
#'
#' @description
#' This function is deprecated, use \code{remove_empty("rows")} instead.
#'
#' @param dat the input data.frame.
#' @return Returns the data.frame with no empty rows.
#' @export
#' @examples
#' # not run:
#' # dat %>% remove_empty_rows

remove_empty_rows <- function(dat) {
  .Deprecated("remove_empty(\"rows\")")
  remove_empty(dat, which = "rows")
}

#' @title Removes empty columns from a data.frame.
#'
#' @description
#' This function is deprecated, use \code{remove_empty("cols")} instead.
#'
#' @param dat the input data.frame.
#' @return Returns the data.frame with no empty columns.
#' @export
#' @examples
#' # not run:
#' # dat %>% remove_empty_cols
#'

remove_empty_cols <- function(dat) {
  .Deprecated("remove_empty(\"cols\")")
  remove_empty(dat, which = "cols")
}
