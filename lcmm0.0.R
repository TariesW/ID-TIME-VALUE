
install.packages('lcmm')
library(lcmm)



m0 <- lcmm(value~time,random=~time,subject='id',ng=1,
           data=data2,link="linear")



m1 <- lcmm(value~time,random=~time,subject='id',mixture=~time,ng=5,#回归公式不确定
           idiag=TRUE,data=data2,link="linear")#链接的函数不确定
postprob(m1)
data3 <- data2[data2$id ==1,]
a <-predictL(m1,var.time="time",newdata=data3,bty="l")
plot(a) #缺少置信区间、坐标轴不太对


# 
# m2 <- lcmm(value~time,random=~time,subject='id',mixture=~time,ng=5,
#            idiag=TRUE,data=data2,link="thresholds") #这里运算量太大 需要添加B参数 不会弄


