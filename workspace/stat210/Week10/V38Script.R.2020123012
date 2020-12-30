#   | STAT 210
# | Applied Statistics and Data Analysis
# | Multiple Linear Regression 6
# | Polynomial Regression and 
# | Quantitative Regressors


library(PASWR); library(car); library(alr4)

# Polynomial Regression
## Polynomial Regression

str(SLID)
summary(SLID)

par(mfrow = c(1,2))
hist(SLID$wages, col='gray75', main='wages')
hist(log(SLID$wages), col='gray75', 
     main='log(wages)')
par(mfrow=c(1,1))


slid.m <- lm(log(wages)~age, data = SLID)
scatterplot(log(wages)~age, data = SLID, 
            pch='.',
            subset = age>= 18 & age <= 65)

residualPlots(slid.m, pch ='.', 
              col=gray(0.75))

slid.m1 <- update(slid.m, ~ age + I(age^2))
brief(slid.m1)

slid.m2 <- lm(log(wages) ~ poly(age,2,raw=TRUE), 
              data=SLID,
              subset = age>= 18 & age <= 65)
brief(slid.m2)

slid.m3 <- lm(log(wages) ~ poly(age,2), 
              data=SLID,
              subset = age>= 18 & age <= 65)
brief(slid.m3)


Anova(slid.m1)
Anova(slid.m2)
Anova(slid.m3)

plot(predictorEffects(slid.m2, residuals = TRUE),
     partial.residuals = list(cex=0.35, col=gray(0.5), 
                              lty = 2))


residualPlots(slid.m2, cex=0.35, col=gray(0.75),
              tests = FALSE)



# Qualitative Predictors

contr.treatment(4)

contrasts(iris$Species)

op <- par(no.readonly = TRUE)
par(mfrow = c(2,2), mar = c(4,2,2,2))
curve(5 + 0.3*x, 0,3, ylim=c(4,7), 
      axes = FALSE,ylab='',xlab='')
axis(1,labels = TRUE, lwd.ticks = 0, at=c(-2,8))
axis(2,labels = FALSE, lwd.ticks = 0)
mtext('x',1,1)
mtext('y',2,1)
title('I')

curve(5.6 + 0.3*x, 0,3, ylim=c(4,7), 
      axes = FALSE,ylab='',xlab='')
curve(4.6 + 0.3*x, 0,3, ylim=c(4,7), add = TRUE)
axis(1,labels = FALSE, lwd.ticks = 0, at=c(-2,8))
axis(2,labels = FALSE, lwd.ticks = 0)
mtext('x',1,1)
mtext('y',2,1)
title('II')

curve(5 + 0.5*x, 0,3, ylim=c(4,7), 
      axes = FALSE,ylab='',xlab='')
curve(5 + 0.2*x, 0,3, ylim=c(4,7), add = TRUE)
axis(1,labels = FALSE, lwd.ticks = 0, at=c(-2,8))
axis(2,labels = FALSE, lwd.ticks = 0)
mtext('x',1,1)
mtext('y',2,1)
title('III')

curve(4.65 + 0.5*x, 0,3, ylim=c(4,7), 
      axes = FALSE,ylab='',xlab='')
curve(5.2 + 0.2*x, 0,3, ylim=c(4,7), add = TRUE)
axis(1,labels = FALSE, lwd.ticks = 0, at=c(-2,8))
axis(2,labels = FALSE, lwd.ticks = 0)
mtext('x',1,1)
mtext('y',2,1)
title('IV')
par(op)



curve(5 + 0.3*x, 0,3, ylim=c(4,7), 
      axes = FALSE,ylab='',xlab='')
axis(1,labels = TRUE, lwd.ticks = 0, 
     at=c(-1,8))
axis(2,labels = FALSE, lwd.ticks = 0)
mtext('x',1,1)
mtext('y',2,1)
title('I')



library(MASS); attach(crabs)
lmSimple <- lm(FL~CL); summary(lmSimple)

plot(CL,FL, pch=20, xlab='Carapace length', 
     ylab='Frontal lobe size', col=sp)
abline(lmSimple, lw=2, col='blue')

fsp <- as.factor(sp)
contrasts(fsp)

lmComplete <-  lm(FL~CL+fsp+CL:fsp)
brief(lmComplete)

anova(lmSimple,lmComplete)

summary(lmComplete)

lmInter <-  lm(FL~CL+CL:fsp)
summary(lmInter)

anova(lmInter,lmComplete)

## Example: Crabs
plot(CL,FL, pch=20, xlab='Carapace length', 
     ylab='Frontal lobe size', col=sp)
beta <- coef(lmInter)
abline(beta[1], beta[2],lwd=2)
abline(beta[1], sum(beta[-1]),lwd=2, col='red')

