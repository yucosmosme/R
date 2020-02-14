#네이버 개발자센터에서 애플리케이션등록하고 API 신청 (documents-서비스API-검색-블로그)
#https://developers.naver.com/docs/search/blog/

url <- 	'https://openapi.naver.com/v1/search/blog.xml?'

searchStr <- 'query=설날' #검색어지정
searchStr <- iconv(searchStr, to='UTF-8') #검색어인코딩

searchStr <- URLencode(searchStr)#url인코딩
searchStr

etcStr<-'&display=100'  #검색개수 100개 보여주기로 설정(위의 개발자센터에 코드 있음) / 최대 100개

# 위에 주소 다 연결
reqUrl<-paste(url,searchStr,etcStr,sep='')
reqUrl


# 네이버 개발자센터에서 받은 아이디
clientid<-'paFgOkBF4q3ErKcNuBRC'
clientsecret<-'CGIvqZRZwW'

#웹페이지 접속
#install.packages('httr')
library(httr)
result<-GET(reqUrl, add_headers('X-Naver-Client-Id'=clientid, 'X-Naver-Client-Secret'=clientsecret))
result
result$content #응답결과-raw형으로 나타나기떄문에 문자로 변환해야 함
result<-rawToChar(result$content) #문자로변환
result
Encoding(result)<-"UTF-8"
result

#gsub(패턴, 변환 후 문자열, 변환할 문자열, ignore.case)
#[[]] 모든 종류의 괄호를 찾아서 ''공백으로 치환
result <- gsub('[[:punct:]]', '', result) 
#영어 제거
result <-gsub('[a-zA-Z]','',result) 
result
#숫자제거
result <-gsub('[0-9]','',result) 
result
#한개이상의 공백을 한개짜리의 공백으로 바꾸기
result <-gsub(' +',' ',result) 
result

#글자 추출하기====================
#install.packages("KoNLP") 
library(KoNLP)
extractNoun("아버지 가방에 들어가신다.")
extNoun<-extractNoun(result)
extNoun
table(extNoun)

#제외 단어 지정
outWord<-c('설날','한','들','주','때','하시')
extNoun<-extNoun[!extNoun %in% outWord]

#빈도 높은 순으로 200개 추출
sortNoun = sort(table(extNoun),decreasing = T)[1:200] 
sortNoun

#wordCloud로 시각화
#install.packages("wordcloud2")
library(wordcloud2)
wordcloud2(sortNoun, size=3, shape='diamond' )
wordcloud2(sortNoun, size=3, shape='cardioid')
wordcloud2(sortNoun, size=3, shape='triangle-forward')
wordcloud2(sortNoun, size=3, shape = 'star')
wordcloud2(sortNoun, size = 2.3, minRotation = -pi/6, maxRotation = -pi/6, rotateRatio = 1)
