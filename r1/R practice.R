library(ggplot2)
install.packages("dplyr")
library(dplyr)

# p.156
# 데이터 합치기
mpg1<-as.data.frame(ggplot2::mpg)
table(mpg1$fl)
fuel<-data.frame(fl=c("c","d","e","p","r"),
                 price=c(2.35, 2.38, 2.11, 2.76, 2.22),
                 stringsAsFactors = F)
fuel
mpg2<-left_join(mpg1,fuel,by="fl")

mpg2 %>% select(model,fl,price) %>% head(5)
mpg2

# p.170
# 결측치 넣은뒤에 평균구하기
mpg3<-as.data.frame(ggplot2::mpg)
mpg3[c(65,124,131,153,212),"hwy"]<-NA
table(is.na(mpg3$drv))
table(is.na(mpg3$hwy))
mpg3 %>% group_by(mpg3$fl) %>% filter(!is.na(hwy)) %>% summarize(mean(hwy))
View(mpg3)
mpg3 %>% group_by(mpg3$fl) %>% summarize(mean(mpg3$hwy,na.rm = T))

# p.150
# 차종이 compact인 것만 추출해서 제조사별 compact생산대수 출력력
mpg4<-as.data.frame(ggplot2::mpg)
mpg4 %>% filter(class == 'compact') %>% group_by(manufacturer) %>% summarise(compactNo= n()) %>% arrange(desc(compactNo)) 
