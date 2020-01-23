read<-read.csv('rtest.csv')
data<-data.frame(read)

#1)
data
View(data)
str(data)

#2) 칼럼 추가
library(dplyr)
data<-data %>% 
  mutate(resident2 = 
    ifelse(data$resident==1, "서울", 
     ifelse(data$resident==2, "인천", 
      ifelse(data$resident==3, "대전", 
      ifelse(data$resident==4, "대구", "시구군")))))
data

#3) 조건에 맞는 칼럼 추가
summary(data$age)
data<-data %>% 
  mutate(age2 = ifelse(data$age<=30, "청년층",
                       ifelse(data$age<=55, "중년층", "장년층")))
data
    
#4) adding a column, pie graph
data<-data %>% 
  mutate(gender2 = ifelse(data$gender==1, "남자", "여자"))

pies<-table(data$gender2) #빈도수 표 작성

install.packages("plotrix")
library(plotrix)
pie3D(pies, labels =pies)               

#5) 빈도수 구하고 막대그래프 
resGender <- data %>% 
  group_by(gender2, resident2) %>%
  summarise(n=n()) %>%
resGender  
ggplot(resGender, aes(x=resident2, y=n, fill=gender2)) + geom_col() + coord_flip()
library(ggplot2)

#6) 나이와 가격의 관계
plot(data$age, data$price)


#7) removing NA data
install.packages("hflights")
rm(hflights)
library(hflights)
str(hflights)
table(is.na(hflights$AirTime))

mean(hflights$AirTime, na.rm = T) #결측치 제외한 평균

#8)
hflights %>% select(AirTime) %>%
  summarise(sum = sum(AirTime, na.rm = T), cnt=n(), avg=sum/cnt)

str(hflights)  

#9) changing NA data to Average value and getting Mean
AirTime2 <- ifelse(is.na(hflights$AirTime), 108, hflights$AirTime) #결측치 평균값으로 넣어줌
mean(AirTime2) #평균값 구함

#10) getting SD, Var after changing NA data to Average
mean(hflights$ArrTime, na.rm = T) #결측치 제외한 평균
hflights$ArrTime <- ifelse(is.na(hflights$ArrTime), 1578, hflights$ArrTime) #결측치 평균으로 바꿔줌 
sd(hflights$ArrTime) # 표준편차
install.packages("psych")
library(psych)
describe(hflights$ArrTime) # 표준편차(다른방법)
var(hflights$ArrTime) #분산

