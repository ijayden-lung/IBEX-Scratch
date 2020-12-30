#   | STAT 210
# | Applied Statistics and Data Analysis
# | Multivariate Density Estimation  

  
## Multivariate Density Estimation
# Generate a normal sample of size 200
set.seed(2345)
x <- mvtnorm::rmvnorm(200,sigma =
                  rbind(c(1.5,0.75),c(0.75,0.5)))
## Density estimation
H <- diag(c(1,1))
kde <- ks::kde(x, H)

# Graphs 
image(kde$eval.points[[1]],
      kde$eval.points[[2]], kde$estimate,
      col = viridis::viridis(20),
      xlab = "x", ylab = "y")
points(kde$x, cex=.5, col = 'white', pch = 16)

image(kde$eval.points[[1]], 
      kde$eval.points[[2]], kde$estimate,
      col = viridis::plasma(30),
      xlab = "x", ylab = "y")
points(kde$x, cex=.5, col ='white', pch = 16)


image(kde$eval.points[[1]], 
      kde$eval.points[[2]], kde$estimate,
      col = colorspace::heat_hcl(30),
      xlab = "x", ylab = "y")
points(kde$x, cex=.5, pch = 16)


# Generate points from the same normal density
# and evaluate the estimated density in them
pts <- mvtnorm::rmvnorm(200,
            sigma = rbind(c(1.5,0.75),c(0.75,0.5)))
kde_sample <- ks::kde(x = x, H = H, 
                      eval.points = pts)

n_cols <- 30
quantiles <- quantile(kde_sample$estimate,
                   probs = seq(0, 1, l = n_cols + 1))
col <- viridis::plasma(n_cols)[
  cut(kde_sample$estimate,breaks = quantiles)]
plot(pts, col = col, pch = 19, 
     xlab = "x", ylab = "y",
     xlim=c(-6,6), ylim=c(-6,6))


col <- colorspace::heat_hcl(n_cols)[
  cut(kde_sample$estimate, breaks = quantiles)]
plot(pts, col = col, pch = 19, 
     xlab = "x", ylab = "y",
     xlim=c(-6,6), ylim=c(-6,6))


# Representations  for the density

plot(kde, display = "slice", 
     cont = seq(5, 95, by = 10),
     xlab = "x", ylab = "y", 
     col.fun = viridis::plasma)

plot(kde, display = "filled.contour2", 
     cont = seq(5, 95, by = 10),
     xlab = "x", ylab = "y", 
     col.fun = viridis::plasma)

plot(kde, display = "filled.contour", 
     cont = seq(5, 95, by = 10),
     xlab = "x", ylab = "y", 
     col.fun = viridis::plasma)
plot(kde, display = "slice", 
     cont = seq(5, 95, by = 10), 
     add = TRUE)



plot(kde, display = "persp", 
     col.fun = viridis::plasma, 
     xlab = "x", ylab = "y")

plot(kde, display = "persp", 
     col = colorspace::sequential_hcl(500), 
     xlab = "x", ylab = "y", theta = -50, phi = 30)


## Three dimensions
library(rgl) 
n = 500
set.seed(213212) 
x <- mvtnorm::rmvnorm(n = n, mean = c(0, 0, 0),
                    sigma = rbind(c(1.5, 0.25, 0.5),
                                  c(0.25, 0.75, 1),
                                  c(0.5, 1, 2)))
# Show nested contours of high density regions
plot(ks::kde(x = x, H = diag(c(rep(1.25, 3)))), 
     drawpoints = TRUE, col.pt = 1)
  rgl::rglwidget()

  
  
# Applications of Density Estimation
## Classification
  
library(ks)
x1 <- iris$Sepal.Width
groups <- iris$Species
kda1 <- kda(x = x1, x.group = groups) 
kda1$prior.prob

head(kda1$x.group.estimate)
compare(x.group = kda1$x.group,
        est.group = kda1$x.group.estimate)

plot(kda1, xlab = "Sepal width", 
     drawpoints = TRUE, col = 2:4)
legend("topright", 
       legend = c("Setosa", "Versicolor", "Virginica"),
       lwd = 2, col = 2:4)


x2 <- iris$Sepal.Length
kda2 <- kda(x = x2, x.group = groups) 

compare(x.group = kda2$x.group,
        est.group = kda2$x.group.estimate)

plot(kda2, xlab = "Petal length", 
     drawpoints = TRUE, col = 2:4)
legend("topright", 
       legend = c("Setosa", "Versicolor", "Virginica"),
       lwd = 2, col = 2:4)


## Classification
## Bivariate example.

x <- iris[, 1:2]
groups <- iris$Species
kda2 <- kda(x = x, x.group = groups, supp = 10)
compare(x.group = kda2$x.group,
        est.group = kda2$x.group.estimate)

plot(kda2, col = rainbow(3), lwd = 2, 
     col.pt = 1, cont = seq(5, 85, by = 20),
     col.part = rainbow(3, alpha = 0.25), 
     drawpoints = TRUE)

## Classification
## Trivariate example

x <- iris[, 1:3]
groups <- iris$Species
# Normal scale bandwidths to avoid undersmoothing
Hs <- rbind(Hns(x = x[groups == "setosa", ]),
            Hns(x = x[groups == "versicolor", ]),
            Hns(x = x[groups == "virginica", ]))
kda3 <- kda(x = x, x.group = groups, Hs = Hs)
compare(x.group = kda3$x.group,
        est.group = kda3$x.group.estimate)

## Classification regions

plot(kda3, drawpoints = TRUE, col.pt = c(2, 3, 4),
     cont = seq(5, 85, by = 20))
rgl::rglwidget()











