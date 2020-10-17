p <- ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  labs(title = "Satrdays 讚讚",
       subtitle = "great job!") + 
  satrdays_style()




# finalise ----------------------------------------------------------------

raw_logo <- png::readPNG('satrdatys.png')
grid_logo_test <- grid::rasterGrob(raw_logo, width = unit(0.8, 'inches'), x = 0.9)
grid.draw(grid_logo_test)


p_ggplotGrob <- ggplot2::ggplotGrob(p)
# adjust logo's position
logo_t <- max(p_ggplotGrob$layout$t)
logo_l <- max(p_ggplotGrob$layout$l)
# adjust title, subtitle, caption position
if (!identical(p_ggplotGrob$layout[p_ggplotGrob$layout$name %in% c('caption', 'title', 'subtitle'),], numeric(0))) {
  p_ggplotGrob$layout[p_ggplotGrob$layout$name %in% c('caption', 'title', 'subtitle'),]$l = 2
}

finalise_plot <-
  ggplotify::as.ggplot(
    gtable::gtable_add_grob(
      p_ggplotGrob,
      grid_logo_test,
      logo_t,
      1,
      logo_t,
      logo_l,
      z = Inf,
      clip = "off",
      name = 'logo'
    )
  )
grid.draw(finalise_plot)
