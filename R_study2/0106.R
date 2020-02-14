#콘솔창에서 앞에 있는 [1] [2] 와 같은 숫자는 인덱스를 의미한다. 자바는 0부터 시작하지만, r과 오라클은 1부터 시작

#ctrl+L : 콘솔창 지우기
a=3
b=5
a+b
a=10

ls() 
#메모리에 올라간 변수목록
rm(list=ls()) 
#remove 제거

dim(available.packages())
#사용가능한 페키지 개수 보여줌

installed.packages()
#설치된패키지보여줌

install.packages("ggplot2")
#따옴표 필수

search() 
#메모리에 올라간 패키지보여줌. 설치만 한거는 안보임

library(ggplot2) 
#패키지 사용위해 매모리에 올려줌

#remove.packages("ggplot2") 
#패키지 제거

#r에서 제공하는 유명한 머신러닝 데이터들
data()
iris
cars

getwd() #get working directory. 현재 작업중인 경로 보여줌

#setwd('경로') : 작업경로 바꿔줌

write.table(iris,'iris.csv')
#파일 만들어줌. 옆에 file 목록에 올라감

write.table(iris,'iris2.csv', row.names = F)
#row.names = F열이름 False..열이름 
#저장하지 않겠다. 

write.table(iris,'iris2.csv', row.names = F, quote=F)
#quotation mark = False.. 따옴표 없애기

s<-read.table('s.csv', header=T, sep = ',')
#맨위에 header 있음 true
#seperator 구분자는 쉼표
s<-read.table(file='clipboard',header=T)
#클립보드에 있는 내용으로파일을 만들어서 s에 저장  
#->굳이 파일을 따로 만들지 않더라도 ctrl + c 한 내용이 들어감
s

name<-'미니'
age<-'32'
hobby<-'yoga'
is1004<-T #참거짓 -> logical

#mode : 데이터 변수형 알려줌
mode(name) 
mode(age)
mode(hobby)
mode(is1004)

#class : 데이터 구조. 값을 1개만 가질때는 mode와 class가 같지만, 데이터가 여러개이면 서로 달라짐
class(name) 
class(age)
class(hobby)
class(is1004)

#벡터: 1차원, 동일한자료------
#c(), seq(), rep()로 벡터를 생성한다.

#c(): Combine Values into a Vector or List
v1<-c(1,2,3,4,5)
v1
v1<-c(1:100)

#seq() - sequence연속된값
v2<-seq(3,30) #3부터30까지 연속된값
v2<-seq(3,30,by=4)#1부터 100까지, 3간격으로
v2<-seq(3,30,4)#위와 결과동일 
v2
v2+2 #각데이터에 연산가능

v5<-c(1,2) 
v6<-c(1,2,3,4)
v5+v6 #순서같은데이터 더해줌.순서 다를경우 데이터개수가 서로 배수관계에있어야함


#rep()
v3<-rep(1:5,3)#3번 repeat
v3

v1<-c(1,5,11:20,100,201:205)
v1

#벡터는 동일한 형태만 가질 수 있기 때문에 서로 다른 데이터를 넣으면 같은 데이터로 형변환시켜준다음 담음.
v2<-c("rm","jk","j-hope",T,F,TRUE,FALSE)
v2

v3<-c(3,4,TRUE, F)
v3

#is.xxxx(): 타입 확인해줌
is.numeric(v3)#숫자인지 판단해줌
is.character(3)
is.logical()

#as.xxxx():~로 바꿔줌
v4<-as.numeric(v3)#숫자로 바꿔줌
v4<-as.character(v3)
v4

v1<-c(1:100)
v1

#벡터의 데이터 불러오기
v1[9:13] #9부터 13까지데이터에 접근
v1[10,20,30,40]
#: incorrect number of dimensions : 4차원으로 인식함. -> 각각 다른위치에있는 변수 불라오려면 c바인드 해서 1차원으로 만든 후 불러와야 함.
v1[c(10,20,30,40)]
v1[c(1:38,40:50)]
v1[-39]# 값 제외하고 출력
v1[-50:-100]
v1[c(-50,-100)]


#matrix: 동일한 자료형을 갖는 2차원 matrix()
v1<-c(1:13)
v1
m1<-matrix(c(1:10)) #nx1행렬로 만들어줌

m1<-matrix(c(1:10), nrow=2)
#2행인 행렬로 만들어줌
m1

m1<-matrix(c(1:10), nrow=2, byrow = T) # 행기준정렬

m1<-c(1:10)
m2<-c(11:20)
m<-cbind(m1,m2)
m
mode(m) #데이터형은 numeric
class(m) #데이터구조는 matrix행렬

m3<-matrix(1:10,2) #행2개인 행렬 만들기
m3<-matrix(1:10,,2) #열2개인 행렬 만들기
m3

m3[1,3] #1x3에 있는 데이터 가져오기
m3[,3] #3열에 있는 데이터 가져오기
m3[1,] #1행에 있는 데이터 가져오기
m3[1,c(3,4)] #1행에 있는 데이터 중에서 3,4번째 데이터 가져오기
m3[2,-4] #2행에 있는 데이터 중에서 4번째 데이터 제외하고 가져오기

length(m3)#데이터개수
ncol(m3)#열개수
nrow(m3)#행개수


##다차원배열:동일한자료형을 갖는 array()
v1<-c(1:12)
v1
a1<-array(v1,c(3,2,2)) #v1행렬로 3x2배열 2개 만들어라.
a1
mode(a1)
class(a1) #데이터구조 array
a1[,,1] #첫번째 배열 전체 가져오기
a1[,,2] #두번쨰 배열 전체 가져오기


##List자료구조: 키와 값이 한쌍
l1<-list('yu','minnie',32)
l1

l2<-list(name=c('yu','kim'),age=c(32,28), home=c('부천','경기'))
l2
l2$age
l2$age[2] #$age의 2번째 값 반환
l2$age<-NULL #원소 제거


v6<-c(1:100)
v6
mean(v6)
max(v6)
min(v6)

#paste: 변수들을 합치기
v7<-c('home','sweet','home')
v7
paste(v7,collapse=',') #쉼표를구분자로 합쳐줌


## qplot : Quick plot 자료에 맞는 도표 자동으로 만들어줌.
##자료에 따라 그래프형태가 달라짐
##(자세한 도표는 ggplot으로 만들기)

v8 <- c("rm",'jk','jimin','jin','jk','jk','jin')
qplot(v8)

qplot(data=mpg, x=hwy)
qplot(data=mpg, x=cty)
qplot(data=mpg, x=drv, y=hwy)
qplot(data=mpg, x=drv, y=hwy, geom='line')
qplot(data=mpg, x=drv, y=hwy, geom='boxplot')
qplot(data=mpg, x=drv, y=hwy, geom='boxplot', colour=drv)

