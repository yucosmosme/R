#회귀모형 대체과제
#제2장 연습문제 2번 (p.86)
# : 온도 압력 강도

library(readxl)
chemical <-read_excel("D:\\Workspace\\RegressionModel\\RegressionModel_Assignment\\p78.xlsx",1)
head(chemical)
summary(chemical[,-1])
cor(chemical[,-1])
chemical.lm=lm(LOSS~SPEED+TEMP, data=chemical)
summary(chemical.lm)
install.packages("car")

par("mar")
par(mar=c(1,1,1,1))

library(car)
avPlots(chemical.lm)
anova(chemical.lm)

plot(chemical$SPEED, chemical.lm$residuals)
identify(chemical$SPEED, chemical.lm$residuals)

plot(chemical$TEMP, chemical.lm$residuals)
identify(chemical$TEMP, chemical.lm$residuals)

plot(chemical.lm$fitted.values, chemical.lm$residuals)
abline(h=0, lty=2)
identify(chemical.lm$fitted.values, chemical.lm$residuals)
