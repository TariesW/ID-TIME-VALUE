# install package
install.packages('lcmm')

# load package
library(lcmm)

# load data
dataset <- read.csv("~/Desktop/dataset.csv")
View(dataset)

# check data
str(dataset)
head(dataset)

# Linear Link Function
m1 <- lcmm(value~time, random=~time, subject = "id", ng=1, data=dataset)
m2 <- lcmm(value~time, random=~time, mixture=~time, subject = "id", ng=2, data=dataset)
summarytable(m1)
summarytable(m2)

# Variance-Covariance of both model
VarCov(m1)
VarCov(m2)

# Parameter of the Variance-Covariance of both model
m1$best
m2$best

# thresholds / 17 initial values
mthresh <- lcmm(value~time, random=~time, mixture=~time, subject = "id", ng=2, data=dataset, link = "thresholds",maxiter=100 ,B=c(0.55660514,2.21480880,0.18323697,0.01515984,6.59269865,0.91420773,2.07026450,-5.78629796,0.57597657,0.94385277,0.04478981,0.08538294,0.16276637,7.12224231,0.84318895,0,0))

