#   | STAT 210
# | Applied Statistics and Data Analysis
# | Multiple Linear Regression 5
# | Multicollinearity

library(PASWR)
library(car)
library(alr4)

## Collinearity

collin_data = function(num_samples = 100) {
  x1 = rnorm(n = num_samples, mean = 80, sd = 10)
  x2 = rnorm(n = num_samples, mean = 70, sd = 5)
  x3 = 2 * x1 + 4 * x2 + 3
  y = 3 + x1 + x2 + rnorm(n = num_samples, 
                          mean = 0, sd = 1)
  data.frame(y, x1, x2, x3)
}
set.seed(123)
collin_exmpl <- collin_data()

collin.lm <- lm(y ~ x1 + x2 + x3, data = collin_exmpl)
S(collin.lm)


X = cbind(1, as.matrix(collin_exmpl[,-1]))

solve(t(X) %*% X)


fit1 = lm(y ~ x1 + x2, data = collin_exmpl)
fit2 = lm(y ~ x1 + x3, data = collin_exmpl)
fit3 = lm(y ~ x2 + x3, data = collin_exmpl)

all.equal(fitted(fit1), fitted(fit2))
all.equal(fitted(fit2), fitted(fit3))

coef(fit1); coef(fit2); coef(fit3)




## Multicollinearity: Simulated Example
library(mvtnorm)
sigma1 <- diag(4); sigma2 <- sigma1
sigma2[3,1] <- sigma2[1,3] <- 0.95
sigma2[4,2] <- sigma2[2,4] <- -0.95
sample1 <- rmvnorm(100, sigma = sigma1)
sample1 <- data.frame(sample1)
colnames(sample1) <- c('X1','X2','X3','X4')
sample2 <- rmvnorm(100, sigma = sigma2)
colnames(sample1) <- c('X1','X2','X3','X4')
y1 <- 1 + sample1[,1] + sample1[,2] + rnorm(100)
y2 <- 1 + sample2[,1] + sample2[,2] + rnorm(100)

col1 <- lm(y1 ~ X1 + X2 + X3 + X4, data = sample1 )
summary(col1)

set.seed(7364)
sample2 <- rmvnorm(100, sigma = sigma2); sample2 <- data.frame(sample2)
colnames(sample2) <- c('X1','X2','X3','X4')
y2 <- 1 + sample2[,1] + sample2[,2] + rnorm(100)
col2a <- lm(y2 ~ X1 + X2 + X3 + X4, data = sample2)
summary(col2a)

set.seed(574597)
sample2 <- rmvnorm(100, sigma = sigma2); sample2 <- data.frame(sample2)
colnames(sample2) <- c('X1','X2','X3','X4')
y2 <- 1 + sample2[,1] + sample2[,2] + rnorm(100)
col2b <- lm(y2 ~ X1 + X2 + X3 + X4, data = sample2)
summary(col2b)

set.seed(16299125)
sample2 <- rmvnorm(100, sigma = sigma2); sample2 <- data.frame(sample2)
colnames(sample2) <- c('X1','X2','X3','X4')
y2 <- 1 + sample2[,1] + sample2[,2] + rnorm(100)
col2c <- lm(y2 ~ X1 + X2 + X3 + X4, data = sample2)
summary(col2c)

round(vif(col1),3);round(vif(col2a),3) 
round(vif(col2b),3); round(vif(col2c),3)

## Previous videos models
m1 <- lm(y ~ BodyWt + LiverWt + Dose, rat)
m1b <- lm(y ~ BodyWt + LiverWt + Dose, rat[-3,])
lm1 <- lm(fertility ~ log(ppgdp) + pctUrban, data = UN11)

# For the `rat` example
vif(m1); vif(m1b)

# For the `UN11` model
vif(lm1)

data1 = read.table('CPS_85_Wages.txt', header = T)
head(data1, 4)
str(data1)

fit_model1 = lm(log(data1$Wage) ~., data = data1)
summary(fit_model1)


par(mfrow=c(2,2))
plot(fit_model1)
par(mfrow=c(1,1))

# Variance Inflation Factors:
round(vif(fit_model1),3)


# Two nice plots for the correlation matrix:
  
X<-data1[,-(8:11)]
library(GGally)
library(corrplot)
cor1 = cor(X)

corrplot.mixed(cor1, lower.col = 'black', number.cex = .7, tl.cex=0.7)

ggpairs(X)


fit_model2 <- update(fit_model1, ~. - Experience, data = data1)
summary(fit_model2)
round(vif(fit_model2),3)

