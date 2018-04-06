file<-read.csv("C:/Users/ADMIN/Desktop/crime.csv",sep = ",")
attach(file)
fit1 <- lm(murder.rate ~ poverty+high.school+college+single.parent+unemployed+metropolitan+region)
# Residual plot
plot(fitted(fit1), resid(fit1))
abline(h=0)
# QQ plot
qqnorm(resid(fit1))
qqline(resid(fit1))
# Time series plot of residuals
plot(resid(fit1), type="l")
abline(h=0)

fit2<-update(fit1,.~.-poverty-high.school-college-unemployed)
summary(fit1)
summary(fit2)
anova(fit2,fit1)
table(region)
new<-data.frame(single.parent=mean(single.parent),metropolitan=mean(metropolitan),region="South")
predict(fit2,newdata=new)