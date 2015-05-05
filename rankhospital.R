# Ranking hospitals by outcome in a state

##  Write a function called rankhospital that takes three arguments: the 2-character abbreviated name of a
##  state (state), an outcome (outcome), and the ranking of a hospital in that state for that outcome (num).
##  The function reads the outcome-of-care-measures.csv file and returns a character vector with the name
##  of the hospital that has the ranking specified by the num argument. For example, the call


rankhospital("MD", "heart failure", 5)


##  would return a character vector containing the name of the hospital with the 5th lowest 30-day death rate
##  for heart failure. The num argument can take values “best”, “worst”, or an integer indicating the ranking
##  (smaller numbers are better). If the number given by num is larger than the number of hospitals in that
##  state, then the function should return NA. Hospitals that do not have data on a particular outcome should
##  be excluded from the set of hospitals when deciding the rankings.
##  Handling ties. It may occur that multiple hospitals have the same 30-day mortality rate for a given cause
##  of death. In those cases ties should be broken by using the hospital name. For example, in Texas (“TX”),
##  the hospitals with lowest 30-day mortality rate for heart failure are shown here.


head(texas)


##  Note that Cypress Fairbanks Medical Center and Detar Hospital Navarro both have the same 30-day rate
##  (8.7). However, because Cypress comes before Detar alphabetically, Cypress is ranked number 3 in this
##  scheme and Detar is ranked number 4. One can use the order function to sort multiple vectors in this
##  manner (i.e. where one vector is used to break ties in another vector).


#The function should use the following template.


rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
        ## Check that state and outcome are valid
        ## Return hospital name in that state with the given rank
        ## 30-day death rate
}


##  The function should check the validity of its arguments. If an invalid state value is passed to best, the
##  function should throw an error via the stop function with the exact message “invalid state”. If an invalid
##  outcome value is passed to best, the function should throw an error via the stop function with the exact
##  message “invalid outcome”.
