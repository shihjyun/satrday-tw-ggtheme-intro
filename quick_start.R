library(ddplot)
library(ggplot2)
library(dplyr)


ggplot(mtcars, aes(mpg, wt)) + 
  geom_point(color = ddplot::dd_cols("pink500")) +
  labs(title = 'Satrsday 好棒棒！', 
       subtitle = '希望明年再辦一次') + 
  ddplot::dd_style()



ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +
  geom_point(size = 1) +
  labs(title="iris 資料集真的超讚",
       subtitle = "怎麼用都用不膩 XD",
       caption = "資料來源：Fisher, R. A. (1936) Annals of Eugenics, 7, Part II, 179–188.") +
  scale_color_dd(palette = "main5", manual.pick = c("pink500", "yellow500", "blue500")) +
  dd_style()
