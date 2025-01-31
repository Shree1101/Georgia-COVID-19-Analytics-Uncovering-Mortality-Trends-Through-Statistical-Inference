
#import data 
death_df <- read.csv("D:\\MPS_Quater 1\\ALY6010_Probability & Statistics\\deaths.csv", header=TRUE, stringsAsFactors=FALSE)
death_df

                                           
#for importing functions of the given libraries
library(dplyr)
library(ggplot2) 
install.packages("psych")  
library(psych)


# create table for sex variable
deathSex <- table(death_df$sex)  
deathSex
totalSex <- count(death_df,sex)  # count number of deaths in male and females 
totalSex
write.table(totalSex, file = "D:\\MPS_Quater 1\\ALY6010_Probability & Statistics\\sumtable1.txt", sep = ",", quote = FALSE, row.names = F)
#calculate mean
mean(deathSex)
# calculate sd
sd(deathSex)
#proportion
prop.table(table(deathSex))
#CI
CI <- t.test(deathSex, conf.level = 0.95)$conf.int
CI
write.table(CI, file = "D:\\MPS_Quater 1\\ALY6010_Probability & Statistics\\sumtable1.txt", sep = ",", quote = FALSE, row.names = F)

# Create the plot for number of male females deaths. 
ggplot(death_df, aes(x = sex)) +
  geom_bar(fill = "steelblue") +
  labs(x = "sex", y = "total") +
  scale_x_discrete(labels = c("Male", "Female", "Unknown")) +
  theme_minimal()

sumtable1 <- describeBy(death_df,death_df$sex,  skew= FALSE, range = FALSE) #just one grouping variable #	can also use group=death_df$sex
sumtable1
sumtable1_1<-do.call("rbind",sumtable1)
sumtable1_1
write.table(sumtable1_1, file = "D:\\MPS_Quater 1\\ALY6010_Probability & Statistics\\sumtable1.txt", sep = ",", quote = FALSE, row.names = F)

sumtable2 <- describeBy(death_df,list(death_df$sex,death_df$race), skew= FALSE, range = FALSE)  #two grouping variables
sumtable2
write.table(sumtable2_1, file = "D:\\MPS_Quater 1\\ALY6010_Probability & Statistics\\sumtable1.txt", sep = ",", quote = FALSE, row.names = F)


#create bar chart based on deaths by race
deathRace <- table(death_df$race)  # create table for race variable
deathRace
totalRace <- count(death_df,race)  # count number of deaths by race
totalRace
write.table(totalRace, file = "D:\\MPS_Quater 1\\ALY6010_Probability & Statistics\\sumtable1.txt", sep = ",", quote = FALSE, row.names = F)
#calculate mean
mean(deathRace)
# calculate sd
sd(deathRace)
#proportion
prop.table(table(deathRace))
#calculate CI for number of deaths by race
t.test(deathRace, conf.level = 0.95)$conf.int

# Create the plot for number of male females deaths. 
  ggplot(death_df, aes(x = race)) +
  geom_bar(fill = "lightblue") +
  labs(x = "race", y = "deathRace") +
  scale_x_discrete(labels = c("Black", "Native", "Asian","Native Hawaiian","Other","Unknown","White")) +
  theme_minimal()



# create a group bar chart by gender and race
data('death_df')
attach(death_df)
counts <- table(sex, race) 
barplot(counts,beside=T,legend=c('M','F')) 
barplot(counts,col=c('red','blue'), 
         names.arg=c("Black", "Native", "Asian","Native Hawaiian","Other","Unknown","White"), 
         beside=T,legend=c('M','F'), xlim=c(1,35))
 
  


deathChronic <- table(death_df$chronic_condition) # create table for chronic condition variable 
deathChronic
total_1 <- count(death_df,chronic_condition)   # count number of deaths by past medical conditions
total_1
write.table(total_1, file = "D:\\MPS_Quater 1\\ALY6010_Probability & Statistics\\sumtable1.txt", sep = ",", quote = FALSE, row.names = F)
#calculate mean
mean(deathChronic)
# calculate sd
sd(deathChronic)
#proportion
prop.table(table(deathChronic))
#CI
t.test(deathChronic, conf.level = 0.95)$conf.int



deathEthnicity <- table(death_df$ethnicity)  # count number of deaths by ethnicity
deathEthnicity
count(deathEthnicity)

deathCounty <- table(death_df$county)  # count number of deaths by county
count(death_df,county)
#proportion
mean(deathCounty)
sd(deathCounty)



# Create a new column to assign binary values based on race categories
death_df$race_binary <- ifelse(death_df$race == "White", 1, ifelse(death_df$race == "African-American/ Black", 0, NA))
write.table(death_df$race_binary, file = "D:\\MPS_Quater 1\\ALY6010_Probability & Statistics\\sumtable1.txt", sep = ",", quote = FALSE, row.names = F)
mean(death_df$race_binary)

top <- head(death_df,20)
top
write.table(top, file = "D:\\MPS_Quater 1\\ALY6010_Probability & Statistics\\sumtable1.txt", sep = ",", quote = FALSE, row.names = F)


