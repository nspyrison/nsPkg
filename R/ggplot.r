#' Theme ns
#' 
#' A ggplot2 theme suggested for linear projections with spinifex
#' 
#' @param ... Optionally pass arguments to `ggplot2::theme()`.
#' @seealso \code{\link[ggplot2:theme]{ggplot2::theme}} for all theme options.
#' @export
#' @import ggplot2
#' @examples
#' require("ggplot2")
#' require("patchwork")
#' 
#' g <- ggplot(mtcars, aes(wt, mpg, color = factor(cyl))) +
#'   geom_point()
#' g + labs(title="default") +
#'   (g + theme_ns() + labs(title="theme_ns"))
theme_ns <- function() {
  list(
    ggplot2::theme_bw(),
    ggplot2::theme(
      # Margins
      plot.margin      = margin(rep(1, 4), "pt"),
      legend.margin    = margin(rep(1, 4), "pt"),
      panel.spacing    = unit(1, "points"), ## Facet strip spacing
      strip.background =                 ## Facet strip size/color
        element_rect(size = .4, color = "grey20", fill = "grey90"),
      # Text
      axis.title.x = element_text(size = 12, face = "bold"),
      axis.title.y = element_text(size = 12, face = "bold"),
      axis.text.x  = element_text(size = 10),
      axis.text.y  = element_text(size = 10),
      legend.title = ggplot2::element_text(size = 10, face = "bold"),
      legend.text  = ggplot2::element_text(size = 10),
      # Legend
      legend.position  = "bottom",
      legend.direction = "horizontal", ## Levels within an aesthetic
      legend.box       = "vertical",   ## Between aesthetics
    ),
    ggplot2::scale_color_brewer(palette = "Dark2"),
    ggplot2::scale_fill_brewer(palette = "Dark2")
  )
}


#' Set default color & fill for discrete variables
#' 
#' Masks ggplot2's default color/fill color palette for discrete variables.
#' 
#' @param ... Passes arguments to ggplot2::scale_colour/fill_brewer.
#' @export
scale_colour_discrete <- function(...){
  ggplot2::scale_colour_brewer(..., palette = "Dark2")
}
#' @rdname scale_colour_discrete
#' @export
scale_fill_discrete <- function(...){
  ggplot2::scale_fill_brewer(..., palette = "Dark2")
}