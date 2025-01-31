library(dplyr) # for functions
#import data 
covidData <- read.csv("D:\\MPS_Quater 1\\ALY6010_Probability & Statistics\\covid_georgia.csv", header=TRUE, stringsAsFactors=FALSE)

# display structure of data
str(covidData)

# display first 6 records of data
head(covidData)

#create new variable for total death & cases
library(dplyr) # import library dplyr
names(covidData)
total_tb1 <- covidData %>% summarise(Cases=sum(cases),Death=sum(deaths)) # total number of cases and deaths
total_tb1

dim(covidData)
dim(total_tb1)
total_tb1$Rate = total_tb1$Death/total_tb1$Cases # proportion rate death by cases
total_tb1


table2 <- covidData %>% group_by(sex) %>% summarise(Cases=sum(cases),Death=sum(deaths))
dim(table2)
table2$Rate = table2$Death/table2$Cases  # proportion rate death by cases by grouping sex
table2

library(flextable)
flextable(table2)

# proportion rate death by cases among black population
table3 <- covidData %>% group_by(race) %>% summarise(Cases=sum(cases),Death=sum(deaths))
dim(table3)
table3$Rate = table3$Death/table3$Cases  # proportion rate death by cases by grouping race
table3


#mean 
mean(covidData$cases)
mean(covidData$deaths)

#SD
sd(covidData$cases)
sd(covidData$deaths)



#clean data by removing Unknown & Total Data from Race
library(dplyr)
df2<-covidData[!(covidData$race=="Unknown" | covidData$race=="Total"),]
df2    # cleaned data

df2new <- df2 %>% summarise(Cases=sum(cases),Death=sum(deaths)) # total number of cases and deaths
df2new   #total death & cases of cleaned data

dim(df2)
dim(df2new) 
df2new$Rate = df2new$Death/df2new$Cases # proportion rate death by cases for cleaned data
df2new

dftable2 <- df2 %>% group_by(sex) %>% summarise(Cases=sum(cases),Death=sum(deaths))
dim(dftable2)
dftable2$Rate = dftable2$Death/dftable2$Cases  # proportion rate death by cases by grouping sex for cleaned data
dftable2

# proportion rate death by cases among black population
dftable_3 <- df2 %>% group_by(race) %>% summarise(Cases=sum(cases),Death=sum(deaths))
dim(dftable_3)
dftable_3$Rate = dftable_3$Death/dftable_3$Cases  # proportion rate death by cases by grouping race for cleaned data
dftable_3