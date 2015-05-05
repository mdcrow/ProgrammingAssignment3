#Load the data from outcome-of-care-measures.csv
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

head(outcome)
ncol(outcome)
nrow(outcome)
names(outcome)

class(outcome[,11])

outcome[, 11] <- as.numeric(outcome[, 11])
## You may get a warning about NAs being introduced; that is okay
##11. Hospital 30-Day Death (Mortality) Rates from Heart Attack: Lists the risk adjusted rate (percentage) for each hospital.
hist(outcome[, 11])