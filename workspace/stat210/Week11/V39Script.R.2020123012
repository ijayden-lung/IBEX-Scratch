#   | STAT 210
# | Applied Statistics and Data Analysis
# | Density Estimation  


## Introduction

library(MASS)
attach(geyser)
par(mfrow=c(2,3))
truehist(duration, h=0.5, x0=0.0, xlim=c(0, 6), 
         ymax=0.7)
truehist(duration, h=0.5, x0=0.1, xlim=c(0, 6), 
         ymax=0.7)
truehist(duration, h=0.5, x0=0.2, xlim=c(0, 6), 
         ymax=0.7)
truehist(duration, h=0.5, x0=0.3, xlim=c(0, 6), 
         ymax=0.7)
truehist(duration, h=0.5, x0=0.4, xlim=c(0, 6), 
         ymax=0.7)

breaks <- seq(0, 5.9, 0.1)
counts <- numeric(length(breaks))
for(i in 0:4) counts[i+(1:55)] <- counts[i+(1:55)] +
  rep(hist(duration, breaks=0.1*i + seq(0, 5.5, 0.5),
           freq=FALSE, plot=F)$density, rep(5,11))
plot(breaks+0.05, counts/5, type="l", xlab="duration",
     ylab="averaged", bty="n", xlim=c(0, 6), 
     ylim=c(0, 0.7))
par(mfrow=c(1,1))

set.seed(123)
xx <- runif(15,-2,2)
plot(1:15, 1:15, xlim=c(-3,3), ylim = c(0,.45), 
     type = 'n', xlab = 'x',
     ylab = 'density', main='Estimated density')

for (i in 1:15) {
  curve(dnorm(x,xx[i],0.3)/15,add=TRUE, col='blue2')
}

curve(dnorm(x,xx[1],0.3)/15
      +dnorm(x,xx[2],0.3)/15
      +dnorm(x,xx[3],0.3)/15
      +dnorm(x,xx[4],0.3)/15
      +dnorm(x,xx[5],0.3)/15
      +dnorm(x,xx[6],0.3)/15
      +dnorm(x,xx[7],0.3)/15
      +dnorm(x,xx[8],0.3)/15
      +dnorm(x,xx[9],0.3)/15
      +dnorm(x,xx[10],0.3)/15
      +dnorm(x,xx[11],0.3)/15
      +dnorm(x,xx[12],0.3)/15
      +dnorm(x,xx[13],0.3)/15
      +dnorm(x,xx[14],0.3)/15
      +dnorm(x,xx[15],0.3)/15
      ,add=TRUE, lwd=2)
rug(xx,lwd=2)




  
kernels <- eval(formals(density.default)$kernel)

plot (density(0, bw = 1), xlab = "", lwd=2,
      main = "R's density() kernels with bw = 1")
for(i in 2:length(kernels))
  lines(density(0, bw = 1, kernel =  kernels[i]), 
        col = i, lwd = 2)
legend('topright', legend = kernels, 
       col = seq(kernels),
       lty = 1, cex = .8, y.intersp = 1, lwd = 1.5)




plot(density(duration)); rug(duration)

par(mfrow=c(2,2))
plot(density(duration, kernel = 'epan'), 
     main = 'Epanechnikov'); rug(duration)
plot(density(duration, kernel = 'rect'), 
     main = 'Rectangular'); rug(duration)
plot(density(duration, kernel = 'trian'), 
     main = 'Triangular'); rug(duration)
plot(density(duration, kernel = 'cos'), 
     main = 'Cosine'); rug(duration)
par(mfrow=c(1,1))


## Estimation kernels

plot(density(duration),lwd=2, 
     main = 'Estimated Densities'); rug(duration)
lines(density(duration, kernel = 'epan'),lwd=2, 
      col=2)
lines(density(duration, kernel = 'rect'),lwd=2, 
      col=3)
lines(density(duration, kernel = 'trian'),lwd=2,
      col=4)
lines(density(duration, kernel = 'cos'),lwd=2, 
      col=5)
names <- c('normal','epan.','rect.','triang.',
           'cosine')
legend('topleft',names,col=1:5, lwd=2)




## Bandwidth parameters
par(mfrow=c(2,2))
plot(density(duration, bw='nrd'), main='nrd')
rug(duration)
plot(density(duration, bw='ucv'), main='ucv')
rug(duration)
plot(density(duration, bw='bcv'), main='bcv')
rug(duration)
plot(density(duration, bw='SJ'), main='SJ')
rug(duration)
par(mfrow=c(1,1))


par(mfrow=c(2,2))
plot(density(duration, adjust=.3), 
     main='adjust = 0.3'); rug(duration)
plot(density(duration, adjust = .6), 
     main='adjust = 0.6'); rug(duration)
plot(density(duration), main='adjust = 1'); 
rug(duration)
plot(density(duration, adjust =  1.3), 
     main='adjust = 1.3'); rug(duration)
par(mfrow=c(1,1))


## Estimation kernels
set.seed(569921); data.1 <- runif(100) <= 0.6
data.dens <- data.1*rnorm(100,mean=-1)+ 
  (1-data.1)*rnorm(100,mean=2)
plot(data.dens, rep(0,100),ylab='',xlab='',
     axes = FALSE)
axis(1)
puntos.x <- seq(-4.5,6,length=100)
puntos.dens <- 0.6*(dnorm(puntos.x, mean=-1))+ 
  0.4*(dnorm(puntos.x,mean=2))
par(mfrow=c(1,1))
plot(puntos.x,puntos.dens,type='l',xlab='', 
     ylim=c(0,0.35),
     ylab='',lwd=2,col=8, main='Default bandwidth')
rug(data.dens)
lines(density(data.dens,kernel='gau',adjust=1), 
      lwd=2)
lines(density(data.dens,kernel='epa',adjust=1), 
      lwd=2,col=2)
lines(density(data.dens,kernel='rec',adjust=1), 
      lwd=2,col=3)
lines(density(data.dens,kernel='tria',adjust=1), 
      lwd=2,col=4)
lines(density(data.dens,kernel='cos',adjust=1), 
      lwd=2,col=6)
names <- c('normal','epan.','rect.','triang.',
           'cosine','true density')
legend('topright',names,col=c(1:4,6,8), 
       lwd=rep(2,7))


par(mfrow=c(1,1))
plot(puntos.x,puntos.dens,type='l',xlab='', 
     ylim=c(0,0.35),
     ylab='',lwd=2,col=8, main='adjust = 0.7')
rug(data.dens)
lines(density(data.dens,kernel='gau',adjust=.7), 
      lwd=2)
lines(density(data.dens,kernel='epa',adjust=.7), 
      lwd=2,col=2)
lines(density(data.dens,kernel='rec',adjust=.7), 
      lwd=2,col=3)
lines(density(data.dens,kernel='tria',adjust=.7), 
      lwd=2,col=4)
lines(density(data.dens,kernel='cos',adjust=.7), 
      lwd=2,col=6)
names <- c('normal','epan.','rect.','triang.',
           'cosine','true density')
legend('topright',names,col=c(1:4,6,8), lwd=rep(2,7))


par(mfrow=c(1,1))
plot(puntos.x,puntos.dens,type='l',xlab='', 
     ylim=c(0,0.35),
     ylab='',lwd=2,col=8, main='adjust = 0.3')
rug(data.dens)
lines(density(data.dens,kernel='gau',adjust=.3), 
      lwd=2)
lines(density(data.dens,kernel='epa',adjust=.3), 
      lwd=2,col=2)
lines(density(data.dens,kernel='rec',adjust=.3), 
      lwd=2,col=3)
lines(density(data.dens,kernel='tria',adjust=.3), 
      lwd=2,col=4)
lines(density(data.dens,kernel='cos',adjust=.3), 
      lwd=2,col=6)
names <- c('normal','epan.','rect.','triang.',
           'cosine','true density')
legend('topright',names,col=c(1:4,6,8), lwd=rep(2,7))



## Estimation kernels

plot(puntos.x,puntos.dens,type='l',xlab='',
     ylab='',lwd=2,col=8, ylim=c(0,0.35),
     main='Bandwidth Comparison')
lines(density(data.dens,kernel='gau',adjust=.25),
      lwd=2)
lines(density(data.dens,kernel='gau',adjust=.5),
      lwd=2,col=2)
lines(density(data.dens,kernel='gau',adjust=.75),
      lwd=2,col=3)
lines(density(data.dens,kernel='gau',adjust=1),
      lwd=2,col=4)
lines(density(data.dens,kernel='gau',adjust=1.25),
      lwd=2,col=5)
lines(density(data.dens,kernel='gau',adjust=1.5),
      lwd=2,col=6)
legend(4,0.28,seq(0.25,1.5,.25),col=1:6,lwd=rep(2,6))
rug(data.dens, lwd=1.5)





  


## Estimation kernels: bandwidth selection



## Estimation kernels: `kde`

samp_t <- rt(25, df = 2); bw <- 0.75
library(ks)
plot(kde <- kde(x = samp_t, h = bw), lwd = 3) 
lines(density(x = samp_t, bw = bw), col = 2)


dens1 <- kde(x = samp_t, h = bw, eval.points = -2:2)
dens1$eval.points
round(dens1$estimate,4)


plot(kde <- kde(x = samp_t, h = bw), lwd = 3)
points(dens1$eval.points,dens1$estimate, pch=19, 
       col='red',cex=1.8)


## Estimation kernels: `kde`
# Sampling from an estimated density: Use `rkde`.

round(rkde(n = 5, fhat = dens1),4)



plot(kde <- kde(x = samp_t, h = bw), lwd = 3)
rug(rkde(n = 50, fhat = dens1), lwd = 1.5)










