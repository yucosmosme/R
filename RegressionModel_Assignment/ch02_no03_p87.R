#회귀모형 대체과제
#제2장 연습문제 3번 (p.87)
# : 물소비량, 온도, 작업일수, 작업량

library(readxl)
water <-read_excel("D:\\Workspace\\RegressionModel\\RegressionModel_Assignment\\ch02_no03.xlsx")
head(water)

#(1)회귀방정식을 구하라
water.lm=lm(YY~XX1+XX2+XX3, data=water)
summary(water.lm)
#회귀방정식: Y hat =  2.409213 + 0.069788 XX1 - 0.024767 XX2 + 0.005864 XX3

#(3)분산분석표를 작성하고 결정계수 R2을 구하라
anova(water.lm)
#결정계수 = Multiple R-squared = 0.9202

#(4)XX1=20, XX2=27, XX3=60 에서 평균 물소비량을 추정하라.
#Y hat =  2.409213 + 0.069788 XX1 - 0.024767 XX2 + 0.005864 XX3 에 값 대입하면
#YY^= 평균 물소비량 추정값 = 3.488104 
