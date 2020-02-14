#빅데이터 치킨집(출처: localdata.kr)

install.packages("rJava")
Sys.setenv(JAVA_HOME='C:/Program Files/Java/jdk1.8.0_221')
library(xlsx)
library(rJava)
f<-read.xlsx('food1.xlsx', sheetIndex = 1, encoding ='UTF-8')
head(f)
head(f$소재지전체주소)
str(f)
names(f)
f$dong<- substr(f$'소재지전체주소',11,14)
f
f$dong<-gsub('[0-9]','',f$dong) #0~9번째 글자 사이에 있는 공백을 찾아서 지워라... 
?gsub
table(f$dong)
df2<-data.frame(table(f$dong))
df2
install.packages("treemap")
library(treemap)
treemap(df2, index = 'var1', vSize = 'Freq', title='구로구 치킨집 개수수')

library(dplyr)
df2 %>% arrange(desc(Freq))

#------------------------------------
install.packages("readxl")
library(readxl)
df<-read_excel('air.xlsx')
df1<- df %>% filter(측정소명 =='구로구' | 측정소명 =='도봉구')
View(df1)
table(df1$측정소명)

guro<-df1 %>% filter(측정소명 == '구로구')
dobong<-df1 %>% filter(측정소명 == '도봉구')
boxplot(guro$미세먼지, dobong$미세먼지, names=c('구로구','도봉구'), main='18년도 4분기 미세먼지 비교교')


#----------------------------------------
#오라클 연동
install.packages("DBI")
install.packages("RJDBC")
library(DBI)
library(rJava)
library(RJDBC)

#오라클 연결
drv<-JDBC("oracle.jdbc.driver.OracleDriver","D:/app/hong/virtual/product/12.2.0/dbhome_1/jdbc/lib/ojdbc8.jar")
conn<-dbConnect(drv, "jdbc:oracle:thin:@//127.0.0.1:1521/orcl","c##minnie","1111")

#sql문 실행
sql<-"select*from emp where sal>2000"
dbGetQuery(conn,sql)
sql<-"select*from emp order by job"
data<-dbGetQuery(conn,sql)
data
str(data)

#insert
sql<-"insert into emp values(1,'둘리','사원',7566,sysdate,100,0,30)"
dbSendUpdate(conn,sql)
sql<-"select * from emp"
dbGetQuery(conn,sql)

#update
sql<-"update emp set sal=9999 where deptno=20"
dbSendUpdate(conn,sql)
sql<-"select * from emp"
dbGetQuery(conn,sql)

sql<-"delete from emp where jOb = 'MANAGER'"
dbSendUpdate(conn,sql)
sql<-"select * from emp"
dbGetQuery(conn,sql)

#DB연결종료
dbDisconnect(conn)

#------------------------------------------
# 특정 열 조회하기
df<-read.csv(file='전처리.csv', header = T)
df
str(df)
head(df$age)
head(df[4])
head(df[c('gender','job')])
head(df[c(2:4)])
summary(df)

#결측치
mean(df$age,na.rm = T)
nalee<-na.omit(df$age)#결측치 제거하기
length(nalee) #데이터 개수 줄어듦
length(df$age)
df1<-na.omit(df)
str(df1)

#결측치이면 0으로 바꾸기
df$price2<-ifelse(is.na(df$price),0,df$price)
View(df)

#결측치이면 평균으으로 바꾸기
df$price3<-ifelse(is.na(df$price),round(mean(df$price,na.rm = T),1),df$price)
View(df)
df[c('price','price2','price3')] #각 열 불러오기

#극단치 처리
summary(df)
table(df$gender) #성별이므로 0, 5는 잘못된 데이터일것.
df2<-subset(df,gender==1 | gender==2)
table(df2$gender)

boxplot(df$price) #극단치가 너무 많음을 알 수 있다.
df2<-subset(df, price<=8 & price>=2)
boxplot(df2$price)


summary(df2)
df2<-subset(df,age=is.na(F))# 결측치 제거????????????????????
boxplot(df2$age)
boxplot(df$age)
table(df$age)
str(df2)
View(df)

#--------------------------------
mpg<-as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212), "hwy"]<-NA
mpg

table(mpg$hwy, mpg$drv)
table(mpg$drv)
