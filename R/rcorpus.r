#' Random Corpus
#' 
#' Generate a corpus of random "words".
#' 
#' @param nwords
#' Number of words to generate.
#' @param minwordlen,maxwordlen
#' The min/max length of words in the generated corpus.
#' 
#' @return
#' A string.
#' 
#' @examples
#' rcorpus(10)
#' 
#' @importFrom stats runif
#' 
#' @export
rcorpus <- function(nwords, minwordlen=1, maxwordlen=6)
{
  if (minwordlen < 1)
    stop("Argument 'minwordlen' must be at least 1.")
  if (minwordlen > maxwordlen)
    stop("Argument 'maxwordlen' must be at least 'minwordlen'.")
  
  sizes <- as.integer(runif(nwords, minwordlen, maxwordlen+1))
  words <- sapply(sizes, function(size) paste0(sample(letters, size=size, replace=TRUE), collapse=""))
  
  paste0(words, collapse=" ")
}
