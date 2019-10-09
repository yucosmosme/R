library(readxl)
glider=read_excel("C:\\Users\\Admin\\Desktop\\R PRACTICE\\sugarglider.xlsx")
head(glider)
logit_m1<-glm(occurr~p_size_km+con_metric, family=binomial(link=logit), data=glider)
summary(logit_m1)
attach(glider)

1-pchisq(26.92-24.11,2)
logit_m0 <- glm(occurr~1, family=binomial(link=logit), data=glider)
anova(logit_m0, logit_m1, test="Chisq")

1-pchisq(24.110,17)

logit_m2 <- glm(occurr~p_size_km, family=binomial(link=logit), data=glider)
summary(logit_m2)
anova(logit_m2, logit_m1, test="Chisq")

p_size <-seq(20,230,1)
hat_eta <-predict(logit_m2, list(p_size_km=p_size), type="link")
par(mfrow=c(1,2))
plot(p_size_km, occurr, xlab="구획의 크기(x)", ylab="hat pi(x) \\occurr", sub="(a)", pch=20)
lines(p_size, exp(hat_eta)/(1+exp(hat_eta)), lwd=1.5, col="red")

glider_g <- read_excel("C:\\Users\\Admin\\Desktop\\R PRACTICE\\sugarglider.xlsx")
head(glider_g)
plot(glider_g$p_size_km, glider_g$ca)