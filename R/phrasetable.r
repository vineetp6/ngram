tablesort <- function(df, sortby.colnum)
{
  if (!is.data.frame(df))
    stop("argument 'df' must be a dataframe")
  
  col <- as.integer(sortby.colnum)
  if (is.na(col))
    stop("argument 'sortby.colnum' must be an integer")
  if (col < 1 || col > ncol(df))
    stop("argument 'sortby.column' must be between 1 and ncol(df)")
  
  df[order(-df[, col]), ]
}


#' Get Phrasetable
#' 
#' Get a table
#' 
#' @param ng
#' An ngram object.
#' 
#' 
#' @examples
#' \dontrun{
#' library(ngram)
#' 
#' str <- "A B A C A B B"
#' ng <- ngram(str)
#' get.phrasetable(ng)
#' }
#' 
#' @include ngram.r
#' @seealso \code{\link{ngram-class}}
#' @export
get.phrasetable <- function(ng)
{
  if (class(ng) != "ngram")
    stop("argument 'ng' not of class 'ngram'")
  
  ret <- as.data.frame(.Call(R_ng_get_phrasetable, ng@ngl_ptr, ng@ngsize))
  tablesort(ret, 2)
}
