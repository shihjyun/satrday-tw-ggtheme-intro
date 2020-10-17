library(scales)
# the colors we maybe need to use
dd_colors <- c(
  `green500` = '#0b967d',
  `green400` = '#55ab96',
  `green300` = '#82c0af',
  `green200` = '#acd5c9',
  `green100` = '#d6eae4',
  `blue500` = '#1f85ad',
  `blue400` = '#5d9cbd',
  `blue300` = '#89b4cd',
  `blue200` = '#b1cdde',
  `blue100` = '#d8e6ee',
  `orange500` = '#cc6525',
  `orange400` = '#dc8350',
  `orange300` = '#e9a27a',
  `orange200` = '#f4c0a5',
  `orange100` = '#fbdfd1',
  `yellow500` = '#dbad29',
  `yellow400` = '#e6bd5a',
  `yellow300` = '#f0cd84',
  `yellow200` = '#f7ddac',
  `yellow100` = '#fceed5',
  `pink500` = '#f25e86',
  `pink400` = '#f9829d',
  `pink300` = '#fea2b4',
  `pink200` = '#ffc2cd',
  `pink100` = '#ffe1e6',
  `black500` = '#24201f',
  `black400` = '#4e4948',
  `black300` = '#7b7675',
  `black200` = '#aca7a6',
  `black100` = '#e0dbd9')

# color picker
dd_cols <- function(...) {
  cols <- c(...)
  
  if (is.null(cols))
    return (dd_colors)
  
  dd_colors[cols]
}
dd_cols(1:100) %>% show_col()


# dd palettes
dd_palettes <- list(
  `main5`  = dd_cols("green500",  "blue500","orange500", "yellow500", "pink500"),
  `category5`  = dd_cols("green500", "green200", "blue300", "yellow300", "orange400"),
  `green5` = dd_cols("green500", "green400", "green300", "green200", "green100"),
  `blue5` = dd_cols("blue500", "blue400", "blue300", "blue200", "blue100"),
  `orange5` = dd_cols("orange500", "orange400", "orange300", "orange200", "orange100"),
  `yellow5` = dd_cols("yellow500", "yellow400", "yellow300", "yellow200", "yellow100"),
  `pink5` = dd_cols("pink500", "pink400", "pink300", "pink200", "pink100"),
  `black5` = dd_cols("black500", "black400", "black300", "black200", "black100")
)


# palettes selector
dd_pal <- function(palette = "main5", manual.pick = NULL,  reverse = FALSE,...) {
  stopifnot()
  
  if (is.null(manual.pick)) {
    
    pal <- dd_palettes[[palette]]
    
  } else {
    
    selected_colors <- manual.pick
    if (anyNA(dd_palettes[[palette]][selected_colors])) {
      stop(paste0('Your selected colors do not exist in ', palette, ' palette.'))
    }
    pal <- dd_palettes[[palette]][selected_colors]
  }
  
  if (reverse) pal <- rev(pal)
  
  colorRampPalette(pal, ...)
}

dd_pal('main5')(10)
col()

# work with ggplot2
scale_color_dd <- function(palette = "main5", manual.pick = NULL,  discrete = TRUE, reverse = FALSE, ...) {
  pal <- dd_pal(palette = palette, manual.pick = manual.pick, reverse = reverse)
  
  if (discrete) {
    discrete_scale("colour", paste0("dd_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}


scale_fill_dd <- function(palette = "main5", manual.pick = NULL,  discrete = TRUE, reverse = FALSE, ...) {
  pal <- dd_pal(palette = palette, manual.pick = manual.pick, reverse = reverse)
  
  if (discrete) {
    discrete_scale("fill", paste0("dd_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}