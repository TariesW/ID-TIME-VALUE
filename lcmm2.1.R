# install package
install.packages('lcmm')

# load package
library(lcmm)

# load data
shuju <- read.csv("~/Desktop/Latent Class Mixed Model/shuju.csv")
View(shuju)
shuju <- shuju[,-1]
View(shuju)

# check data
str(shuju)
head(shuju)

# Linear Link Function
m1 <- lcmm(value~time, random=~time, subject = "id", ng=1, data=shuju)
m2 <- lcmm(value~time, random=~time, mixture=~time, subject = "id", ng=2, data=shuju)
summarytable(m1)
summarytable(m2)

# Variance-Covariance of both model
VarCov(m1)
VarCov(m2)

# Parameter of the Variance-Covariance of both model
m1$best
m2$best

# thresholds / 17 initial values
mthresh <- lcmm(value~time, random=~time, mixture=~time, subject = "id", ng=2, data=shuju, link = "thresholds",maxiter=100 ,B=c(m1$best,m2$best,0,0))

