#' Custom Word Cloud with Color Palette
#'
#' This function generates a word cloud with a selected color palette.
#'
#' @param words Vector of words
#' @param freq Vector of frequencies
#' @param palette RColorBrewer palette (default is "Set3")
#' @return A word cloud plot
#' @export
custom_wordcloud <- function(words, freq, palette = "Set3") {
  if (!requireNamespace("RColorBrewer", quietly = TRUE)) {
    stop("RColorBrewer package is required.")
  }

  colors <- RColorBrewer::brewer.pal(min(length(freq), 8), palette)
  wordcloud::wordcloud(words, freq, colors = colors)
}
