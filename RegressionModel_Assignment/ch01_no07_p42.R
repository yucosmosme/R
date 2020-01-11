#회귀모형 대체과제
#제1장 연습문제 7번 (p.42)
# : 회사의 10년간 판매실적

library(readxl)
sales <-read_excel("D:\\Workspace\\RegressionModel\\RegressionModel_Assignment\\ch01_no07.xlsx")
head(sales)
#(1)회귀방정식을 구하고 분산분석표를 보여라
sales.lm=lm(y ~ x, data=sales)
summary(sales.lm)
#회귀방정식: Y hat=94.582+33.048X
anova(sales.lm)

### (2) 각xi에서 yi hat과 잔차 yi-yi hat을 구하고 잔차그림을 그려라
#잔차가 가장 큰 연도는 언제인가?
names(sales.lm)
sales.lm$residuals
sales.lm$fitted.values
cbind(sales, sales.lm$residuals, sales.lm$fitted.values)
plot(sales$x, sales.lm$residuals, xlab="연도", ylab="잔차", pch=19)
title("<각 년도별 잔차그림>")
