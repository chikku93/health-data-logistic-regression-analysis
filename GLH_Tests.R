# ---------------------------------------------------------------------------------------------------
#  Refitting the final model & conducting interesting general linear hypothesis tests using model 10
# ---------------------------------------------------------------------------------------------------
a.model8<-readRDS("C:/Users/Shajisree/Desktop/Rfiles/model_file.rds")

# install.packages("multcomp")
if (!requireNamespace("multcomp", quietly = TRUE)) {
  install.packages("multcomp")
}
library("multcomp")


#Summarise BMI for different categories
summary(BMI[BMI>=30])#To find mean obese BMI
summary(BMI[c((18.5<=BMI) & (BMI<25))])#To find mean normal healthy BMI
summary(BMI[c((25<=BMI) & (BMI<30))])#To find mean overweight BMI

# Are obese hypertensive subjects more likely to have Heart Ds than normal weight hypertensive subjects
delta.a<-matrix(c(0,0,12.71,0,0,0),1)
test1<-glht(a.model8, linfct=delta.a)
summary(test1)
exp(confint(test1)$confint)


# Are obese hypertensive subjects more likely to have Heart Ds than overweight hypertensive subjects
delta.c<-matrix(c(0,0,7.9,0,0,0),1)
test3<-glht(a.model8, linfct=delta.c)
summary(test3)
exp(confint(test3)$confint)


# Are obese hypertensive subjects more likely to have Heart Ds than overweight non hypertensive subjects
delta.e<-matrix(c(0,1,7.9,0,0,0),1)
test5<-glht(a.model8, linfct=delta.e)
summary(test5)
exp(confint(test5)$confint)


# Are normal weight hypertensive subjects more likely to have Heart Ds than overweight non hypertensive subjects
delta.g<-matrix(c(0,1,-4.81,0,0,0),1)
test7<-glht(a.model8, linfct=delta.g)
summary(test7)
exp(confint(test7)$confint)
