a<-3:9
b<-3*a+5
plot(a,b, pch=18)

#getwd() 작업영역 확인
#setwd --> 작업영역 지정 편리함

#r은 벡타를 만들어나감 
#c는 요소들을 묶어주는 함수임

weight <-c(60, 72, 57, 90, 95, 72)
height <-c(1.75, 1.80, 1.65, 1.90, 1.74, 1.91)
bmi <- weight/height^2
bmi

#xbar = 평균 = xi의 합 / x의 개수
xbar <- sum(weight)/length(weight)
xbar

#표준편차

sd(weight)

mean(bmi)

#bmi의 mu(평균, mean)가 22.5가 맞는지 가설 검증
t.test(bmi, mu=22.5)



c("Huey", "Dewey", "Louie")
c(T,T,F,T)
bmi

#25보다 크면 true 아니면 false 반환
bmi > 25

#charactor 연결
cat(c("Huey", "Dewey", "Louie"))

#\n 다음라인으로 옮기기
#특수문자 넣으려면 앞에 백슬래시 넣어야함
cat("What is \"R\"?\n")

#series of numbers
a <- seq(4,9)
a

#행렬만들기 (dimention)
x <- 1:12
dim(x) = c(2,6)
x

#기본적으로 열 순서대로 먼저 채워지기때문에 byrow를 입력해서 행우선입력
gogogo=matrix(1:12, nrow=4, byrow = T)

apply(gogogo,2,min)
?apply

#이산형 자료형을 구릅인서팅할때 factor를 쓴다
?factor

?list




plot(weight, height, pch=3, col="pink")

hist(weight)

anova
