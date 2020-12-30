#   | STAT 210
# | Applied Statistics and Data Analysis
# | Nonparametric Regression  


# Nonparametric Regression
## Nonparametric Regression


# Let's see first a simulated example where 
# the regression function is known.

n <- 100
m <- function(x) x^2 * cos(x)
x <- rnorm(n, sd=2); epsilon <- rnorm(n, sd=2)
y <- m(x) + epsilon
x_points <- seq(-10, 10, l=500)


plot(x,y, ylim=c(-15,12), xlim=c(-5,5), lwd=2,
     main = 'Nonparametric regression')
rug(x, side = 1); rug(y, side = 2)
lines(x_points, m(x_points), col = 1, lwd=2)
lines(ksmooth(x,y,kernel = 'normal', 
              bandwidth=.8), col = 2, lwd=2)
lines(ksmooth(x,y,kernel = 'normal', 
              bandwidth=1.), col = 3, lwd=2)
lines(ksmooth(x,y,kernel = 'normal', 
              bandwidth=1.2), col = 4, lwd=2)
legend("top", legend = c("True regression", 
            "N-W 0.8", "N-W 1.0", "N-W 1.2"), 
       lwd = 2, col = 1:4, cex = 0.8)



  
  
  
## Local Polynomial Estimators
  
  ## Example
set.seed(123456)
n <- 100
m <- function(x) x^3 * sin(x)
X <- rnorm(n, sd = 1.5)
eps <- rnorm(n, sd = 2)
Y <- m(X) + eps
x_grid <- seq(-10, 10, l = 500)

# KernSmooth::locpoly fits
h <- 0.25
lp0 <- KernSmooth::locpoly(x = X, y = Y, 
                           bandwidth = h, 
                           degree = 0,
                           range.x = c(-10, 10), 
                           gridsize = 500)
lp1 <- KernSmooth::locpoly(x = X, y = Y, 
                           bandwidth = h, 
                           degree = 1,
                           range.x = c(-10, 10), 
                           gridsize = 500)
# Provide the evaluation points 
# by range.x and gridsize

# loess fits
span <- 0.25 # The default span is 0.75, 
#              which works very bad here
lo0 <- loess(Y ~ X, degree = 0, span = span)
lo1 <- loess(Y ~ X, degree = 1, span = span)




## Example
# Prediction at x = 0 and x = 2
# Prediction by locpoly
c(lp1$y[which.min(abs(lp1$x ))],
  lp1$y[which.min(abs(lp1$x - 2))])
# Prediction by loess
predict(lo1, newdata = data.frame(X = c(0,2)))
m(c(0,2)) # True regression


plot(X, Y)
rug(X, side = 1); rug(Y, side = 2)
lines(x_grid, m(x_grid), col = 1)
lines(lp0$x, lp0$y, col = 2)
lines(lp1$x, lp1$y, col = 3)
lines(x_grid, predict(lo0, 
      newdata = data.frame(X = x_grid)),
      col = 2, lty = 2)
lines(x_grid, predict(lo1, 
      newdata = data.frame(X = x_grid)),
      col = 3, lty = 2)
legend("bottom", legend =
         c("True regression", 
           "Local constant (locpoly)",
           "Local linear (locpoly)", 
           "Local constant (loess)",
           "Local linear (loess)"),
       lwd = 2, col = c(1:3, 2:3), 
       lty = c(rep(1, 3), rep(2, 2)))




plot(X, Y, lwd=2)
rug(X, side = 1); rug(Y, side = 2)
lines(x_grid, m(x_grid), col = 1, lwd=2)
lines(lp0$x, lp0$y, col = 2, lwd=2)
lines(lp1$x, lp1$y, col = 3, lwd=2)
lines(x_grid, predict(lo0, 
      newdata = data.frame(X = x_grid)),
      col = 2, lty = 2, lwd=2)
lines(x_grid, predict(lo1, 
      newdata = data.frame(X = x_grid)),
      col = 3, lty = 2, lwd=2)
legend(-1.2,-15, legend = 
         c("True regression", 
           "Local constant (locpoly)",
           "Local linear (locpoly)", 
           "Local constant (loess)",
           "Local linear (loess)"),
       lwd = 2, col = c(1:3, 2:3), 
       lty = c(rep(1, 3), rep(2, 2)))



## Example: geyser data
plot(faithful[,1] ~ faithful[,2], 
     pch = 21, bg = "slateblue",
     xlab = "Waiting time [min]", 
     ylab = "Eruption duration [min]")
m1 <- lm(faithful[,1] ~ faithful[,2])
m2 <- lm(faithful[,1] ~ faithful[,2] 
         + I(faithful[,2]^2))
m3 <- lm(faithful[,1] ~ faithful[,2] 
         + I(faithful[,2]^2)
         + I(faithful[,2]^3))

plot(faithful[,1] ~ faithful[,2], pch = 21, 
     bg = "slateblue",
     xlab = "Waiting time [min]", 
     ylab = "Eruption duration [min]")
abline(m1$coeff[1], m1$coeff[2], 
       col = "orange", lwd = 2)



plot(faithful[,1] ~ faithful[,2], pch = 21, 
     bg = "slateblue",
     xlab = "Waiting time [min]", 
     ylab = "Eruption duration [min]")
abline(m1$coeff[1], m1$coeff[2], 
       col = "orange", lwd = 2)
curve(m2$coeff[1] + m2$coeff[2] * x 
      + m2$coeff[3] * x^2, 
      col = "violet", lwd = 2,add=TRUE)



plot(faithful[,1] ~ faithful[,2], pch = 21, 
     bg = "slateblue",
     xlab = "Waiting time [min]", 
     ylab = "Eruption duration [min]")
abline(m1$coeff[1], m1$coeff[2], 
       col = "orange", lwd = 2)
curve(m2$coeff[1] + m2$coeff[2] * x + 
        m2$coeff[3] * x^2, 
      col = "violet", lwd = 2,add=TRUE)
curve(m3$coeff[1] + m3$coeff[2] * x + 
        m3$coeff[3] * x^2 + 
        m3$coeff[4] * x^3, 
      col = "blue", lwd = 2,add=TRUE)


plot(faithful[,1] ~ faithful[,2], pch = 21, 
     bg = "slateblue",
     xlab = "Waiting time [min]", 
     ylab = "Eruption duration [min]")
abline(m1$coeff[1], m1$coeff[2], 
       col = "orange", lwd = 2)
curve(m2$coeff[1] + m2$coeff[2] * x + 
        m2$coeff[3] * x^2, 
      col = "violet", lwd = 2,add=TRUE)
curve(m3$coeff[1] + m3$coeff[2] * x + 
        m3$coeff[3] * x^2 + 
        m3$coeff[4] * x^3, 
      col = "blue", lwd = 2,add=TRUE)
lines(ksmooth(faithful[,2], faithful[,1], 
              kernel = "normal", bandwidth = 9), 
      col = "red", lwd = 2)
legend(43, 5, legend = 
         c("Kernel Regression", 
           "Linear Regression",
           "Quadratic Regression", 
           "Cubic Regression"),
       col = c("red", "orange", 
               "violet", "blue"), 
       lwd = c(2,2,2,2))



m1 <- lm(faithful[,1] ~ faithful[,2])
m2 <- lm(faithful[,1]   ~ faithful[,2] + I(faithful[,2]^2))
m3 <- lm(faithful[,1]   ~ faithful[,2] + I(faithful[,2]^2)
         + I(faithful[,2]^3))

plot(faithful[,1] ~ faithful[,2], pch = 16, col = "slateblue",
     xlab = "Waiting time [min]", ylab = "Eruption duration [min]")
abline(m1$coeff[1], m1$coeff[2], col = "orange", lwd = 2)
curve(m2$coeff[1] + m2$coeff[2] * x + m2$coeff[3] * x^2, col = "violet", lwd = 2,add=TRUE)
curve(m3$coeff[1] + m3$coeff[2] * x + m3$coeff[3] * x^2 + m3$coeff[4] * x^3, col = "blue", lwd = 2,add=TRUE)
lines(ksmooth(faithful[,2], faithful[,1], kernel = "normal", bandwidth = 9), col = "red", lwd = 2)
f=loess(eruptions ~ waiting, faithful)
i = order(faithful$waiting)
lines(f$x[i],f$fitted[i], lwd=1.5, col="green4")

legend(43, 5, legend = c( "Linear Regression",
                         "Quadratic Regression", 
                         "Cubic Regression",
                         "Kernel Regression",
                         "loess"),
       col = c("orange", "violet", "blue","red","green4"), 
       lwd = c(2,2,2,2,2))













