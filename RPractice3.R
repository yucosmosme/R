age <- 5:14
height <- c(104, 108, 119, 124, 137, 138, 149, 150, 156, 165)
plot(age, height, main = "age vs height")
lm1 <- lm(height~age)
summary(lm1)
names(lm1)
lm1$resid
sum(lm1$resid)
abline(lm1)
xbar=mean(age)
ybar=mean(height)
points(xbar, ybar, pch=15)
text(xbar, ybar,"9.5, 135")
text(locator(1), fx)
anova(lm1)
#identify(lm1$x, lm1$y)

lm1$fitted
sum(fitted)
y=height
sum(height)
sum(fitted*resid)
qf(0.95, 1, 8)
q.val=qt(0.975,8)
pred.frame=data.frame(X=seq(3.5, 14.5, 0.2))
