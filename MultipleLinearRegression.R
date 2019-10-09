market2<-read.table("C:\\Users\\Admin\\Desktop\\R PRACTICE\\market-2.txt",header=T)
dim(market2)
head(market2,3)
X=market2[,c(2:3)]
X=cbind(1,X)
Y=market2[,4]
X=as.matrix(X)
Y=as.matrix(Y)
XTX=t(X) %*% X
str(market2)
XTXI=solve(XTX)
XTY=t(X)%*%Y
XTY
beta=XTXI%*%XTY
beta
beta=round(beta,3)
beta
market2.lm=lm(Y~X1+X2, data=market2)
summary(market2.lm)
anova(market2.lm)
qf(0.95,2,12)
names(market2.lm)
yhat=market2.lm$fitted
cor(market2$Y,yhat)^2


#변수표준화
install.packages("lm.beta")
library(lm.beta)
market2.lm=lm(Y~X1+X2, data=market2)
market2.beta=lm.beta(market2.lm)
print(market2.beta)
coef(market2.beta)
summary(market2.beta)


pred.x=data.frame(X1=10,X2=10)
pc=predict(market2.lm, int="c", newdata=pred.x)
pc
summary(market2.lm)
 