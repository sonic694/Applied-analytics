#' Title: 2.6.2 Normal Distribution Functions in Context (test yourself solution) 
#' Author: 
#' Date: 
#' Inputs:  None
#' Outputs: None
#' Purpose: Using the normal distribution in a business scenario/case study  
#' Notes:  


# Preamble ----------------------------------------------------------------
#' Imagine that every year we must replace a critical machine that joins sheets 
#' of metal as part of a continually running assembly line. If the machine needs 
#' to be turned off for maintenance, then the entire line must stop. Stopping 
#' the line costs $1M to stop and later restart the line, plus $100k for every 
#' hour it is stopped. We have a choice of two machines to purchase as our 
#' replacement. For both machines the temperature is checked once per day and 
#' the machine is stopped for maintenance if it exceeds its safe temperature.

#' Machine A costs $10M and runs at a mean temperature of 250°C with a standard 
#' deviation of 20°C, has a safe temperature of 300°C and takes 10 hours to fix. 

#' Machine B costs $5M and runs at a mean temperature of 250°C with a standard 
#' deviation of 30°C, has a safe temperature of 310°C and takes five hours to fix. 


# From this preamble, we can set a few constants: 

# We replace the machine annually, and test the temperature daily. 
operating_days <- 365 # Days until replacement. 
check_frequency <- 1  # Times per day the machine is checked. 
number_checks <- operating_days * check_frequency 
# Note, we could just specify the number of checks as 365, but this allows 
# changes to just one variable to be automatically calculated and updated. 

# Stop Costs 
# These costs are constant for both machines
cost_stop <- 1  # Fixed cost of stopping production ($1m) 
cost_fix <- 0.1 # Variable cost of stopping production ($0.1m / hour) 

# Machine A 
cost_a <- 10   # Procurement cost of Machine A 
mean_a <- 250  # The mean temperature at which Machine A operates 
sd_a <- 20     # The standard deviation of the operating temperature for Machine A 

thres_a <- 300 # The safe operating threshold (maximum safe temperature) for Machine A 
fix_a <- 10    # Time it takes to fix Machine A if it is operating above the threshold 


# Machine B 
cost_b <- 5    # Procurement cost of Machine B 
mean_b <- 250  # The mean temperature at which Machine B operates 
sd_b <- 30     # The standard deviation of the operating temperature for Machine B 

thres_b <- 310 # The safe operating threshold (maximum safe temperature) for Machine B 
fix_b <- 5     # Time it takes to fix Machine B if it is operating above the threshold 


### Initial Observation 
# It is apparent that both machines operate at the same mean temperature, however 
# Machine A costs double the amount to purchase, has a lower safe operating threshold, 
# and takes twice as long to fix if it is stopped for maintenance. Machine A 
# operates more consistently near the mean temperature, however, as it has the 
# lower standard deviation. 


# Question 1 --------------------------------------------------------------
#' On a given day, what is the probability of Machine A being within its safety 
#' temperature? Give your response accurate to at least 2 decimal places.

a_fine <- pnorm(thres_a, 
                mean = mean_a, sd = sd_a, 
                lower.tail = TRUE) 
a_fine 
round(a_fine, digits = 2) 


# Question 2 --------------------------------------------------------------
#' On a given day, what is the probability of Machine B being within its safety 
#' temperature? Give your response accurate to at least 2 decimal places.

b_fine <- pnorm(thres_b, 
                mean = mean_b, sd = sd_b, 
                lower.tail = TRUE) 
b_fine
round(b_fine, digits = 2)



# Question 3 --------------------------------------------------------------
#' Which machine should you purchase?

# Total cost of Machine A: 
total_cost_a <- cost_a +                  # Procurement cost of the machine
  ((1 - a_fine) * cost_stop +             # Fixed cost of stopping the machine for a typical test  
     ((1 - a_fine) * fix_a * cost_fix)) * # Variable cost of stopping the machine for a typical test 
  number_checks 

# Total cost of Machine B: 
total_cost_b <- cost_b +                  # Procurement cost of the machine
  ((1 - b_fine) * cost_stop +             # Fixed cost of stopping the machine for a typical test  
     ((1 - b_fine) * fix_b * cost_fix)) * # Variable cost of stopping the machine for a typical test 
  number_checks 

total_cost_a
total_cost_b


# Alternative approach 
total_cost_a <- cost_a + 
  ((pnorm(thres_a, mean_a, sd_a, lower.tail = FALSE)) * cost_stop +   
     ((pnorm(thres_a, mean_a, sd_a, lower.tail = FALSE)) * fix_a * cost_fix)) * 
  number_checks 

total_cost_b <- cost_b + 
  ((pnorm(thres_b, mean_b, sd_b, lower.tail = FALSE)) * cost_stop + 
     ((pnorm(thres_b, mean_b, sd_b, lower.tail = FALSE)) * fix_b * cost_fix)) * 
  number_checks 


### Decision Rule 
if(total_cost_a == total_cost_b) {
  "Impossible to decide"
} else {
  if(total_cost_a > total_cost_b) {
    "Buy Machine B, it's cheaper to buy and operate"
  } else {
    if(total_cost_a < total_cost_b) {
      "Buy Machine A, it's cheaper to buy and operate"
    }
  }
}


