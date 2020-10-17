library(ggplot2)
library(gtable)
library(grid)
library(bbplot)
library(ddplot)
library(dplyr)

# grid demo
circleGrob(
  x = 0.5,
  y = 0.5,
  r = 0.1,
  gp = gpar(col = "gray")
) %>%
  grid.draw()



rectGrob(x = 0.5, y = 0.5, width = 0.8, height = 0.3) %>% 
  grid.draw()


vp <- viewport(x = 0.5, y = 0.5, 
                  height = 0.8, width = 0.8,
                  xscale = c(0, 100), yscale = c(0, 10))

pushViewport(vp)
grid.draw(rectGrob())

grid.draw(circleGrob(x = unit(70, "native"), y = unit(5, "native"),
                     r = 0.1, gp = gpar(fill = "lightblue")))
grid.draw(circleGrob(x = unit(85, "native"), y = unit(8, "native"),
                     r = 0.1, gp = gpar(fill = "darkred")))

# lollipop
candy <- circleGrob(r = 0.1, x = 0.5, y = 0.6, gp = gpar(fill = "pink"))
stick <- segmentsGrob(x0 = 0.5, x1 = 0.5, y0 = 0, y1 = 0.5)
lollipop <- gTree(children = gList(candy, stick))
grid.draw(lollipop)


# gtable demo
p <- ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  labs(title = "Fuel economy declines as weight increases")

p

high_level_grob <- ggplot2::ggplotGrob(p)
print(high_level_grob)
