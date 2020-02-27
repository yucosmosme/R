#위치확인 Get working directory
getwd()

install.packages('readxl')
library(readxl)

df1 <- read.csv("C:\\Users\\Admin\\Desktop\\R PRACTICE\\tr_mod.csv")
dim(df1)

#read.csv는 컴마로 구분된 파일만 가져옴 
#(컴마 이외의 구분자는 table로 가져온다 구분자는 sep명령으로 지정...)
df2 <- read.table("C:\\Users\\Admin\\Desktop\\R PRACTICE\\test_flow_age_201804.csv", sep=",")
dim(df2)

df5 <- read_excel("C:\\Users\\Admin\\Desktop\\R PRACTICE\\train_bike.xlsx")
dim(df5)

#structure 구조
str(df1) 

#histogram 막대그래프
hist(df1$Age)

#barplot(df1$Ticket)
boxplot(df1$Age)

install.packages("dplyr")
library(ggplot2) #그래프 패키지
library(dplyr) #데이터처리 패키지

ggplot(df1, aes(x=Sex)) + geom_bar()#y축이 없어서 빈도만 보여줌
ggplot(df1, aes(x=Sex, y=Fare)) + geom_col()#x축과 y축 모두 설정
ggplot(df1, aes(x=Age, y=Fare)) + geom_point()
str(df1)
df1

df6 <- read_excel("C:\\Users\\Admin\\Desktop\\R PRACTICE\\moving_dataset_skt\\table_define.xlsx",sheet=4)
df6
dim(df6)
list.files("C:\\Users\\Admin\\Desktop\\R PRACTICE\\moving_dataset_skt\\year_moving")
#폴더안에 들어있는 파일의 리스트를 보여줌

df1804 <- read.table("C:\\Users\\Admin\\Desktop\\R PRACTICE\\moving_dataset_skt\\year_moving\\test_flow_age_201804.csv", sep="|", header=TRUE)#헤더명은 행에서 제외됨
df1805 <- read.table("C:\\Users\\Admin\\Desktop\\R PRACTICE\\moving_dataset_skt\\year_moving\\test_flow_age_201805.csv", sep="|", header=TRUE)
df1806 <- read.table("C:\\Users\\Admin\\Desktop\\R PRACTICE\\moving_dataset_skt\\year_moving\\test_flow_age_201806.csv", sep="|", header=TRUE)
df1807 <- read.table("C:\\Users\\Admin\\Desktop\\R PRACTICE\\moving_dataset_skt\\year_moving\\test_flow_age_201807.csv", sep="|", header=TRUE)
df1808 <- read.table("C:\\Users\\Admin\\Desktop\\R PRACTICE\\moving_dataset_skt\\year_moving\\test_flow_age_201808.csv", sep="|", header=TRUE)
df1809 <- read.table("C:\\Users\\Admin\\Desktop\\R PRACTICE\\moving_dataset_skt\\year_moving\\test_flow_age_201809.csv", sep="|", header=TRUE)
df1810 <- read.table("C:\\Users\\Admin\\Desktop\\R PRACTICE\\moving_dataset_skt\\year_moving\\test_flow_age_201810.csv", sep="|", header=TRUE)
df1811 <- read.table("C:\\Users\\Admin\\Desktop\\R PRACTICE\\moving_dataset_skt\\year_moving\\test_flow_age_201811.csv", sep="|", header=TRUE)
df1812 <- read.table("C:\\Users\\Admin\\Desktop\\R PRACTICE\\moving_dataset_skt\\year_moving\\test_flow_age_201812.csv", sep="|", header=TRUE)
df1901 <- read.table("C:\\Users\\Admin\\Desktop\\R PRACTICE\\moving_dataset_skt\\year_moving\\test_flow_age_201901.csv", sep="|", header=TRUE)
df1902 <- read.table("C:\\Users\\Admin\\Desktop\\R PRACTICE\\moving_dataset_skt\\year_moving\\test_flow_age_201902.csv", sep="|", header=TRUE)
df1903 <- read.table("C:\\Users\\Admin\\Desktop\\R PRACTICE\\moving_dataset_skt\\year_moving\\test_flow_age_201903.csv", sep="|", header=TRUE)

df111 <- data.frame(x=1:3, y=1:3)
df222 <- data.frame(x=1:3, y=1:3)

rbind(df111, df222)

all_dat <- rbind(df1804, df1805, df1806, df1807, df1808, df1809, df1810, df1811, df1812, df1901, df1902, df1903)
nrow(all_dat)

getwd()
ggplot(all_dat, aes(HONG_))
str(all_dat)


print(10)

#기본 연산자
3+5
3/5
3+5
3/6

a <- 5
a <-"Hello"

mtcars #basic dataset R offers
dt <- mtcars

View(dt) #데이터를 표로 만들어줌. Capitalize Z

dim(dt) # shows how many #s the data has

head(dt)

tail(dt)

summary(dt)

class(dt)

a <- c(3,4,5,6,2) #R의 기본적인 자료형 단위 벡터

plot(a) #벡터를 그래프로 만들어줌

val <- c(1,2,3,4,5)

##Statistics
mean(val) #평균
sd(val) #표준편차
var(val) #분산
max(val)
median(val) 
IQR(val)
quantile(val)

vec <- c("Hello", "I", "am")
paste(vec, collapse = ",")
#벡터들을 쉼표로 연결

?paste #명령어, 데이터 궁금할때

search() #shows basic packages R offers

#install.packages("ggplot2") 
#한번 설치하면 되니까 샵으로 눌러줌
#need to know the name of package you want to install

library(ggplot2)
#패키지 쓰려면 library로 불러오는데 r 새로 실행할때마다 매번 불러와야함

search()#check if its successfully installed

qplot(a)
?qplot

a <- 5L 
a1 <- 5.0
a2 <- "str"
a3 <- factor(c('가수','영화인'))
a4 <- factor(c(1,2,3), ordered = T)

is(a)
is(a1)
is(a2)
is(a3)
is(a4)

#일반수치형변수 integer, numeric
#범주형변수 factor orderic
#근데 모두 vector이다

lista <-
  # 통계학에서 행 observation 열 variable
  
str(mtcars)
?str #shows structure of dataset

df <- ggplot2::mpg
str(df)
