# install package
install.packages('lcmm')

# load package
library(lcmm)

# Linear Link Function
m0 <- lcmm(value~time, random=~time, subject = "id", ng=1, data=dataset, link = "linear")
summary(m0)
plot(m0, which = "linkfunction")

# Beta Link Function
m1 <- lcmm(value~time, random=~time, subject = "id", ng=1, data=dataset, link = "beta")
summary(m1)
plot(m1)
plot(m1, which = "linkfunction")

# I-Splines with 3 quidistant nodes
m2 <- lcmm(value~time, random=~time, subject = "id", ng=1, data=dataset, link = "3-equi-splines")
summary(m2)
plot(m2, which = "linkfunction")

# I-Splines with 5 nodes at quantiles
m3 <- lcmm(value~time, random=~time, subject = "id", ng=1, data=dataset, link = "5-quant-splines")
summary(m3)
plot(m3, which = "linkfunction")

# thresholds
m5 <- lcmm(value~time, subject = "id", data=dataset, link = "thresholds")
summary(m5)  

#compare model
summarytable(m0, m1, m2, m3)

AIC_Value <- c(m0$AIC, m1$AIC, m2$AIC, m3$AIC, m5$AIC)
AIC_Value

UACV_Value <- c(m0$UACV, m1$UACV, m2$UACV, m3$UACV, m5$UACV)
UACV_Value





   
