library(fmsb)#레이더 차트를 그리기 위한 패키지
library(dplyr)#select를 사용하기기 위한 패키지
library(corrplot)
library(ggplot2)
player_data <- read.csv("Worlds 2020 Main Event - Team Stats - OraclesElixir.csv")#csv파일을 불러온다.
player_data
player_data <- select(player_data, c(LNE., JNG., FB., F3T., DRG., BN., GD15, HLD.))#원하는 column의 데이터만 가져오기위해 select를 사용하여 
player_data
colors_border=c( rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9))#레이더 색 지정
colors_in=c( rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4) )#레이더 색 지정
radarchart(player_data,pcol=colors_border , pfcol=colors_in , plwd=4 , plty=1, cglcol="grey", cglty=1) #레이더 차트를 그린다.
legend(x=0.7, y=1.1, c("DAMWONGAMING","SUNING"), bty = "n", pch=20 , col=colors_in , text.col = "grey", cex=1.2, pt.cex=3)#주석을 달아준다.


#승률과 변인의 상관관계를 알기 위한 코드드

LCK_data <- read.csv("LCK 2020 Summer - Player Stats - OraclesElixir.csv")
LCK_data
result <- cor(LCK_data [ , 5 : 24])
result

result<- result[1:6, 6:20]
result

colors <- c()

for(i in 1:length(result[1,])){
  print(result[1,i])
  if(result[1, i] >= 0.5){
    colors<- c(colors, "red")
    print("1")
    }
  else if (result[1, i] >= 0.2){
    colors<- c(colors, "yellow")
    print("2")
    }
  else{colors<- c(colors, "blue")
    print("3")
    }
}
result

colors

barplot(result[1,], main = "LCK 승률과 각 변인의 상관관계", col = colors)
