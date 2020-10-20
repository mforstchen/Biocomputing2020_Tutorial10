#Question 1
#set working directory to location of files for tutorial

setwd("~/Desktop/Biocomputing2020_Tutorial10/")

#Read in the UWvMSU_1-22-13 text file as a dataframe called 
UWvMSU<- read.csv("UWvMSU_1-22-13.txt", sep = "", header = TRUE, stringsAsFactors = FALSE)

#Determine the number of rows necessary for the dataframe
nrow(UWvMSU)

#Preallocate a dataframe for cumulative scores
cumulative_scores <- data.frame("Time" = numeric(50),
                                "Cumulative UW Score" = numeric(50),
                                "Cumulative MSU Score" = numeric(50))

#Create a for loop

for (i in 1:nrow(Scores)){
  if(Scores$team[i]=="UW"){
    UW_Score_Sum=UW_Score_Sum+cumsum(Scores$score[i])
  }else{
    MSU_Score_Sum=MSU_Score_Sum+cumsum(Scores$score[i])
  }
  }