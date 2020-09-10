## | Introduction to R  
## | A Quick Tour

options(width = 60)
cols <- rainbow(100)


## Introduction
library(MASS)
library(lattice)
library(ggplot2)
library(Hmisc)
library(tidyr)
library(GGally)

## Probability

(Probs <- round(dbinom(0:10,10,0.4),3))
(data.frame(Number = factor(0:10),Probs = Probs))
plot(dbinom(0:10,10,0.4),type="h", 
     xlab="Number of female birds",col=cols[70],
     ylab="Probability", lwd=8, lend=2, 
     main= 'Probability Function')
abline (h=0, col='red')

pbinom(3,10,0.4,lower.tail=T)

plot(0:10,pbinom(0:10,10,0.4), 
     xlab="Number of female birds", 
     ylab="Probability", pch=20,col=cols[1], cex=2,
     main='Probability Distribution Function') 
lines(0:10,pbinom(0:10,10,0.4), type='s')

## Probability
# Using Shiny we can plot an interactive graph for the
# binomial distribution in which we can set values for
# the two parameters for the distribution, $n$ and $p$.
#We can explore their effect on the distribution.

# These apps will not run from this window.
# shinyAppFile("ShinyApps/Binomial/app.R",
#                   options = list(
#                   width = "100%", height = 550 
#                   )
#             )

# shinyAppFile("ShinyApps/Poisson/app.R", 
#                       options = list(
#                        width = "100%", height = 550
#                         ) 
#             )

# shinyAppFile("ShinyApps/Normal/app.R",
#                     options = list(
#                         width = "100%", height = 550 
#                                   )
#             )


## Simulation
  
set.seed(345678)
nn <- 20
spl.1 <- rnorm(nn)
spl.2 <- rnorm(nn)
cor(spl.1,spl.2)

cor.test(spl.1,spl.2)

plot(spl.1,spl.2,pch=20,xlab='Sample 1', 
     ylab='Sample 2', cex=1.5, 
     col = cols[95])
abline(h=0, lty=2)
abline(v=0, lty=2)
title(paste("r =", round(cor(spl.1, spl.2), 3)))


normal.df <- data.frame(Value = c(spl.1,spl.2), 
                Sample = factor(c(rep(1,nn),rep(2,nn))))
plot(Value ~ Sample, data = normal.df)
points(Value ~ jitter(as.numeric(Sample),0.2), 
       data = normal.df, pch = 16, 
       col = cols[c(55,65)][as.numeric(Sample)])



plot(Value ~ jitter(as.numeric(Sample),0.25), 
     data = normal.df, type = 'p',
     xlim = c(0.5, 2.5), pch = 16, 
     col = cols[as.numeric(Sample)*10+45],
     xlab='Sample')
means <- with(normal.df, 
              tapply(Value, Sample, smean.sdl, mult = 1))
points(1:2, c(means[[1]][1],means[[2]][1]), 
       cex = 2, col = cols[c(55,65)], pch = 16)
segments(1,means[[1]][2],1,means[[1]][3], 
         col = cols[55], lwd = 2)
segments(2,means[[2]][2],2,means[[2]][3], 
         col = cols[65], lwd = 2)



cor.2 <- function(nn){ 
   spl.1 <- rnorm(nn)  
   spl.2 <- rnorm(nn)  
   cor(spl.1,spl.2) }  
size <- 1000; results <- numeric(size)
for (i in 1:size)
   {results[i] <- cor.2(20)}
hist(results, xlab="correlation", 
     main = "Correlation Coefficient", col='lightblue')
(paste("5% of the samples have correlation less than ",
       round(sort(results)[size/20], 3)))
abline(v=round(sort(results)[size/20], 3),
       col='red',lwd=2)
text(-0.5,100,'5% ')
text(-0.5,115,round(sort(results)[size/20], 3))
(paste("5% of the samples have correlation bigger than ",
       round(sort(results)[size - size/20], 3)))
abline(v=round(sort(results)[size - size/20], 3), 
       col='red',lwd=2)
text(0.5,100,'95% ')
text(0.5,115,round(sort(results)[size - size/20], 3))


paste('The maximum value was', round(max(results),3),
      ' and the minimum was', round(min(results),3))


# Exploratory Data Analysis
## Data Analysis


data(iris)
help(iris)
str(iris)


options(width = 90)
head(iris, 4)
summary(iris)


## Data Analysis
options(width = 90)
psych::describe(iris)
options(width = 60)


par(mfrow=c(2,2))
truehist(iris$Petal.Length, nbins=12, 
         xlab = 'Petal Length')
truehist(iris$Petal.Width, nbins=12, 
         xlab = 'Petal Width')
truehist(iris$Sepal.Length, nbins=12, 
         xlab = 'Sepal Length')
truehist(iris$Sepal.Width, nbins =12, 
         xlab = 'Sepal Width')



PL.set <- subset(iris,Species == 'setosa',Petal.Length)
PL.ver <- subset(iris,Species == 'versicolor',
                 Petal.Length)
PL.vir <- subset(iris,Species == 'virginica',
                 Petal.Length)
par(mfrow = c(3,1))
truehist(PL.set$Petal.Length, nbins = 10, 
         xlim = c(0,8), xlab='Petal Length',
         main = 'Setosa')
truehist(PL.ver$Petal.Length, nbins = 10, 
         xlim = c(0,8), xlab='Petal Length',
         main = 'Versicolor')
truehist(PL.vir$Petal.Length, nbins = 10, 
         xlim = c(0,8), xlab='Petal Length',
         main = 'Virginica')
par(mfrow = c(1,1))

boxplot(Petal.Length ~ Species, data = iris)
points(Petal.Length ~ jitter(as.numeric(Species),0.2), 
       data = iris, pch=16, 
       col = cols[as.numeric(Species)*20+15])


iris.tidy <- iris %>%
  gather(key, Value, -Species) %>%
  separate(key, c("Part", "Measure"), "\\.")
ggplot(iris.tidy,aes(x = Species,y = Value,col = Part)) +
  geom_jitter() +
  facet_grid(. ~ Measure)


plot(Petal.Width ~ Petal.Length,pch=20, 
     data = iris, col = cols[3])


# attach(iris)
# plot(Petal.Width ~ Petal.Length, pch=20, 
#      data = iris, cex=1.2, 
#      xlab='Petal length (cm.)',
#      ylab='Petal width (cm.)', 
#      main='Anderson`s Iris Data',
#      col = cols[c(40,55,70)][as.numeric(Species)])
# text(1,2.4, 'Three species of Iris', pos=4, 
#      col='navyblue')
# legend(1,2.4,levels(Species), pch=20, 
#        bty='n', col=cols[c(40,55,70)])


attach(iris)
plot(Petal.Width ~ Petal.Length, pch=20, 
     data = iris, cex=1.2, 
     xlab='Petal length (cm.)',
     ylab='Petal width (cm.)', 
     main='Anderson`s Iris Data',
     col = cols[c(40,55,70)][as.numeric(Species)])

abline(v=mean(Petal.Length), lty=2, col='red')
abline(h=mean(Petal.Width), lty=2, col='red')
abline(v=median(Petal.Length), lty=2, col='blue')
abline(h=median(Petal.Width), lty=2, col='blue')
grid()

points(mean(Petal.Length),mean(Petal.Width), cex=2,
       pch=23,col='black',bg='red')
points(median(Petal.Length),median(Petal.Width), cex=2,
       pch=23,col='black',bg='blue')
title(sub='Centroids: mean (red) and median (blue)')

text(1,2.4, 'Three species of Iris', 
     pos=4, col='navyblue')
legend(1,2.4,levels(Species), pch=20, bty='n',
   col=c('slateblue', 'firebrick', 'darkolivegreen'))

abline(lm(Petal.Width ~ Petal.Length),
       lty='longdash',col=2)
abline(lqs(Petal.Width ~ Petal.Length),
       lty = 2,col='blue')








stars(iris[,1:4], key.loc=c(25,20), nrow=6,len=2,
      main= 'Star plots for individual plants',
      col.stars=as.numeric(Species))

  
  

  
  
  
  
  
  
  
data(volcano)
wireframe(volcano, shade=TRUE, aspect=c(61/87, 0.4), 
          ligth.source = c(10,0,10), 
          zoom=1.1, box=F, scales=list(draw=F), 
          xlab='', ylab='', zlab='',
          main='Maunga Whau Volcano, Auckland')
levelplot(volcano, col.regions=gray(0:16/16), 
          main='Maunga Whau Volcano, Auckland')
sub='Level Plot'

contourplot(volcano, at=seq(floor(min(volcano)/10)*10, 
                  ceiling(max(volcano)/10)*10, by=10),
            main='Maunga Whau Volcano, Auckland', 
            sub='Contour Plot', region=T,
            col.regions=terrain.colors(100))


rang <- seq(-3,3,by =0.2)
rand.1 <- dnorm(rang, 0, 0.5)
rand.2 <- dnorm(rang, 0, 1.4)
mesh <-  outer(rand.1, rand.2, function(x,y) x*y)
par(mfrow=c(1,2))
persp(rang, rang, mesh, phi=20, theta=30, expand =0.8,
      xlab="N(0,0.5)",ylab="N(0,1.4)", zlab="Density",
      main="Bivariate Normal Distribution", 
      border = 'red',
      ltheta=30,lphi = 20,cex.main=0.8, cex.lab=0.8)
persp(rang, rang, mesh, phi=20, theta=125, expand =0.8,
      xlab="N(0,0.5)",ylab="N(0,1.4)", zlab="Density",
      main="Bivariate Normal Distribution",
      col='lightblue',
      box=FALSE, border = 'blue', cex.main=0.8)
par(mfrow = c(1,1))

cloud(Sepal.Length ~ Petal.Length * Petal.Width, 
      group=Species, data=iris, pch=20,
      main='Anderson`s Iris Data, All Species', 
      screen=list(z=30, x=-60))

  
## Principal Components
pca <- prcomp(iris[,1:4],scale=T)
summary(pca)

screeplot(pca, col = 'azure2')

pca$rotation
biplot(pca,cex=0.5)


plot(pca$x[,1:2],col= as.numeric(Species)+1, pch=16)
legend('bottom',c('setosa','versicolor','virginica'), 
       col = c(2,3,4), pch = 16, horiz = T, cex = .7)



## Modeling
par(mfrow=c(1,1))
plot(Petal.Length ~ Sepal.Length, data = iris,
     col=as.numeric(Species),pch=20)
legend('topleft',legend=unique(iris$Species),
     col=as.numeric(unique(iris$Species)),
     pch=rep(20,3))

model0 <- lm(Petal.Length ~ Sepal.Length, data=iris)
summary(model0)


plot(residuals(model0) ~ fitted(model0), 
     xlab = 'Fitted values',
     col=as.numeric(iris$Species)+1,pch=20, 
     ylab = 'Residuals')
abline(h=0,lwd=2)
legend('bottomright',legend=unique(iris$Species),
       col=as.numeric(unique(iris$Species))+1,
       pch=rep(20,3))


options(width = 80)
model1 <- lm(Petal.Length ~ Sepal.Length * Species, 
             data=iris)
summary(model1)

plot(residuals(model1) ~ fitted(model1), 
     xlab = 'Fitted values',
    col=as.numeric(iris$Species),pch=20,
    ylim=c(-1,1), ylab = 'Residuals') 
abline(h=0)
legend('bottom',legend=unique(iris$Species), 
      col=as.numeric(unique(iris$Species)), 
      pch=rep(20,3),horiz = TRUE,cex=0.75) 

anova(model0,model1)


## Graphing with `ggplot2`
ggplot(iris, aes(x=Sepal.Length,y=Petal.Length))+
  geom_point() +
  geom_smooth(method = lm, se=FALSE)

ggplot(iris, aes(x=Sepal.Length,y=Petal.Length, 
                 color=Species))+
  geom_point() +
  geom_smooth(method = lm, se=FALSE)

ggplot(iris, aes(x=Sepal.Length,y=Petal.Length, 
                 color=Species))+
  geom_point() +
  geom_smooth(method = lm, se=FALSE) + ylim(1, 6.9) +
  stat_smooth(method = "lm", se = FALSE, aes(group=1,
                                             col='All')) 

ggplot(iris, aes(x=Sepal.Length,y=Petal.Length, 
                 color=Species))+
  geom_point() +
  geom_smooth(se=FALSE) +
  stat_smooth(se = FALSE, aes(group=1, col='All'))


sepal.v <- iris$Sepal.Length[iris$Species == "versicolor"]
par(mfrow=c(1,2))
hist(sepal.v, breaks=6, xlab="Sepal Length", 
     main="Iris versicolor", col='azure3', freq = F)
curve(dnorm(x,mean(sepal.v),sd(sepal.v)),4.5,7,
      add = TRUE, col = 'blue', lwd = 2)
lines(density(sepal.v), col = 'red3', lwd = 2)
qqnorm(sepal.v); qqline(sepal.v)

shapiro.test(sepal.v)


iris.ver <- subset(iris, Species=='versicolor')
xx <-  seq(4.2,7.8,length.out = 200)
data.norm <- data.frame(xx=xx,
      yy=dnorm(xx,mean(iris.ver$Sepal.Length), 
               sd=sd(iris.ver$Sepal.Length)))
ggplot(iris.ver, aes(x=Sepal.Length, y=stat(density)))+
  geom_histogram(breaks = 9:14/2, fill= 'cadetblue2') +
  geom_density(lwd=2, col='blue') + xlim(4.2,7.8) +
  geom_line(data=data.norm, aes(x=xx, y=yy), 
            col='coral', lwd=2)




par(mfrow=c(1,1))
sepal.v.2 <- sort(rnorm(length(sepal.v), 
                        mean(iris.ver$Sepal.Length),
     sd=sd(iris.ver$Sepal.Length)))
petals.2 <- predict(model1, 
                    data.frame(Sepal.Length = sepal.v.2,
     Species = "versicolor"),interval = 'prediction', 
     level=0.9)
plot(sepal.v.2,petals.2[,'fit'], type='l',col='blue',
     lwd=1.5,xlab='Simulated sepal length',
     ylab='Predicted petal length', 
     main='Iris versicolor')
lines(sepal.v.2,petals.2[,'lwr'], col='red', lty=2)
lines(sepal.v.2,petals.2[,'upr'], col='red', lty=2)
points(sepal.v, 
       iris$Petal.Length[iris$Species == 'versicolor'],
       pch=20)
rug(sepal.v.2); rug(petals.2[,1],side=2)



sepal.v.2 <- sort(rnorm(5,
                        mean(iris.ver$Sepal.Length),
                        sd=sd(iris.ver$Sepal.Length)))
petals.2 <- predict(model1, 
                    data.frame(Sepal.Length = sepal.v.2,      
                    Species = "versicolor"),
                    interval = 'prediction',
                    level=0.9)
plot(Petal.Length ~ Sepal.Length, data = iris.ver, 
     pch = 16, col = cols[10])
points(sepal.v.2, petals.2[,'fit'], pch = 16, 
       col = cols[70])

## Prediction

plot(Petal.Length ~ Sepal.Length, data = iris.ver, 
     pch = 16, col = cols[10])
points(sepal.v.2, petals.2[,'fit'], pch = 16, 
       col = cols[70])

model2 <- lm(Petal.Length ~ Sepal.Length, 
             data = iris.ver)
abline(reg = model2, col = cols[70])
rug(sepal.v.2, lwd = 2)
rug(petals.2[,1],side=2, lwd = 2)

## rgl

library(rgl)
x <- iris$Sepal.Length
y <- iris$Petal.Length
z <- iris$Sepal.Width

rgl.open() # Open a new RGL device
rgl.points(x, y, z, color ="lightgray") # Scatter plot

rgl.bg(color = "white") # Setup the background color
rgl.points(x, y, z, color = "blue", 
           pch = 16, size = 5) # Scatter plot

get_colors <- function(groups, group.col = palette()){
  groups <- as.factor(groups)
  ngrps <- length(levels(groups))
  if(ngrps > length(group.col)) 
    group.col <- rep(group.col, ngrps)
  color <- group.col[as.numeric(groups)]
  names(color) <- as.vector(groups)
  return(color)
}
## Change colors by groups :
rgl.open() # Open a new RGL device
rgl.bg(color = "white") # Setup the background color

rgl.points(x, y, z, color = get_colors(iris$Species),
           size = 8) # Scatter plot
  
