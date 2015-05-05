# Finding the best hospital in a state

##  Write a function called best that take two arguments: the 2-character abbreviated name of a state and an
##  outcome name. The function reads the outcome-of-care-measures.csv file and returns a character vector
##  with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specified outcome
##  in that state. The hospital name is the name provided in the Hospital.Name variable. The outcomes can
##  be one of “heart attack”, “heart failure”, or “pneumonia”. Hospitals that do not have data on a particular
##  outcome should be excluded from the set of hospitals when deciding the rankings.
##  Handling ties. If there is a tie for the best hospital for a given outcome, then the hospital names should
##  be sorted in alphabetical order and the first hospital in that set should be chosen (i.e. if hospitals “b”, “c”,
##  and “f” are tied for best, then hospital “b” should be returned).


#The function should use the following template.


best <- function(state, outcome) {
        ## Read outcome data
        outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        if(is.element(state, unique(outcome_data[,7])) < 1)       {
                stop("invalid state")
        }
        
        if(is.element(outcome, c("heart attack","heart failure","pneumonia")) < 1)       {
                stop("invalid outcome")
        }
        
        #return("ok")
        
        ## Return hospital name in that state with lowest 30-day death
        ## rate
        
        #Heart Attack
        if(is.element(outcome,"heart attack") == 1)     {
                attempt <- outcome_data[outcome_data[,11]!="Not Available" & outcome_data[,7]==state,c(2,7,11)]
        }
        #Heart Failure -- works
        else if(is.element(outcome,"heart failure") == 1)       {
                attempt <- outcome_data[outcome_data[,17]!="Not Available" & outcome_data[,7]==state,c(2,7,17)]
        }
        #Pneumonia
        else if(is.element(outcome,"pneumonia") == 1)      {
                attempt <- outcome_data[outcome_data[,23]!="Not Available" & outcome_data[,7]==state,c(2,7,23)]
        }
        
        else {
                stop("invalid outcome") 
        }
        
        ##Change Class
        attempt[,3] <- as.numeric(attempt[,3])
        #Return the hospital that has the best (i.e. lowest) 30-day mortality for the specified outcome
        attempt[which.min(attempt[,3]),1]
}


##  The function should check the validity of its arguments. If an invalid state value is passed to best, the
##  function should throw an error via the stop function with the exact message “invalid state”. If an invalid
##  outcome value is passed to best, the function should throw an error via the stop function with the exact
##  message “invalid outcome”.


############################Everything below is a failed attempt##############################################

##On the right track
#attempt2 <- outcome[outcome[,17]!="Not Available" & outcome[,7]=="TX",c(2,7,17)]
#attempt2[,3] <- as.numeric(attempt2[,3])
#attempt2[which.min(attempt2[,3]),]


##Unsuccessful Attempt
        ## Return hospital name in that state with lowest 30-day death
        ## rate
#head(outcome_data[outcome_data[,7]==state,c(7,11,15,17,21,23,27)])
#outcome[outcome[,7]=="TX",c(2,7,15)]
#head(outcome[outcome[,15]!="Not Available",c(2,7,15)],n=50L)
#head(outcome[outcome[,15]!="Not Available" & outcome[,7]=="TX",c(2,7,15)],n=50L)

        #Try at Heart Failure
#attempt2 <- outcome[outcome[,21]!="Not Available" & outcome[,7]=="TX",c(2,7,21)]
#apply(attempt2,2,min)