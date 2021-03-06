install.packages('readxl')
library(readxl)
market <- read_excel("C:\\Users\\Admin\\Desktop\\R PRACTICE\\market-1.xlsx")
dim(market)
str(market)
plot(market$광고료, market$총판매액, xlab="광고료", ylab="총판매액", pch=19)
title('광고료와 총판매액의 산점도')
market.lm=lm(총판매액~광고료, data=market)
summary(market.lm)
abline(market.lm)
anova(market.lm)
pred.frame=data.frame(광고료=seq(3.5, 14.5,0.2))

