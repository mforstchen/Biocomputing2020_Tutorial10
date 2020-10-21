#Question 1
#set working directory
setwd("~/Desktop/Biocomputing2020_Tutorial10/")

#Read in the UWvMSU_1-22-13 text file as a dataframe called UWvMSU
UWvMSU<- read.csv("UWvMSU_1-22-13.txt", sep = "", header = TRUE, stringsAsFactors = FALSE)

#Determine the number of rows for a new dataframe to preallocate outputs
nrow(UWvMSU)

#Preallocate a dataframe for time, scores, and cumulative scores
cumulative_scores <- data.frame("Time" = numeric(50),
                                "UW Score" = numeric(50),
                                "MSU Score" = numeric(50),
                                "Cumulative UW Score" = numeric(50),
                                "Cumulative MSU Score" = numeric(50))

#Enter time from UWvMSU dataframe into cumulative_scores
cumulative_scores$Time <- UWvMSU$time

#Get the scores from original table and assign them to their team
for(i in 1:nrow(UWvMSU)){
  if(UWvMSU$team[i]=="UW"){
    cumulative_scores$UW.Score[i]=(UWvMSU$score[i])
  }else{
    cumulative_scores$MSU.Score[i]=(UWvMSU$score[i])
  }
}

#Now loop through and calculate cumulative scores for UW
for(i in 1:nrow(cumulative_scores)){
  cumulative_scores$Cumulative.UW.Score[i]=sum(cumulative_scores$UW.Score[1:i])
}

#Now loop through and calculate cumulative sums for MSU
for(i in 1:nrow(cumulative_scores)){
  cumulative_scores$Cumulative.MSU.Score[i]=sum(cumulative_scores$MSU.Score[1:i])
}

#Generate a plot using the plot function of cumulative scores and time
plot(cumulative_scores$Time, cumulative_scores$Cumulative.UW.Score, type = "l",
     col = "red", xlab = "Time (min)", ylab = "Score", ylim = c(0,50))
lines(cumulative_scores$Time, cumulative_scores$Cumulative.MSU.Score, type ="l",
      col= "dark green")
legend("topleft", inset=.05,
       c("UW = Red Line", "MSU = Green Line"))


#Question 2

#IMPORTANT NOTE FOR RUNNING GAME: RUN EACH LINE IN THE SCRIPT ONE AT A TIME!


#Builds a "Guess a Number Game" with the following rules
#Number to guess will be generated from numbers between 1:100
#User will be able to guess up to 10 times

#Maximum number of guesses made
MaximumGuess=10
#Create a count to keep track of guesses made
Count=0
#The random number is generated using random integer function
Number <- sample(1:100, 1)


# Solicit input from the user
Input <- as.numeric(readline(prompt="Enter Number: "))

while(Count<10){
  
  for(i in 1:MaximumGuess) {
    if(Input== Number) {
      cat("You got the correct number!")
      Count = Count+11
      break
    } else {        
      if(i == MaximumGuess) {
        cat("Too bad, you ran out of guesses!")
        Count = Count+1
        break
      } else {
        if(Input < Number) {
          cat("Too low! Guess again!")
          Count=Count+1
        } else {
          cat("You are too high. Guess again!")
          Count=Count+1
        }
        #Ask the user to guess the number
        Input <- as.numeric(readline(prompt="Enter Number: "))
      }            
    }
  }
}
