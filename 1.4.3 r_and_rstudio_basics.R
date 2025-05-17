#' Title:   1.4.3 R and RStudio Basics 
#' Author: 
#' Date: 
#' Inputs:  None
#' Outputs: None
#' Purpose: Introducing basic R commands 
#' Notes:   This file contains the various code snippets from Activity 1.4.3 for 
#'          those experiencing difficulties in creating a script file. 
#'          Sometimes RStudio cannot create new files on networked computers. 
#'          A work-around is: 
#'             1) Create an empty .txt file in the working directory 
#'             2) In RStudio, go to files, select the file and rename. Change the 
#'                file extension from .txt to .R


# Example 1 - Defining a variable -----------------------------------------
x <- 1


# Example 2 - Doing calculations with a variable -------------------------
x <- 2
y <- x + 2
z <- x ^ 2 
# Notice that when you highlight the code and select run (or press CTRL + ENTER), 
# the variables (and their definitions), appear in the environment section 

# To output these to the console: 
x 
y 
z


# Example 3 - Vector/Array example ----------------------------------------
heights <- c(166, 177, 164, 167, 177) 
mean(heights) 
median(heights) 
min(heights) 
quantile(heights) 
sd(heights) 
# Notice the new heights variable in the values section. 
# Notice the output of the answers in the console section. 


# Example 4 - descriptive statistics and the summary function -------------
summary(heights)
# Notice the output in the console section.


# Example 5 - Data frame --------------------------------------------------
data_df <- data.frame(name  = c("A", "B", "C"), 
                      value = c(1, 2, 3))

# Notice in the environment section above the values there is a a data section 
# with data_df which identifies there are 3 observation of 2 variables. 
# The icon beside the data_df can be clicked to show the data included in the frame
