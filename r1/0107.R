
install.packages('stringr')
library(stringr)
s<-'김길동50둘리10희동이5'

#문자열 추출
str_extract(s,"[0-9]") # 한개만 찾음
str_extract_all(s,"[0-9]") #다 찾음
str_extract_all(s,"[0-9]{1,3}") #{}붙여있는 글자는 3글자까지 묶어줌
str_extract_all(s,"[가-힣]{1,5}")
str_extract_all(s,"[^0-9]{1,5}")

#문자열 위치 찾기
str_locate(s, '둘리')
str_length(s) #문자열길이
str_sub(s, 4, str_length(s)-2) #s변수의 4번째 문자부터 뒤에서 2번째까지 자르기

s<-'Apple,Lemon'
str_to_lower(s)
str_to_upper(s)
str_replace(s, 'e','이') #한개만 바꾸기
str_replace_all(s, 'e','이') #다 바꾸기
str_c(s, '강가딘20') #문자붙이기

person <-c('둘리10','김길동50','희동이3')
person
s2<-paste(person, collapse = '-')
s2
str_split(s2, '-')

#데이터입출력
n<-scan() #콘솔창에 하나씩 입력하면  입력됨 
mode(n)
class(n)
c<-scan(what = character())

#데이터구조만들기
df<-data.frame()
df<-edit(df)
df

f<-read.table('0107test.txt', sep = ' ')
f
g<-read.csv('0107test2.csv')
g


x1<-c(1,2,3,4,5)
x2<-c(4,5,6,7,8)
union(x1,x2) #합집합
intersect(x1,x2) #교집합
setdiff(x1,x2) #x1-x2

name<-c('미니','미키')
gender<-c('여','남')
#범주형데이터 factor로 바꿔주기.
#남,여 2개의 level을 가짐.
#남자는 1 여자는 2 이런식으로 저장되지만, 팩터변수는 계산은 불가.
fgender<-as.factor(gender)
fgender

d<-'20-01-07'
mode(d)
d1<-as.Date(d)  #날짜형으로
mode(d1)
d2<-as.Date(d, '%y/%m/%d')
d2

v<-c(1:20)
v
m1<-matrix(data=v, nrow = 5)
m1
m1[2:4,2] # 2~4행x2열 값 반환
#apply 함수
apply(m1,1,max)  #행방향
apply(m1,2,min)  #열방향 

f1<-function(x){
  x+c(100,200,300,400,500)
}
apply(m1, 2, f1) #열방향으로 f1함수적용

#----------------
#데이터 프레임:2차원, 다른 데이터 유형을 가질 수 있다.
#1) 벡터를 이용한 생성
no<-c(1:3)
name<-c('kim','lee','park')
pay<-c(200,500,800)
df1<-data.frame(no,name,pay)
df1
mode(df1)
class(df1)
str(df1)
ncol(df1)
df1[2] #2열보여줌
df1[,3] #3행 보여줌
summary(df1)

#subset 조건에 맞는 데이터 검색
df2<-subset(df1,pay>=500)
df2<-subset(df1,pay>=200 & pay<800)
df2<-subset(df1,pay<200 | pay>=800)
df2


df4<-data.frame(제품=c('사과','딸기','수박'), 가격=c(1800,1500,3000),판매량=c(24,38,13))
df4
mean(df4$가격)
summary(df4)
library(tibble)
view(df)

library(ggplot2)
mpg
class(mpg)
str(mpg)
view(mpg) 
