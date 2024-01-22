
#------------------------------Analyzing the Relationship between Obesity, Hypertension, and Heart Disease 
#--------------------------------------------------through Logistic Regression


#----------------------------------------------
# Data Management
#----------------------------------------------
# Read in data
args <- commandArgs(trailingOnly = TRUE)

heart<-read.csv(args[1],header=T)
names(heart) # List variable names

# Convert variables to factors and assign value labels
source('C:/Users/Shajisree/Desktop/Rfiles/TransformVariable.R')
heart <- transform_variable(heart, "hbp", c('Yes', 'No'))
heart <- transform_variable(heart, "drink", c('Yes', 'No'))
heart <- transform_variable(heart, "ethnicity", c('Other', 'Other', 'Other', 'Other', 'Latino', 'White'))
heart <- transform_variable(heart, "gender", c('Male', 'Female'))
heart <- transform_variable(heart, "smoke", c('Yes', 'No'))

# Calculate BMI
heart$BMI<-heart$wt/(heart$ht^2)*703

attach(heart)
#-----------------------------------------------------------------------
#  Data analysis
#-----------------------------------------------------------------------
# Descriptive Statistics
source('C:/Users/Shajisree/Desktop/Rfiles/Functions1.R')

descript(age)
descript(hours)
descript(pa)
descript(BMI)
freq(hbp)
freq(smoke)
freq(gender)
freq(ethnicity)
freq(drink)
freq(hd)

#-------------------------------------------
# Bivariate Analysis
#-------------------------------------------
freq(hd[hbp=="Yes"])[1,]#only interested in the row 1 of the matrix
freq(hd[hbp=="No"])[1,]
freq(hd[gender=="Male"])[1,]
freq(hd[gender=="Female"])[1,]
freq(hd[ethnicity=="Other"])[1,]
freq(hd[ethnicity=="Latino"])[1,]
freq(hd[ethnicity=="White"])[1,]
freq(hd[drink=="Yes"])[1,]
freq(hd[drink=="No"])[1,]
freq(hd[smoke=="Yes"])[1,]
freq(hd[smoke=="No"])[1,]




u.model1<-glm(relevel(as.factor(hd),"2")~relevel(hbp,"No"),
              family="binomial"(link="logit"),data=heart)
u.model2<-glm(relevel(as.factor(hd),"2")~relevel(gender,"Male"),
              family="binomial"(link="logit"),data=heart)
u.model3<-glm(relevel(as.factor(hd),"2")~relevel(ethnicity,"White"),
              family="binomial"(link="logit"),data=heart)
u.model4<-glm(relevel(as.factor(hd),"2")~relevel(drink,"No"),
              family="binomial"(link="logit"),data=heart)
u.model5<-glm(relevel(as.factor(hd),"2")~relevel(smoke,"No"),
              family="binomial"(link="logit"),data=heart)
u.model6<-glm(relevel(as.factor(hd),"2")~age,family="binomial"(link="logit"),
              data=heart)
u.model7<-glm(relevel(as.factor(hd),"2")~pa,family="binomial"(link="logit"),
              data=heart)
u.model8<-glm(relevel(as.factor(hd),"2")~hours,family="binomial"(link="logit"),
              data=heart)
u.model9<-glm(relevel(as.factor(hd),"2")~BMI,family="binomial"(link="logit"),
              data=heart)

summary(u.model1)
round(exp(cbind(OR = coef(u.model1), confint(u.model1))),2)[2,]
summary(u.model2)
round(exp(cbind(OR = coef(u.model2), confint(u.model2))),2)[2,]
summary(u.model3)
round(exp(cbind(OR = coef(u.model3), confint(u.model3))),2)
summary(u.model4)
round(exp(cbind(OR = coef(u.model4), confint(u.model4))),2)[2,]
summary(u.model5)
round(exp(cbind(OR = coef(u.model5), confint(u.model5))),2)[2,]
summary(u.model6)
round(exp(cbind(OR = coef(u.model6), confint(u.model6))),2)[2,]
summary(u.model7)
round(exp(cbind(OR = coef(u.model7), confint(u.model7))),2)[2,]
summary(u.model8)
round(exp(cbind(OR = coef(u.model8), confint(u.model8))),2)[2,]
summary(u.model9)
round(exp(cbind(OR = coef(u.model9), confint(u.model9))),2)[2,]

anova(u.model1,test="LRT")
anova(u.model2,test="LRT")
anova(u.model3,test="LRT")
anova(u.model4,test="LRT")
anova(u.model5,test="LRT")
anova(u.model6,test="LRT")
anova(u.model7,test="LRT")
anova(u.model8,test="LRT")
anova(u.model9,test="LRT")

#-----------------------------------------------------------------------
#  Model building
#-----------------------------------------------------------------------
a.model1<-glm(relevel(as.factor(hd),"2")~relevel(hbp,"No")+BMI,
              family="binomial"(link="logit"),data=heart)
a.model2<-glm(relevel(as.factor(hd),"2")~relevel(hbp,"No")+
                BMI+age,family="binomial"(link="logit"),data=heart)
a.model3<-glm(relevel(as.factor(hd),"2")~relevel(hbp,"No")+BMI+age+hours
              ,family="binomial"(link="logit"),data=heart)
a.model4<-glm(relevel(as.factor(hd),"2")~relevel(hbp,"No")+BMI+age+
                hours+relevel(ethnicity,"White"),
              family="binomial"(link="logit"),data=heart)
a.model5<-glm(relevel(as.factor(hd),"2")~relevel(hbp,"No")+BMI+age+
                hours+pa,family="binomial"(link="logit"),data=heart)
a.model6<-glm(relevel(as.factor(hd),"2")~relevel(hbp,"No")+BMI+age+
                hours+drink,family="binomial"(link="logit"),data=heart)
a.model7<-glm(relevel(as.factor(hd),"2")~relevel(hbp,"No")+BMI+age+hours+
                relevel(smoke,"No"),family="binomial"(link="logit"),data=heart)
a.model8<-glm(relevel(as.factor(hd),"2")~relevel(hbp,"No")+BMI+age+hours+
                relevel(gender,"Female"),
              family="binomial"(link="logit"),data=heart)
a.model9<-glm(relevel(as.factor(hd),"2")~relevel(hbp,"No")*BMI+age+hours+
                relevel(gender,"Female"),
              family="binomial"(link="logit"),data=heart)


summary(a.model1)
summary(a.model2)
summary(a.model3)
summary(a.model4)
summary(a.model5) 
summary(a.model6) 
summary(a.model7)
summary(a.model8)
summary(a.model9)

round(exp(cbind(OR=coef(a.model8),confint(a.model8))),3)

# ----------------------------------------
# Goodness-of-Fit Test
# ----------------------------------------
# Likelihood Ratio Test
LRT<-cbind(LRT=a.model8$null.deviance-a.model8$deviance,
           df=a.model8$df.null-a.model8$df.residual,
           p.value=1-pchisq(a.model8$null.deviance-a.model8$deviance,a.model8$df.null-a.model8$df.residual))
LRT

saveRDS(a.model8, file = "C:/Users/Shajisree/Desktop/Rfiles/model_file.rds")


