#   | STAT 210
# | Applied Statistics and Data Analysis
# | Multiple Linear Regression 4
# | Diagnostics

library(PASWR) 
library(car)

# Diagnostics
# Unusual Observations

attach(HSwrestler)
library(MASS)
mod.2 <- lm(HWFAT~ABS+TRICEPS)
par(mfrow=c(2,2))
plot(fitted(mod.2), resid(mod.2), 
     ylim=c(-10,10), main="")
title(main="Residuals vs Fitted")
abline(h=0, lty=2)
plot(fitted(mod.2), stdres(mod.2), 
     ylim=c(-3.5,3.5), main="")
title(main="Standardized Residuals vs Fitted")
abline(h=0, lty=2)
plot(fitted(mod.2), studres(mod.2), 
     ylim=c(-3.5,3.5), main="")
title(main="Studentized Residuals vs Fitted")
abline(h=0, lty=2)
plot(mod.2, which=1, main="Default Graph 1")
par(mfrow=c(1,1))

sort(abs(resid(mod.2)))[76:78] 
sort(abs(stdres(mod.2)))[76:78]
sort(abs(studres(mod.2)))[76:78]
qt(1-.2/(2*78),78-3-1) # Critical value
detach(HSwrestler)



# Example
str(Kinder)
mod <- lm(ht ~ wt, data = Kinder)
attach(Kinder)

plot(wt, ht, pch=16) 
abline(mod)

plot(wt, ht, pch=16); points(wt[c(19,20)], ht[c(19,20)],
                             pch=16, col='red')
text(wt[19],ht[19]-.5,'19');text(wt[20],ht[20]+.5,'20')
abline(mod)

hii <- lm.influence(mod)$hat 
round(hii,3)


plot(hii, type = 'h', lwd=2)
abline(h=1/5, col='red')

# Observations 19 and 20 are removed from consideration,
# and `ht` is regressed on `wt` with the results 
# stored in `modk`.
modk <- lm(ht[-c(19,20)]~wt[-c(19,20)])


library(MASS) 
library(car) 
library(data.table)
modk19 <- lm(ht[-19]~wt[-19])
n <- 19
p <- 2
par(mfrow=c(2,3))
hiik19 <- lm.influence(modk19)$hat 
plot(hiik19, ylab="Leverage")
points(19,hiik19[19],pch=19, col = 'red')
cv <- 2*p/n
abline(h=cv, lty=2)
plot(lm.influence(modk19)$coefficients[,2],
     ylab="Difference in Coefficients")
points(19,lm.influence(modk19)$coefficients[19,2],
       pch=19, col = 'red')
plot(dfbetas(modk19)[,2], ylab="DFBETAS")
points(19,dfbetas(modk19)[19,2],pch=19, col = 'red')
cv <- 2/sqrt(n) # Critical value for DFBETAS
abline(h=c(-cv, cv), lty=2)
plot(studres(modk19), ylab="Studentized Residuals")
points(19,studres(modk19)[19], pch=16, col = 'red')
cv <- qt(1-.10/(2*n), n-p-1) # Critical value
abline(h=c(-cv, cv), lty=2)
DFFITS <- studres(modk19)*(hiik19/(1-hiik19))^.5 
plot(DFFITS, ylab="DFFITS")
points(19,DFFITS[19],pch=19, col = 'red')
cv <- 2*sqrt(p/n) # Critical value for DFITS
abline(h=c(-cv, cv), lty=2)
cd <- cooks.distance(modk19) # Cook’s distance
plot(cd, ylab="Cook’s Distance")
points(19,cd[19],pch=19, col = 'red')
CF <- qf(.50, p, n-p) # Critical value for Cook’s Distance
abline(h=CF, lty=2)
par(mfrow=c(1,1))


modk20 <- lm(ht[-20]~wt[-20])
par(mfrow=c(2,3))
hiik20 <- lm.influence(modk20)$hat
plot(hiik20, ylab="Leverage")
points(19,hiik20[19],pch=16, col = 'red')
cv <- 2*p/n
abline(h=cv, lty=2)
plot(lm.influence(modk20)$coefficients[,2],
       ylab="Difference in Coefficients")
points(19,lm.influence(modk20)$coefficients[19,2],
       pch=19, col = 'red')
plot(dfbetas(modk20)[,2], ylab="DFBETAS")
points(19,dfbetas(modk20)[19,2],pch=16, col ='red')
cv <- 2/sqrt(n) # Critical value for DFBETAS
abline(h=c(-cv, cv), lty=2)
plot(studres(modk20), ylab="Studentized Residuals")
points(19,studres(modk20)[19], pch = 16, col = 'red')
cv <- qt(1-.10/(2*n), n-p-1) # Critical value
abline(h=c(-cv, cv), lty=2)
DFFITS <- studres(modk20)*(hiik20/(1-hiik20))^.5
plot(DFFITS, ylab="DFFITS")
points(19,DFFITS[19], pch = 16, col = 'red')
cv <- 2*sqrt(p/n) # Critical value for DFITS
abline(h=c(-cv, cv), lty=2)
cd <- cooks.distance(modk20) # Cook’s distance
plot(cd, ylab="Cook’s Distance")
points(19,cd[19], pch = 16, col = 'red')
CF <- qf(.50, p, n-p) # Critical value for Cook’s Distance
abline(h=CF, lty=2)
par(mfrow=c(1,1))


plot(wt[-c(19,20)], ht[-c(19,20)], cex=2, 
     xlim=c(28,62), ylim=c(36,52),
     xlab="Weight in Pounds", ylab="Height in Inches")
abline(mod, lty=1, lwd=2)
abline(modk, col='green', lty=2, lwd=2)
abline(modk19, col="red", lty=3, lwd=2)
abline(modk20, col="blue", lty=4, lwd=2)
abline(mod, lty=4, lwd=2)
points(wt[19], ht[19], pch=16, cex=2, col="red")
points(wt[20], ht[20], pch=17, cex=2, col="blue")
legend('topleft',legend=c('all','-2','-19','-20'),lty=1:4,
       col=c('black','green','red','blue'))
detach(Kinder)





## Other Diagnostic Tools
library(alr4)
library(car)
str(rat, vec.len = 2)
scatterplotMatrix(rat)

m1 <- lm(y ~ BodyWt + LiverWt + Dose, rat)
summary(m1)


m2 <- update(m1, ~ . - LiverWt)
summary(m2)

m3 <- update(m2, ~ . - Dose, rat)
S(m3)

m4 <- update(m2, ~ . - BodyWt, rat)
S(m4)


## Other Diagnostic Tools: Influence plots

influenceIndexPlot(m1)

influencePlot(m1)




residualPlot(m1, id =list(method = list("x", "y"), n=2), 
             quadratic = FALSE)


plot(Dose ~ BodyWt, data = rat) 
abline(lm(Dose ~ BodyWt, data = rat))
points(Dose ~ BodyWt, rat[3,], pch = 16, col='red')




m1b <- lm(y ~ BodyWt + LiverWt + Dose, rat[-3,])
S(m1b)

residualPlots(m1, id=TRUE)

## Other Diagnostic Plots

str(UN11)
scatterplotMatrix(UN11)
scatterplotMatrix(UN11[,c(3,4,6)])
scatterplotMatrix( ~ fertility + log(ppgdp) 
                   + pctUrban, data = UN11)

lm1 <- lm(fertility ~ log(ppgdp) + pctUrban, data = UN11)
summary(lm1)

residualPlots(lm1, id=TRUE)

    
             
       
                
       
               

