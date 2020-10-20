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


#Question 2

#Builds a "Guess a Number Game" with the following rules
#Number to guess will be generated from numbers between 1:100
#User will be able to guess up to 10 times

#Preallocate locations for number, correct outputs, and incorrect outputs

Number =0
Correct =0
Incorrect =0

#Maximum number of guesses made
MaximumGuess=10

#Create a vector with numbers 1:100 to guess from
AllNumbers <- c(1:100)

#Use the sample function to get 1 random number from the AllNumbers vector
NumberSelected <- sample(AllNumbers,1)

