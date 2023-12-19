
#GGplot

library(ggplot2)

mpg

ggplot(mpg, aes(x=displ, y=hwy)) +
  geom_point()

ggplot(mpg, aes(displ, hwy)) +
  geom_point()

ggplot(mpg, aes(displ, hwy, colour=class)) +
  geom_point()
head(mpg)

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour= "blue"))

ggplot(mpg, aes(displ, hwy)) +
  geom_point(colour= "blue")


ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  facet_wrap(~class)


ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth()

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(se=FALSE)

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(span=0.2)

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(span=1) #using method ='loess' and formula 'y ~ x'

library(mgcv)
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(method = "gam", formula = y~s(x))

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(method = "lm")


p <- ggplot(mpg, aes(drv, hwy)) +
  geom_point() 

p

p + geom_jitter()
p + geom_boxplot()
p + geom_violin()


ggplot(mpg, aes(hwy)) + geom_histogram()
ggplot(mpg, aes(hwy)) + geom_freqpoly(binwidth=1)


ggplot(mpg, aes(displ, colour = drv)) + 
  geom_histogram(binwidth = 0.5)+
  facet_wrap(~drv, ncol = 1)
  

ggplot(mpg, aes(manufacturer))+
  geom_bar()


drugs <- data.frame(
  drug = c ("a","b","c"),
  effect = c(4.2, 9.7, 6.1)
)
drugs

ggplot(drugs, aes(drug, effect)) +
  geom_bar(stat = "identity")

ggplot(drugs, aes(drug, effect)) +
  geom_point()



# time series -------------------------------------------------------------

head(economics)

ggplot(economics, aes(date, unemploy/pop))+
  geom_line()

ggplot(economics, aes(date, unemploy/pop))+
  geom_path()

ggplot(economics, aes(date, uempmed))+
  geom_line()


ggplot(economics, aes(unemploy/pop, uempmed))+
  geom_line()+
  geom_point()

ggplot(economics, aes(unemploy/pop, uempmed))+
  geom_path()+
  geom_point()


year <- function(x) as.POSIXlt$year + 1900

ggplot(economics, aes(unemploy/pop, uempmed))+
  geom_path(colour="grey50")+
  geom_point(aes(colour=year(date)))



ggplot(mpg, aes(cty, hwy))+
  geom_point(alpha=1/3)+
  xlab("city driving (mpg)")+
  ylab("highway driving")


ggplot(mpg, aes(cty, hwy))+
  geom_point(alpha=1/3)+
  xlab(NULL)+
  ylab(NULL)

ggplot(mpg, aes(drv, hwy))+
  geom_jitter(widht=0.25)


ggplot(mpg, aes(drv, hwy))+
  geom_jitter(widht=0.25)+
  xlim("f", "r")+
  ylim(20,30)


ggplot(mpg, aes(drv, hwy))+
  geom_jitter(widht=0.25)+
  xlim("f", "r")+
  ylim(NA,30)


p <- ggplot(mpg, aes(displ, hwy, colour=factor(cyl)))+
  geom_point()

p

print(p)

ggsave("plot.png", p, width = 5, height = 5)
?ggsave
summary(p)



# layers ------------------------------------------------------------------


library(tidyverse)
?mpg


ggplot(mpg, aes(displ, hwy, color=class))+
  geom_point()

ggplot(mpg, aes(displ, hwy, shape=class))+
  geom_point() #Warning messages:
              #1: The shape palette can deal with a maximum of 6 discrete values because more than 6
              #becomes difficult to discriminate; you have 7. Consider specifying shapes manually
              #if you must have them. 
              #2: Removed 62 rows containing missing values (`geom_point()`). 

ggplot(mpg, aes(displ, hwy, size=class))+
  geom_point() #Warning message: Using size for a discrete variable is not advised. 

ggplot(mpg, aes(displ, hwy, alpha=class))+
  geom_point() #Warning message: Using alpha for a discrete variable is not advised. 


# smooth ------------------------------------------------------------------

ggplot(mpg, aes(displ, hwy, linetype=drv))+
  geom_smooth()

ggplot(mpg, aes(displ, hwy, color=drv))+
  geom_point()+
  geom_smooth(aes(linetype=drv))
  

ggplot(mpg, aes(displ, hwy))+
  geom_smooth(aes(color=drv))

ggplot(mpg, aes(displ, hwy))+
  geom_smooth(aes(color=drv), show.legend = FALSE)

ggplot(mpg, aes(displ, hwy))+
  geom_point(aes(color=class))+
  geom_smooth()


ggplot(mpg, aes(displ, hwy))+
  geom_point()+
  geom_point(
    data = mpg |> filter(class=="2seater"),
    color = "red"
  )+
  geom_point(
    data = mpg |> filter(class=="2seater"),
    shape = "circle open", size = 3, color = "red"
  )


ggplot(mpg, aes(hwy))+
  geom_histogram(binwidth = 2)

ggplot(mpg, aes(hwy))+
  geom_density()

ggplot(mpg, aes(x=hwy))+
  geom_boxplot()

library(ggridges)

ggplot(mpg, aes(hwy, drv, fill= drv, color = drv))+
  geom_density_ridges(alpha=0.5, show.legend = FALSE)



# Facet -------------------------------------------------------------------

ggplot(mpg, aes(displ, hwy))+
  geom_point()+
  facet_wrap(drv~cyl)


ggplot(mpg, aes(displ, hwy))+
  geom_point()+
  facet_grid(drv~cyl)

ggplot(mpg, aes(displ, hwy))+
  geom_point()+
  facet_grid(drv~cyl, scales = "free_y")

head(diamonds)

ggplot(diamonds, aes(cut))+
  geom_bar()

diamonds |> 
  count(cut) |> 
  ggplot(aes(cut, y=n))+
  geom_bar(stat="identity")

ggplot(diamonds, aes(cut, y=after_stat(prop), group=1))+
  geom_bar()


ggplot(diamonds)+
  stat_summary(
    aes(cut, depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )



# Position Adjustments ----------------------------------------------------


ggplot(mpg, aes(drv, color=drv))+
  geom_bar()

ggplot(mpg, aes(drv, fill=drv))+
  geom_bar()

ggplot(mpg, aes(drv, fill=class))+
  geom_bar()

ggplot(mpg, aes(drv, fill=class))+
  geom_bar(alpha=1/5, position = "identity")

ggplot(mpg, aes(drv, color=class))+
  geom_bar(fill = NA, position = "identity")

ggplot(mpg, aes(drv, fill=class))+
  geom_bar(position = "fill")

ggplot(mpg, aes(drv, fill=class))+
  geom_bar(position = "dodge")


# EDA ---------------------------------------------------------------------


ggplot(diamonds, aes(carat))+
  geom_histogram(binwidth = 0.5)

smaller <- diamonds |>
  filter(carat <3)

ggplot(smaller, aes(carat))+
  geom_histogram(binwidth = 0.01)

ggplot(diamonds, aes(x=y))+
  geom_histogram(binwidth = 0.5)+
  coord_cartesian(ylim = c(0,50))

unusual <- diamonds |> 
  filter(y < 3 | y > 20) |> 
  select(price, x, y, z) |> 
  arrange(y)

unusual

?diamonds

diamonds2 <- diamonds |> 
  filter(between(y, 3, 20))

diamonds2 <- diamonds |> 
  mutate(y = if_else(y < 3 | y > 20, NA, y))

ggplot(diamonds2, aes(x= x, y= y))+
  geom_point(na.rm =TRUE)

library(nycflights13)

head(flights)

flights |> 
  mutate(
    cancelled = is.na(dep_time),
    sched_hour = sched_dep_time %/% 100,
    sched_min = sched_dep_time %% 100,
    sched_dep_time = (sched_hour + sched_min/60)
  ) |> 
  ggplot(aes(x=sched_dep_time))+
  geom_freqpoly(aes(color=cancelled), binwidth=1/4)


ggplot(diamonds, aes(x=price))+
  geom_freqpoly(aes(color=cut), binwidth = 500,
                linewidth=0.75)

ggplot(diamonds, aes(x=price, y=after_stat(density)))+
  geom_freqpoly(aes(color=cut), binwidth = 500,
                linewidth=0.75)

ggplot(diamonds, aes(cut, price))+
  geom_boxplot()

ggplot(mpg, aes(class, hwy))+
  geom_boxplot()

ggplot(mpg, aes(x = fct_reorder(class, hwy, median), y=hwy))+
  geom_boxplot()

ggplot(mpg, aes(y = fct_reorder(class, hwy, median), x=hwy))+
  geom_boxplot()

?mpg


# two categorical variable ------------------------------------------------


ggplot(diamonds, aes(cut, color))+
  geom_count()

diamonds |> 
  count(color, cut) |> 
  ggplot(aes(color, cut))+
  geom_tile(aes(fill=n))

d <- ggplot(smaller, aes(carat, price))+
  geom_point(alpha=1/100)

ggsave("plot2.png", d, width = 5, height = 5)


ggplot(smaller, aes(carat, price))+
  geom_bin2d()

ggplot(smaller, aes(carat, price))+
  geom_hex()

ggplot(smaller, aes(carat, price))+
  geom_boxplot(aes(group=cut_width(carat, 0.1)))

library(tidymodels)
intall.packages("tidymodels")
