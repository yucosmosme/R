#회귀모형 대체과제
#제2장 연습문제 2번 (p.86)
# : 온도 압력 강도
# 

library(readxl)
hardness <-read_excel("D:\\Workspace\\RegressionModel\\RegressionModel_Assignment\\ch02_no02.xlsx")
head(hardness)

#(1)회귀모형을 추정하라
hardness.lm=lm(Y~X1+X2, data=hardness)
summary(hardness.lm)
#회귀방정식: Y hat = -554.5267 - 0.1743X1 + 11.8449X2

#(2)오차분산을 MSE로 추정하고 Var(b0), Var(b1), Var(b2)의 추정치를 구하라
anova(hardness.lm)
X=hardness[,c(1:2)]
X=cbind(1,X)
Y=hardness[,3]
X=as.matrix(X)
Y=as.matrix(Y)
XTX=t(X)%*%X
XTX
XTY
XTXI=solve(XTX)
XTY=t(X)%*%Y
beta=XTXI%*%XTY
beta=round(beta,3)
beta
var()
#오차분산 = E(잔차평균제곱MSE) = 469.4

#(3) X1=200, X2=59에서 평균 제품의 강도의 추정치 Y HAT은 얼마인가? 이 Y HAT의 분산을 추정하라.
#(1)에서 구한 회귀모형에 값 대입하면, Y HAT = 109.4624
# Y HAT의 분산: ????????

#(4)추정된 회귀계수 b1,b2의 의미는 무엇인가?
#다른 변수가 상수로 고정되어 있을 때, b1인 경우 X1이 1만큼 증가한다면 
#종속변수 Y가 -0.1743만큼 평균적으로 감소하고
#b2인 경우 X2가 1만큼 증가할 때 11.8449만큼 평균적으로 증가함을 의미한다.

#(5)분산분석표를 작성하고 a=0.05로 F-검정을 행하라
anova(hardness.lm)
summary(hardness.lm)
# F값 7.383에 대한 유의확률 p-값=0.03218 로 유의수준 0.05보다 작으므로 귀무가설 기각, 적합된 중회귀모형이 유의함.

#(6)결정계수 R2을 구하라
summary(hardness.lm)
#결정계수 = Multiple R-squared = 0.747


#(7) X1,X2,Y를 모두 표준화시키고 표준화된 중회귀방정식을 구하라
install.packages("lm.beta")
library(lm.beta)
hardness.beta=lm.beta(hardness.lm)
print(hardness.beta)
summary(hardness.beta)
coef(hardness.beta)
# Y^*=-0.05499X1 + 0.88252X2
