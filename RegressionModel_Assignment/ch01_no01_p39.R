#회귀모형 대체과제
#제1장 연습문제 1번 (p.39)
# : 기계들의 사용연도(age)와 정비비용(cost)간의 관계

library(readxl)
machine <-read_excel("D:\\Workspace\\RegressionModel\\RegressionModel_Assignment\\ch01_no01.xlsx")
head(machine)

#(1)데이터의 산점도
plot(machine$age, machine$cost, xlab="사용년도", ylab="정비비용", pch=19)
title("<사용연도와 정비비용간의 산점도>")

#(2)최소제곱법에 의한 회귀직선 적합
machine.lm=lm(cost ~ age, data=machine)
summary(machine.lm)
abline(machine.lm, col="red")

#(3)추정치의 표준오차
summary(machine.lm)
# Sy.x = square root of MSE = Residual standard error = 0.9639

#(4) 결정계수와 상관계수
summary(machine.lm)
#결정계수 = Multiple R-squared = 0.9786
#상관계수 = 결정계수의 제곱근 = 0.9892

#(5) 분산분석표 작성, 회귀직선의 유의여부 검정(유의수준 a=0.05사용)
anova(machine.lm)
# p-값이 9.504e-11 로 매우 작으므로 귀무가설 기각, 회귀직선 유의함

#(6) 사용년도가 4년인 기계의 평균정비비용 추정
#(4)summary를 통하여 y hat = 29.107 + 13.637 x임을 알 수 있다.
#x에 4대입하면 y hat = 83.655, 기계의 평균 정비비용은 약 83,655원.0

#(7) 잔차와 잔차의 합
names(machine.lm)
machine.lm$residuals
sum(machine.lm$residuals)
#잔차의 합이 0에 가까운 매우 작은 값임을 알 수 있다.

#(8) 잔차들의 xi에 대한 가중합
sum(machine$age * machine.lm$residuals)
  
#(9) 잔차들의 yi에 대한 가중합
sum(machine$cost * machine.lm$residuals)

#(10) 두변수 X,Y를 표준화된 변수로 고친 후 회귀직선 적합,
#그 회귀계수가 두 번수 X, Y간의 상관계수와 같음을 밝혀라.
machine2 <- transform(machine, z.age = scale(age), z.cost = scale(cost))
plot(machine2$z.age, machine2$z.cost, xlab="표준화된 사용년도", ylab="표준화된 정비비용", pch=19)
title("<표준화된 사용연도와 정비비용간의 산점도>")
machine2.lm=lm(z.cost ~ z.age, data=machine)
abline(machine2.lm, col="red")

summary(machine2.lm)
summary(machine.lm)
#위의 상관계수(Multiple R-squared 의 제곱근) 동일
