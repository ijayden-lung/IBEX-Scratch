library(plyr)
library(quantmod)
library(lubridate)
library(scales)


SP500<-read.csv('sp500_history.txt',header=T)
SP500.added<-SP500[SP500[,'variable']=='added_ticker',] #choose only added tickers after jan 1993
SP500.1993<-SP500.added[SP500.added[,'date']>='1993-02-01',]
SP500.letters<-subset(SP500.1993,select = c(date,value,name))

SPY  = getSymbols("SPY", src = "yahoo", from = "1956-01-01", to = Sys.Date()+1, auto.assign = FALSE)
v <- data.frame("Date" = index( SPY), "Price" =  SPY$SPY.Adjusted)

list.of.companies<-list()
list.of.adjusted<-list()
InvRet<-data.frame(company=NA,ROI5=NA,ROI5_SPY=NA, ROI10=NA,ROI10_SPY=NA)[numeric(0), ]
k=0
for (i in SP500.letters$value) {
  k=k+1
  tryCatch({
    getSymbols(i,src='yahoo',from = "1956-01-01", to = Sys.Date()+1)
    VarName<-paste(i,'1', sep = "")
    yearss<-interval(SP500.letters$date[SP500.letters$value==i], today()) %/% years(1)  
    
    
    print(i)
    print(yearss[1])
    Dummy<-data.frame(date=index(eval(parse(text = i))), coredata(eval(parse(text = i))))
    
    FiveYears<-ymd(SP500.letters$date[SP500.letters$value==i]) %m+% years(5)

    FirstPrice<-Dummy[7][Dummy[,'date']==SP500.letters$date[SP500.letters$value==i],]
    FirstPrice.SPY<-v[2][v[,'Date']==SP500.letters$date[SP500.letters$value==i],]
    FivePrice<-Dummy[7][Dummy[,'date']==FiveYears,]
    FivePrice.SPY<-v[2][v[,'Date']==FiveYears,]
    
    Profit5<-FivePrice-FirstPrice
    Profit5.SPY<-FivePrice.SPY-FirstPrice.SPY
    ROI5<-Profit5/FirstPrice
    ROI5.SPY<-Profit5.SPY/FirstPrice.SPY
    
    TenYears<-ymd(SP500.letters$date[SP500.letters$value==i]) %m+% years(10)
    TenPrice<-Dummy[7][Dummy[,'date']==TenYears,]
    TenPrice.SPY<-v[2][v[,'Date']==TenYears,]
    
    Profit10<-TenPrice-FirstPrice
    Profit10.SPY<-TenPrice.SPY-FirstPrice.SPY
    ROI10<-Profit10/FirstPrice
    ROI10.SPY<-Profit10.SPY/FirstPrice.SPY
    
    
    
    de<-data.frame(i,ROI5,ROI5.SPY,ROI10,ROI10.SPY)
    names(de)<-names(InvRet)
    InvRet<-rbind(InvRet,de)
    
    list.of.companies[[VarName]]<-Dummy[Dummy[,'date']>=SP500.letters$date[SP500.letters$value==i],]
    rm(Dummy,list = i)
    
  }, error=function(e){}) #tryCatch is to skip error when downloading data
  #list.of.adjusted[[k]]<-(list.of.companies[[k]][c(1,7)])
  
}

### PLOTSSS

oldpar<- par(mfrow=c(1,1))
hist(InvRet$ROI10,freq = F,breaks = seq(-1,ceiling(max(InvRet$ROI10)),0.5),
     main = 'Histogram for 10 years ROI, New S&P500 companies',xlab = '10 years ROI',
     xlim = c(-1,12),ylim = c(0,0.6),col='gray89')
lines(density(InvRet$ROI10),lwd = 2)
abline(v = mean(InvRet$ROI10), col = "red2")
abline(v = median(InvRet$ROI10), col = "green3")
text(mean(InvRet$ROI10),0.4,'Mean',pos=2,srt=90,col='red4')
text(median(InvRet$ROI10),0.4,'Median',pos=2,srt=90,col='green4')

hist(InvRet$ROI10_SPY,freq = F,breaks = seq(-1,ceiling(max(InvRet$ROI10_SPY)),0.5),
     main = 'Histogram for 10 years ROI ,SPY',xlab = '10 years ROI',
     xlim = c(-1,12),ylim = c(0,0.6),col='gray89')
lines(density(InvRet$ROI10_SPY),lwd = 2)
abline(v = mean(InvRet$ROI10_SPY), col = "red2")
abline(v = median(InvRet$ROI10_SPY), col = "green3")
text(mean(InvRet$ROI10_SPY),0.5,'Mean',pos=4,srt=90,col='red4')
text(median(InvRet$ROI10_SPY),0.5,'Median',pos=3,srt=90,col='green4')


qqnorm(InvRet$ROI10_SPY, main = 'qq plot for 10 yrs ROI,SPY', sub='')
qqline(InvRet$ROI10_SPY)
shapiro.test(InvRet$ROI10_SPY)

oldpar<- par(mfrow=c(2,2))
qqPlot(InvRet$ROI10_SPY,envelope = F,distribution = 'norm',main='Q-Q plot with Normal distribution',
       ylab = '10 yrs ROI',col=alpha(2, 0.5),pch=19)
qqPlot(InvRet$ROI10_SPY,envelope = F,distribution = 'chisq', df = 2,main='Q-Q plot with chi square distribution',ylab = '10 yrs ROI',col=alpha(2, 0.5),pch=19)
qqPlot(InvRet$ROI10_SPY,envelope = F,distribution = 'exp',main='Q-Q plot with Exponential distribution',ylab = '10 yrs ROI',col=alpha(2, 0.5),pch=19)
qqPlot(InvRet$ROI10_SPY,envelope = F,distribution = 'unif',main='Q-Q plot with uniform distribution',ylab = '10 yrs ROI',col=alpha(2, 0.5),pch=19)



points<-seq(0,1,length=1000)
hist(InvRet$ROI5,freq = F,breaks = seq(-1,ceiling(max(InvRet$ROI5)),0.5),
     main = 'Histogram for 5 years ROI, New S&P500 companies',xlab = '5 years ROI',
     xlim = c(-1,12),ylim = c(0,0.75),col='gray89')
lines(density(InvRet$ROI5),lwd = 2)
#lines(density(dunif(points,min = 0,max=0)))
abline(v = mean(InvRet$ROI5), col = "red2")
abline(v = median(InvRet$ROI5), col = "green3")
text(mean(InvRet$ROI5),0.6,'Mean',pos=4,srt=90,col='red4')
text(median(InvRet$ROI5),0.6,'Median',pos=3,srt=90,col='green4')

hist(InvRet$ROI5_SPY,freq = F,breaks = seq(-1,ceiling(max(InvRet$ROI5_SPY)),0.5),
     main = 'Histogram for 5 years ROI ,SPY',xlab = '5 years ROI',
     xlim = c(-1,12),ylim = c(0,0.75),col='gray89')
lines(density(InvRet$ROI5_SPY),lwd = 2)
abline(v = mean(InvRet$ROI5_SPY), col = "red2")
abline(v = median(InvRet$ROI5_SPY), col = "green3")
text(mean(InvRet$ROI5_SPY),0.2,'Mean',pos=2,srt=90,col='red1')
text(median(InvRet$ROI5_SPY),0.2,'Median',pos=2,srt=90,col='green4')

write.csv(InvRet,'NewCompReturn.csv')

write.csv()