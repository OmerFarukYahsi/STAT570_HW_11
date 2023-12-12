
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





