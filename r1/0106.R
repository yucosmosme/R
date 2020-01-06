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
