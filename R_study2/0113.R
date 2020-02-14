df2
table(df2$resident)
df2$resident2[df2$resident==1]<-'서울'
df2$resident2[df2$resident==2]<-'인천'
df2$resident2[df2$resident==3]<-'대전'
df2$resident2[df2$resident==4]<-'대구'
df2$resident2[df2$resident==5]<-'시구군'
View(df2)

df2$job2[df2$job==1]<-'공무원'
df2$job2[df2$job==2]<-'회사원'
df2$job2[df2$job==3]<-'개인사업자'

df2$age2[df2$age<=35]<-'청년층'
df2$age2[df2$age>35 & df2$age<=55]<-'중년층'
df2$age2[df2$age>55]<-'장년층'

#----------------------------
# 두 범주형 변수의 관계 -> 막대그래프 barplot
df<-read.csv('age.txt')
df
table(df$GENDER)
table(df$AGE)
t1<-table(df$GENDER, df$AGE)
barplot(t1, legend=T, col=rainbow(2), beside = T)
#beside -> 막대가 누적으로 안보이고 따로 보임.

#--------------------------------
bloodType <- c('A','B','A','AB','O','A','O','B','A','O','O','B','O','A','AB','B','O','A','A','B')
name=c("kim","park","lee","kim","park","lee","kim","park","lee","kim","park","lee","kim","park","lee","kim","park","lee","choi","lee")
gender=c("남","여","남","여","남","여","남","여","남","여","남","여","남","여","남","여","남","여","남","여")
df<-data.frame(name, gender, bloodType)
df
t1<-table(df$gender, df$bloodType)
t1
barplot(t1, legend=T, col = rainbow(2), beside = T)

#-------------------------------    
# 수치형 변수의 관계 -> 산점도plot
df<-write.table(HOUR=c(0,4,3,6,6,7,8,8,3), SCORE=c(60,78,83,74,100,80,90,85,70))
df<-read.csv('study.txt')
df
plot(df$HOUR,df$SCORE, pch=16, col='red')
# 상관계수. 1양의상관 -1음의상관
cor(df$HOUR,df$SCORE)

#-------------------------------
#범주형 변수와 수치형 변수의 관계
df<-read.csv('score.txt')

#aggregate: 그룹별로 합계 또는 평균을 구해준다.
aggregate(df$SCORE~df$CITY, data=df, mean)
boxplot(df$SCORE~df$CITY, data=df)

#-----------------------
library(ggplot2)
mpg$displ
mpg$hwy

?ggplot
#1.배경설정
ggplot(data=mpg, aes(x=mpg$displ, y=mpg$hwy))
#2.그래프
#ggplot2 패키지 함수들은 + 기호로 연결한다.
#geom_point(): 산점도 그리는 함수
ggplot(data=mpg, aes(x=mpg$displ, y=mpg$hwy))+geom_point()
#3.설정
ggplot(data=mpg, aes(x=mpg$displ, y=mpg$hwy))+geom_point()+xlim(3,6)

#-------------------------------
# 구동방식(drv)별 평균고속도로 연비(hwy)
library(dplyr)
mpg2<- mpg %>% group_by(drv) %>% 
  summarise(avg = mean(hwy, na.rm = T))

ggplot(data=mpg2, aes(x=drv, y=avg)) + geom_col() #막대그래프
table(mpg$drv)

# 변수에 대이터가 몇개있는지 알고싶을때 -> x축만 지정
ggplot(data=mpg,aes(x=drv))+geom_bar()

ggplot(data=mpg2,aes(x=reorder(drv,avg),y=avg))+geom_col()

#--------------------------------
#데이터 분석절차: 변수검토 및 전처리 -> 변수간의 관계 분석
install.packages("foreign")
library(foreign)
df<-read.spss('Koweps_hpc10_2015_beta1.sav', to.data.frame = T)
View(df)
str(df)
df<-rename(df,
           sex=h10_g3,
           birth=h10_g4,
           marriage=h10_g10,
           religion=h10_g11,
           code_job=h10_eco9,
           income=p1002_8aq1,
           code_region=h10_reg7)
#성별에 따른 월급차이
table(df$sex)
df$sex2[df$sex==1]<-'남자'
df$sex2[df$sex==2]<-'여자'
qplot(df$sex2) #빠른 그래프

summary(df$income)
df$income2<-ifelse(df$income>=1 & df$income<=9998, df$income, NA)
sex_income<- df %>% 
  filter(!is.na(income2)) %>%
  group_by(sex2) %>%
  summarise(avg_income=mean(income))
sex_income
ggplot(data=sex_income, aes(x=sex2, y=avg_income)) + geom_col() #막대그래프

#나이와 월급의 관계 : 숫자와 숫자의 관계 -> 산점도
summary(df$birth)
df$age<-2015-df$birth+1
summary(df$age)
#수입있는 사람만 필터링
age_income<-df %>%
  filter(!is.na(income)) %>%
  group_by(age) %>%
  summarise(avg_income = mean(income))
age_income
#선그래프
ggplot(data=age_income, aes(x=age, y=avg_income)) + geom_line()

#연령대에 따른 월급의 차이
df$ageg[df$age<=35] <-'초년'
df$ageg[df$age>35 & df$age<=59] <-'중년'
df$ageg[df$age>=60] <-'노년'
ageg_income <- df %>%
  filter(!is.na(income)) %>%
  group_by(ageg) %>%
  summarise(avg_income=mean(income))
ageg_income
ggplot(data=ageg_income, aes(x=ageg, y=avg_income)) + geom_col() + scale_x_discrete(limits=c('초년','중년','노년')) #막대 순서 지정해줌

#----------------------------------
#연령대 및 성별에 따른 월급차이
ageg_sex_income<-df %>%
  filter(!is.na(income)) %>%
  group_by(ageg, sex2) %>%  #연령 및 성별로 정렬

#fill=sex
#연령막대 안에 성별로 쪼갠다.
  summarise(avg_income=mean(income))
ageg_sex_income
ggplot(data=ageg_sex_income, aes(x=ageg, y=avg_income,fill=sex2)) + geom_col()

#--------------------------------
#종교유무에 따른 이혼율
head(df)
table(df$religion)
summary(df$religion)
df$religion2<-ifelse(df$religion==1,'hasReligion','noReligion')
summary(df$marriage)
table(df$marriage)
df$marriage2<-ifelse(df$marriage==1, 'marriage', ifelse(df$marriage==3, 'divorce', NA))
table(df$marriage2)
summary(df$marriage2)

#marriage값이 있는 데이터 필터 - 종교별로 그룹핑
library(dplyr)
religion_marriage<-df %>% 
  filter(!is.na(marriage2)) %>% 
  group_by(religion2, marriage2) %>% 
  summarise(cnt = n()) %>%
  mutate(sum1 = sum(cnt)) %>%
  mutate(pct = round(cnt/sum1*100,1))
religion_marriage


#연령대 및 종교 유무에 따른 이혼율
ageg_religion


# 지역별 연령대 비율
summary(df$code_region)
table(df$code_region)
list_region<-data.frame(code_region=c(1:7),
                        region=c('서울','수도권(인천/경기)','부산/경남/울산','대구/경북','대전/충남','강원/충북','광주/전남/전북/제주도'))
list_region
df<-left_join(df, list_region, id="code_region")
head(df$religion)
tail(df$religion)
region_ageg<-df %>% group_by(region, ageg) %>%
  summarise(cnt=n()) %>%
  mutate(hap=sum(cnt)) %>%
  mutate(pct=round(cnt/hap*100,1))
library(ggplot2)
ggplot(data =region_ageg, aes(x=regon, y=pct, fill=ageg))+geom_/ol()+coord_flip()

list_order<-region_ageg %>% filter(ageg=='노년') %>% 
  arrange(desc(pct))
list_order

ggplot(data =region_ageg, aes(x=region, y=pct, fill=ageg))+geom_col()+coord_flip()+scale_x_discrete(limits=list_order$region)
