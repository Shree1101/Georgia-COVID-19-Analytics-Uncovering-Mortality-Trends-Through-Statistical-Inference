#importing library for functions
library(dplyr) 
library(plotrix)
library(ggplot2)
library(psych)
library(broom)

#import dataset combordities 
individualData <- read.csv("D:\\MPS_Quater 1\\ALY6010_Probability & Statistics\\comorbidities (any) expanded.csv", header=TRUE, stringsAsFactors=FALSE)
individualData
summary(individualData)
str(individualData)

#calculating number of cases and deaths for each category of race
table1 <- individualData %>% group_by(race) %>% summarise(Cases=sum(case),Death=sum(death))
table1
dim(table1)
write.table(table1, file = "D:\\MPS_Quater 1\\ALY6010_Probability & Statistics\\sumtable1.txt")


# we will go with white population since it has more cases and deaths based on table1 data i.e race variable
WhiteData <- filter(table1,race == "White")
WhiteData

WhiteData <- data.frame(WhiteData,WhiteProb, WhiteMean, WhiteSD) # display everything in table
WhiteData
write.table(WhiteData, file = "D:\\MPS_Quater 1\\ALY6010_Probability & Statistics\\sumtable1.txt")


#calculate prob, mean, SD of white death
WhiteProb <- WhiteData$Death / WhiteData$Cases
WhiteProb

WhiteMean <- mean(WhiteProb) 
WhiteMean

WhiteSD <- sqrt(WhiteMean * (1-WhiteMean)/WhiteData$Cases)
WhiteSD


# conduct t-test of mean proportion using hypothesied values = 5 for overall deaths
tt1 <- t.test(individualData$death, mu = 0.05)
tt1
tidy_t_test1 <- broom::tidy(tt1)
tidy_t_test1 
write.csv(tidy_t_test, "D:\\MPS_Quater 1\\ALY6010_Probability & Statistics\\sumtable1.txt")
#t-test for male-female ratio
individualData$gender_f <- ifelse(individualData$sex == "Female", 1, 0)
individualData$gender_m <- ifelse(individualData$sex == "Male", 1, 0)

tt2 <- t.test(individualData$gender_f, paired = FALSE, data = individualData,mu=0.05)
tt3 <- t.test(individualData$gender_m, paired = FALSE, data = individualData,mu=0.05)
tidy_t_test2 <- broom::tidy(tt2)
tidy_t_test2
write.csv(tidy_t_test2, "D:\\MPS_Quater 1\\ALY6010_Probability & Statistics\\sumtable1.txt")
tidy_t_test3 <- broom::tidy(tt3)
tidy_t_test3
write.csv(tidy_t_test3, "D:\\MPS_Quater 1\\ALY6010_Probability & Statistics\\sumtable1.txt")



# conduct binom.test of mean proportion using hypothesied values = 5%
bt1 <- binom.test(WhiteData$Death,WhiteData$Cases,p=0.05)
bt2 <- binom.test(WhiteData$Death,WhiteData$Cases,p=0.15)   # hypothesied values = 15%
bt_test1 <- broom::tidy(bt1)
bt_test1
write.csv(bt_test1, "D:\\MPS_Quater 1\\ALY6010_Probability & Statistics\\sumtable1.txt")
bt_test2 <- broom::tidy(bt2)
bt_test2
write.csv(bt_test2, "D:\\MPS_Quater 1\\ALY6010_Probability & Statistics\\sumtable1.txt")

# conduct prop.test of mean proportion using hypothesied values = 5%
pt1 <- prop.test(WhiteData$Death,WhiteData$Cases, p = 0.05)
p_test1 <- broom::tidy(pt1)
p_test1
write.csv(p_test1, "D:\\MPS_Quater 1\\ALY6010_Probability & Statistics\\sumtable1.txt")

pt2 <- prop.test(WhiteData$Death,WhiteData$Cases, p = 0.18)
p_test2 <- broom::tidy(pt1)
p_test2
write.csv(p_test2, "D:\\MPS_Quater 1\\ALY6010_Probability & Statistics\\sumtable1.txt")



#ggproptest(prop1)
#ggttest(tt1, colaccept="lightsteelblue1", colreject="grey84",
#        colstat="navyblue")


#calculating number of cases and deaths for each category of ethnicity
#table2 <- individualData %>% group_by(ethnicity) %>% summarise(Cases=sum(case),Death=sum(death))
#table2
#dim(table2)
