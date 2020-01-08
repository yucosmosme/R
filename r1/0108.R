f<-read.table(file = 'clipboard')
f<-read.csv(file='1018sample.csv',header=T)
f
f<-read.table(file.choose(),header=T)
install.packages('xlsx')
library(xlsx)

#sheetindex 몇번째 시트인지.
f<-read.xlsx('friend.xlsx',sheetIndex = 1, encoding = 'utf-8', header = F)
f
str(f)

#헤더붙이기(변수명지정)
names(f)<-c('번호','이름','키','몸무게게')

data()
#R에서 제공하는 기본자료로 테이블 파일 만들기
write.table(cars,'cars1.txt')
#행번호 없고, 따옴표 없이, 구분자 쉼표 붙여서
write.table(cars,'cars2.txt', row.names = F, quote = F, sep = ',')

write.xlsx(cars,'cars.xlsx')

#------------------
#cat: 변수와 문자를 같이 출력시켜줌
a='바보'
print('a=',a) #문자와 변수 같이 출력 안됨(프로그래밍언어와다른점) -> cat을 써야함
cat('a=',a) 

#---------------------
#as.xxx: 형변환시켜줌
#fruit데이터들을 factor형으로 바꿔줌 (각각 1,2,3의 level을 가짐)
fruit=c('수박','짭짜리','황도','짭짜리','수박')
fruit
f1<-as.factor(fruit)
f1
mode(f1)
str(f1)
#아래처럼 수박을 제외하고 level을 주면 NA(not available)이 뜨고 수박 표시 안된다...
f2<-factor(fruit,levels=c('황도','짭짜리'))

#------------------------
result<-c('수','우','미','양','가')
result
f1<-as.factor(result)
f1 #그냥 넣으면 순서가 뒤죽박죽 ->order를 준다.
f2<-factor(result,ordered=T, levels = c('수','우','미','양','가'))
f2

#-------------------
v1<-c(100,90,80,100,80,80)
f1<-factor(v1)
f1
as.numeric(f1) #factor형을 숫자로 바꾸면 levels값(1,2,3...)이 숫자로 바뀐다.
as.character(f1)


#------------------
#일부데이터만 가져오기
iris
str(iris)
head(iris)
tail(iris)
iris[c(3,5),2] #3행,5행, 2열의 데이터 보기
iris[,c(3,5)] #모든행, 3열, 5열 보기

head(iris[,c(3,5)]) #head같이 보이게 
head(iris$Sepal.Length) #petal.length벡터 중 처음 6개만 보여주기
head(iris[,c("Petal.Length","Species")]) 
head(iris$Species)
iris$Petal.Length[c(2,3)] #petal.length의 값 중에서 2,3행값보기

summary(iris$Sepal.Length)

#------------------------------
#subset(데이터프레임, 조건)

subset(iris, iris$Sepal.Width>4&iris$Sepal.Length>5) #조건 충족하는 데이터의 모든게나옴

subset(iris, iris$Sepal.Width>4&iris$Sepal.Length>5, c('Sepal.Width', 'Sepal.Length')) #조건 충족하는 데이터 중 보고싶은 벡터만 불러오기

iris$Sepal.Length>5 #참거짓

#----------------------------
#boolean추출. 참인열만 추출
head(iris[iris$Sepal.Length>5,])
#조건충족하는 모든 열 추출

head(iris[iris$Sepal.Length>5,c(T,F,F,F,T)]) #TFFFT 5열 중에 첫째, 마지막 열만 출력(TRUE)

#-------------------
#조건추출
f<-read.xlsx('friend.xlsx',sheetIndex = 1, encoding = 'utf-8', header = F)
names(f)<-c('no','name','height','weight')
f
#아래 다섯개 모두 같은 결과 반환
subset(f,f$height>=165,c('name','height'))
f[f$height>=165,c(2,3)]
f[f$height>=165,c('name','height')]
f$height>=180
f[c(T,T,F),c(F,T,T,F)]

#----------------------
#sql문으로 실행하기: sqldf('쿼리문')
install.packages("sqldf")
library(sqldf)
longley
head(longley,1)
sqldf('select "GNP.deflator", GNP, Unemployed from longley where GNP>300')
sqldf('select year, sum(GNP) from longley group by year')

#----------------------------
save(f,file = 'ex1.rda')
load('ex1.rda') #메모리에 로드
dim(f) #: 데이터 차원 보여줌...ex. 3행 4열

save(f,file = 'ex2.rda')
load('ex2.rda')

#--------------------
library(ggplot2)
mpg
m<-data.frame(ggplot2::mpg) #ggplot2패키지에 있는 mpg데이터를 데이터프레임으로 만들어서 m변수에 넣어라

install.packages("dplyr")
library(dplyr)
f

f<-rename(f,키=height) #변수명바꾸기
f$total<-f$weight+f$키 #total이라는 새로운 변수 넣기

f$result<-ifelse(f$total>250,'good','evenbetter')  #조건맞으면'good'아니면'evenbetter 넣기
f

#조건 2개
f$result<-ifelse(f$total>250,'good',
                 ifelse(f$total>210, 'evenbetter', 'petit'))
f

#---------------
#filter (subset하고 같다.)
iris %>% filter(iris$Sepal.Length>5 & iris$Sepal.Width>4) #조건 만족 추출
iris2<-iris %>% filter(iris$Sepal.Length>5 & iris$Sepal.Width>4) %>% select(Sepal.Length, Sepal.Width) #조건 만족 데이터중에 내가 보고싶은 열만 추출해서 가져오기.
iris2
iris2$remark<-'..' #새로운 열 만들기. 값 ..라고 넣어줌
iris2[,c(2:3)]<-NULL #2,3열 삭제

#--------------------------
# (1) 결측값이 포함되어 있는지 확인: is.na()
# (2) 결측값이 총 몇 개인지 계산: sum(is.na())
# (3) 결측값을 통계 분석 시 제외(미포함): na.rm = TRUE
# (4) 결측값이 들어있는 행 전체를 데이터 셋에서 제거: na.omit()
# 출처: https://rfriend.tistory.com/34 [R, Python 분석과 프로그래밍의 친구 (by R Friend)]

#NA, NULL
v1<-c(1,2,NA,3)
v1
sum(v1) #유효하지않은값NA와의 합은 NA -> na.rm을 사용
sum(v1,na.rm = T)
??na.rm

v2<-c(1,2,NULL,3)
v2 #NULL값은 아예 보이지 않는다.-> sum 가능
sum(v2)

#변수의요약---------------
#범주형변수
g=c('남','여','남','여','남','여','남','여','여','여','여')
g=factor(g) 
g
t=table(g)
t
barplot(t) #막대그래프
pie(t) #원그래프
prop.table(t) #비율

#수치형변수
score=c(60,30,40,60,100,90,80,150)
sort(score) #순차정렬
sort(score, decreasing = T)
summary(score)
boxplot(score) #boxplot: 그림을 이용해 데이터 집합의 범위와 중앙값을 빠르게 확인할 수 있는 목적으로 사용한다. 또한 통계적으로 이상치(outlier)가 있는지도 확인이 가능하다.
hist(score)

#------------------------
#변수명변경, 조건에 맞으면 pass, 아니면 fail
mpg
head(mpg)
mpg<-rename(mpg, city = cty ) #변수명변경
mpg<-rename(mpg, highway = hwy )
mpg$total=mpg$city+mpg$highway
mpg$result<-ifelse(mpg$total>45,'pass','fail') #조건에 따라 새변수만들기기
head(mpg$result)
