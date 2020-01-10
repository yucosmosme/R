dept <- c('개발부', '개발부', '개발부', '개발부','영업부', '영업부', '영업부', '영업부')

position <- c('과장', '과장', '차장', '차장','과장', '과장', '차장', '차장')

name <- c('김가윤', '고동산', '박기성', '이소균','황가인', '최유리', '김재석', '유상균')

salary <- c(5400, 5100, 7500, 7300, 4900, 5500, 6000, 6700)

worktime <- c(15, 18, 10, 12, 17, 20, 8, 9)

df <- data.frame(dept, position, name, salary, worktime)

str(df)
summary(df)

#-----------------------------------------
#aggregate: 데이터의 특정 컬럼을 기준으로 통계량을 구해주는 함수
#aggregate(컬럼명~그룹컬럼명,데이터,적용함수)
aggregate(salary~dept,df,mean) #부서별 연봉 평균
aggregate(cbind(salary,worktime)~dept, df, mean) #부서별평균 연봉과 평균 근무시간
aggregate(salary~dept+position,df,mean) #부서/직책별 평균 연봉

library(dplyr)
df %>% summarise(mean(salary))#연봉평균구하기
df %>% summarise(avg=mean(salary))#변수이름 avg붙이기기
df %>% group_by(dept) %>% summarise(avgsal = mean(salary), sumsal=sum(salary), avgwork=mean(worktime))#부서별연봉평균구하기

#------------------------
#정렬
v1<-c(100,10,200,3,11)
v1
sort(v1, decreasing = T)
df %>% arrange(desc(dept), position,name) # 부서(내림차순),직책,이름순으로 정렬

#---------------------------------
#칼럼추가
df$tax <- df$salary*0.1 #칼럼추가
df %>% mutate(tax=salary*0.1, timesal=salary/worktime) #세금칼럼, 시간당시급 칼럼 추가

#과장중에 시급이 제일 높은 2명 추출
df %>% filter(position=='과장') %>% mutate(timesal=salary/worktime) %>% arrange(timesal) %>% tail(2) 

#---------------------------------------------
df<-read.table(file='clipboard', header = T)
df
str(df)
#객실번호를 팩터로 변경
df$room_number = as.factor(df$room_number)
str(df)

#방종류별 평균가격 출력
aggregate(price~type,df,mean)

#-----------------------------------------------
#merge(합칠자료, 합칠자료, by=c(합칠기준))
id <- c('F1', 'F2', 'F3', 'F4')
name <- c('김가인', '박지성', '고아라', '이승철')
age <- c(24, 32, 18, 40)
df1<-data.frame(id,name,age)
df1

id <- c('F2', 'F1', 'F4', 'F3')
name <- c('박지성', '김가인', '이승철', '고아라')
score <- c(95, 100, 56, 73)
df2<-data.frame(id,name,score)
df2

cbind(df1,df2)
df3=merge(df1,df2,by=c('id','name'))
df3

#--------------------------------------
#merge
s<-read.table(file='clipboard', header=T)
s
t<-read.table(file='clipboard', header=T)
t
merge(s,t, by='class')
left_join(s,t,by='class')

#--------------------------------------
#제어문
5%%3 #나머지
a=3
b=2
a==b
a!=b

#if(조건식){
  
#}else{
  
#}
score<-scan()
if(score>=90){
  cat(score,'is A') #cat: 변수랑 문자 같이 출력
}else if(score>=80){
  cat(score,'is B')
}else{
  cat(score,'is C')
}

#ifelse(조건, 참, 거짓)
#switch(비교구문,실행1,실행2)
switch('age',id='mini',hobby='exersizing',age='32',addr='Bucheon') #age에 해당하는 값 반환

#which(조건)
name<-c('kim','lee','park','choi','min')
score<-c(90,80,70,20,40)
df <-data.frame(name,score)
df
which(name=='choi')  #name이 choi인 사람의 index값 출력
which(score==20)

#--------------------------------
#for(변수 in 값){}
v1<-c(1:10)
v1
v2<-numeric()
v2
for (i in v1){
  v2[i]<-i*3}  #3의 배수 10개 출력

for (i in v1){
  if(i%%2==1)
    print(i)  # 홀수 출력
}

#----------------------------
#while(조건){}
i=0
while(i<10){
  print(i)
  i=i+1
}

#-----------------------------
#변수<-function(매개변수){}
hi<-function(){
  print('you\'re awesome!')
}
hi()

hi2<-function(x){
  cat(x,'you\'re awesome!')
}
hi2('워니, ')


df<-read.table(file='clipboard',header=T)
head(df)
str(df)
summary(df)
table(df$A) #데이터의 빈도를 보여줌(ex.1은 30번 나옴...)
dim(df) #행개수,열개수
dim(df)[2] #열개수
length(df) #벡터의 길이 또는 데이터프레임의 열의 개수
v1<-c(1,2,3,4,5)
v1[4]
f1<-function(d){
  for(i in 1:dim(d)[2]){
  for 
    print(i)
    print(table(d[i]))
}
}
f1(df)

#-----------------------------------------
#구구단
gugu<-function(dan){
  cat(dan,'단\n')
  for (i in 1:9){
    cat(dan,'*',i,'=',dan*i,'\n')
  }
}
gugu(3)

#-----------------------------------------
v1<-c(10,20,5,4,40,7,NA)
v1
mean(v1) #결측치있어서 계산불가
mean(v1,na.rm = T) #결측치 제외하고 연산
is.na(v1)  # 결측치여부확인
v2<-ifelse(is.na(v1),0,v1) #v1이 결측치이면 0으로 바꾸고 아니면 원래 값 v1으로 넣어라.
mean(v2)
v3<-ifelse(is.na(v1),round(mean(v1,na.rm = T),2),v1) #v1이 결측치이면 v1의 결측치제외 평균값으로 넣어라...(0으로 넣으면 값이 너무 극단적으로 나오므로...)
mean(v3)
v3

#----------------------------------------
#막대그래프 그리기
v1<-c(305,450,320,460,330,480,380,520)
names(v1)<-c('18년1분기','18년2분기','18년3분기','18년4분기','19년1분기','19년2분기','19년3분기') #열에 이름 붙이기
v1
barplot(v1,ylim = c(200,600),main = '그래프제목',ylab='매출액', col=rainbow(8))  
#rainbow색 8개 랜덤으로 
#ylim: y데이터를 200~600으로 제한시킴(그래프 잘보이게)

barplot(v1,main = '그래프제목',xlab='년도별 분기', ylab='매출액', col=heat.colors(8),horiz=T, space=1) 
#heat.color따뜻한색 8개 랜덤으로 
#space: 막대 간 간격주기

colors() #R에서 제공하는 색모음

pie(v1, col=topo.colors(8),border = 'red')


#-----------------------------
#도시,나이별 사망률 막대그래프
VADeaths
barplot(VADeaths, col=cm.colors(5))

barplot(VADeaths, main='지역별사망률', col=cm.colors(5), beside = T)
#beside누적안되게

#범주박스 만들기
legend(17,70,c('50-54','55-59','60-64','65-69','70-74'),fill=topo.colors(5), cex=0.8) #cex 글씨크기

#---------------------------
#boxplot : 이상치확인이 용이하다.
#주문후 음식 나오기까지소요된 시간
storeA <- c(20,21,23,22,26,28,35,35,41,42,43,45,44,45,46,47,47,46,47,58,58,59,60,56,57,57,80)
mean(storeA)

storeB<- c(5,6,11,13,15,16,20,20,21,23,22,27,27,30,30,32,36,37,37,40,40,43,44,45,51,54,70,600)
mean(storeB)
boxplot(storeA)
boxplot(storeB) #주문이 누락되어 음식이 늦게 나옴...

#-> 잘못된 데이터 제외하고 통계치 구하기
storeB = storeB[storeB<600]
mean(storeB)
boxplot(storeB)
#이상치 제거했더니 storeB가 A보다 음식 더 빨리 나온다....

boxplot(storeA,storeB, names=c('a식당','b식당당'))

#히스토그램
hist(storeA)
hist(storeB, breaks = 4) # 구간 4개로 나누기

#분산
var(storeA)
var(storeB)

#표준편차
sd(storeA)
sd(storeB)

#----------------------------
#p.133 연습문제
#Q1
mpg
a = mpg %>% filter(mpg$displ<=4)
a
mean(a$displ)
b = mpg %>% filter(mpg$displ>=5)
b
mean(b$displ)

#Q2 toyota
a = mpg %>% filter(manufacturer=='audi')
a
mean(a$city)
b = mpg %>% filter(manufacturer=='toyota')
b
mean(b$city)

#Q3
# %in% : 변수의 값이 지정한 조건 목록에 해당하는지 확인해줌
a = mpg %>% filter(manufacturer %in% c('chevrolet','ford','honda' ))
a
mean(a$highway)

#p.141
#Q1
a = mpg %>% filter(manufacturer=='audi') %>% arrange(desc(highway)) %>% head(5)
a

#p.150
#Q1 차종별 도시연비 평균 요약 후 높은 순 정렬
a = mpg %>% group_by(class) %>% summarise(mcty = mean(city)) %>% arrange(mcty)
a

#Q3 
a = mpg %>% group_by(manufacturer) %>% summarise(mhwy = mean(highway)) %>% arrange(desc(mhwy)) %>% head(3) 
a

#Q4
a = mpg %>% group_by(manufacturer) %>% filter(class == 'compact') %>% summarise(n=n()) %>% arrange(desc(n)
a

 
                                                                                               