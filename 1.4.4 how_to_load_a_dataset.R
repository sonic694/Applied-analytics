#' Title:   1.4.4 How to Load a Dataset 
#' Author: 
#' Date: 
#' Inputs:  None
#' Outputs: None
#' Purpose: To learn how to import CSV, TXT and XLSX files into R 
#' Notes:   The syntax assumes that you have a folder for this course, 
#'          and an .RProj file in that folder. It also assumes that in the same 
#'          course folder, you have a folder named "syntax" in which you save 
#'          your .R and .RMD files, and a folder named "data" in which you save 
#'          your data files. We also will use R to create a folder named "outputs"


### FOLDER STRUCTURE ### 
# Please read the notes above about the presumed folder structure. 


# Preliminaries -----------------------------------------------------------
#' We shall make use of the {readr} package, the {readxl} package and the 
#' {openxlsx} package 
#' 
#' Before using the package, it needs to be installed. Install these packages 
#' by either clicking on the "Packages" tab in the RStudio pane in the bottom 
#' right-hand corner, or by using the "install.packages()" function. You only 
#' need to install a package once (unless you need to update to a newer version), 
#' however you will need to load it in every session in which you wish to use it. 
#' 
#' These lines have been commented out, because you only need to run them once. 
#' To uncomment them (or to re-comment them after uncommenting), select the line 
#' and click CTRL+SHIFT+C 
# install.packages("readr")
# install.packages("readxl") 
# install.packages("openxlsx") 
# install.packages("dplyr")


# Load packages 
library(readr) 
library(readxl) 
library(openxlsx) 
library(dplyr)


# Importing and exporting data --------------------------------------------
#' The following steps will take you through the process of importing a comma 
#' separated variable (CSV) dataset into R using RStudio. RStudio also allows you 
#' to open data stored in a wide range of file types including Excel, SPSS, SAS 
#' and Stata. All datasets must follow the tidy data rules.
#' 
#' You can also import data directly using code. The code depends on the type of 
#' dataset being imported. As an example, two slightly differently formatted text 
#' files are available on the Module webpage. 


# Importing a CSV file ----------------------------------------------------
#' To import a .csv file we can use the read.csv() function from Base R. You 
#' may need to provide a direct path to your .csv file depending on where it is 
#' located (as described above, we are assuming that there is a "data" folder in 
#' the same location as the .RProj file). We can also use read_csv() from the 
#' {readr} package. If you have not yet installed and loaded the {readr} package, 
#' please do so now. 
#' 
#' Here we will go though a data manipulation process using the test data. 

bicycle <- read.csv("data/Bicycle.csv")
#' Note the use of forward slashes to distinguish folders. We can also use ".." to 
#' go up a folder level. For example, if our RProj was in the syntax folder and we
#' needed to go up a level and then down into the data folder, we could do so in 
#' this manner: "../data/Bicycle.csv"
#' 
#' You can also navigate to an entirely different folder by pasting the whole file 
#' path into the function. It is important to note, however, that when doing this, 
#' you will need to use forward slashes. Copying from Windows Explorer may result 
#' in back slashes, which will need to be replaced. 
#' 
#' You might also wish to set paths and subsequently concatenate the file 
#' location from the file path and file name. If this is the case, it's best to 
#' set file paths as constants early in your R syntax, as this makes them easier 
#' to find and update when sharing work with colleagues, or to update them if 
#' the folder structure on your machine changes. 
#' 
#' This is one of the major advantages of using projects. When you move to a
#' nother computer, the relative path will still work.


#' To ensure that the file was correctly loaded, it is always good practice to 
#' look at the data frame using the following:
View(bicycle)

#' We can also read the file in using readr::read_csv() 
bicycle2 <- read_csv("data/Bicycle.csv")
#' Note that both bicycle and bicycle2 have the same number of observations and 
#' variables. 

View(bicycle2)



# Importing a TXT file ----------------------------------------------------
#' If the file was tab delimited (.txt) we can change to the more general 
#' read.delim() function. We have to instruct R how the dataset is delimited 
#' using sep = and also treat the first row of data as the header row with 
#' header = TRUE. We could also use read_delim() from the {readr} package. 

bicycle3 <- read.delim("data/Bicycle.txt", header = TRUE, sep = "\t")
bicycle4 <- read_delim("data/Bicycle.txt", delim = "\t") 


# Reading an RDS file -----------------------------------------------------
#' RDS files are R data files that are serialised and therefore smaller on disk. 
#' They also carry the formatting that existed when they were in the R environment, 
#' for example, if a column of numbers had been formatted to be characters, the 
#' RDS file created when they were saved will also show them as characters, not 
#' numbers, when they are read back into R. 

bicycle5 <- readRDS("data/Bicycle.RDS") 

# You will note that NB_TRAFFIC_SURVEY has been imported as a factor, as this 
# was the data type of this variable in the data frame when it was exported as 
# an RDS. This means that you can perform data wrangling steps on the data and 
# save it out without losing the results of that wrangling. 


# Importing from Excel ----------------------------------------------------
#' If the file was in XLSX format, we can use either the {openxlsx} package or 
#' the {readxl} package. The {openxlsx} package provides more options for 
#' exporting R outputs to Excel, including formatting options such as borders, 
#' fonts and cell colours. The {readxl} package is required, however, to read 
#' Excel files in the older .XLS format (this package can read both .XLS and 
#' .XLSX formats). 

# If we need to check the sheets that exist in the Workbook, we can use: 
bicycle_sheets <- getSheetNames("data/Bicycle.xlsx") # openxlsx function 
bicycle_sheets <- excel_sheets("data/Bicycle.xlsx")  # readxl function
# Obviously, this workbook is a bit boring, with just one sheet, but it works 
# just as well for larger workbooks with many sheets 

bicycle6 <- read.xlsx("data/Bicycle.xlsx", sheet = 1)
# Note, we can specify the sheet by its location in the workbook (eg, sheet 1), 
# or by the sheet name: 
bicycle6 <- read.xlsx("data/Bicycle.xlsx", sheet = "Bicycle")
# We can also specify a startRow if there are rows that need skipping in the 
# original file. 

# The readxl package can also open .XLSX files: 
bicycle7 <- read_xlsx("data/Bicycle.xlsx", sheet = "Bicycle")

# Although we can use either package for reading XLSX files, we can only use 
# the {readxl} package if we are trying to read XLS files: 
bicycle8 <- read_xls("data/Bicycle.xls", sheet = 1)


# Exporting data ----------------------------------------------------------
#' Before exporting the data, we should set up an "outputs" folder for our files. 
#' We can do this by telling R to check if the folder already exists, and if not, 
#' create it: 

if(!dir.exists("outputs")) {
  dir.create("outputs")
}

# Note that we used the negation symbol, "!" to indicate that if the director 
# DOES NOT exist, it should be created. The curly brackets tell R what to do if 
# the condition in the if() statement is met - in this case, if the condition 
# (that the folder doesn't exist) is TRUE, it will create the folder. In this 
# example, we didn't use an else, but we can also specify what R should do if 
# the condition is not met. 


# Exporting to CSV --------------------------------------------------------
#' Once again, the dataset must be in a tidy data format for these importation 
#' methods to work. If these methods fail, re-check your data. Eventually you 
#' will need to get the data out of R. You can use the write.table function for 
#' this purpose.
write.table(bicycle7, file = "outputs/experiment.csv", sep = ",", col.names = TRUE, row.names = FALSE)

#' col.names ensures a header row is included, row.names suppresses the printing 
#' of row numbers (you don’t tend to need this) and sep determines the file type, 
#' in this example, comma-delimited. The file argument names and locates where 
#' the file will be saved. 
#' 
# 'There are also shortcut functions for common data file types:
  
write.csv(bicycle, file = "outputs/experiment.csv") 

# We can also use the {readr} package to export a CSV file 
write_csv(bicycle, file = "outputs/Bicycle.CSV")


# Saving an RDS file ------------------------------------------------------
#' Saving RDS files is relatively straightforward, using the saveRDS() function: 
saveRDS(bicycle, "outputs/Bicycle.RDS")

# We can also combine saving out a file (including CSV files, but demonstrated 
# here with an RDS file) as part of a pipe. This is useful if we wish to do a few 
# data preprocessing steps and then save out a summary, such as a frequency count: 

bicycle %>% 
  count(DS_LOCATION) %>% 
  saveRDS("outputs/Bicycle Location Summary.RDS")
# The pipe operator is from the {magrittr} package, and also included in the {dplyr} 
# package. You can think of it as saying "and then do this..." The count() function 
# is also from the {dplyr} package and produces frequency counts. 


# Exporting to Excel ------------------------------------------------------
#' The {openxlsx} and {readxl} packages can both export data frames to Excel files, 
#' which can be helpful in providing files to management, however {openxlsx} supports 
#' more formatting options, which can sometimes be expected by non-analysts. 

# Some simple functions for exporting to Excel are: 

wb <- createWorkbook() # We are creating a workbook and calling it "wb" for now 
modifyBaseFont(wb, fontSize = 8, fontName = "Arial")

addWorksheet(wb, sheetName = "bicycle")
addWorksheet(wb, sheetName = "bicycle2") 
addWorksheet(wb, sheetName = "bicycle3")

writeData(wb, 
          sheet = "bicycle", 
          x = bicycle,  # This is the data we are exporting 
          startCol = 2, # Just to see what this does... 
          startRow = 3, 
          borders = "all")
writeData(wb, 
          sheet = "bicycle2", 
          x = bicycle2, 
          startRow = 1, 
          startCol = 1, 
          borders = "none")
writeData(wb, 
          sheet = "bicycle3", 
          x = bicycle3)

freezePane(wb, sheet = "bicycle", firstActiveRow = 2) # We can also create freezepanes 

# The {openxlsx} package can also incorporate colours and other formatting, but 
# we won't explore this in this syntax. 

# Finally, we need to save out the Excel workbook 
saveWorkbook(wb, file = "outputs/bicycle.xlsx", overwrite = TRUE)
# We are saving out the wb workbook to this file location. The overwrite argument
# tells R what to do if a file already exists with this name in this location. 
# If you don't wish to overwrite existing files, it can be set to FALSE. 

