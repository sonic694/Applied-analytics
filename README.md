# Applied Analytics
# R Data Analysis and Statistics Repository

This repository contains a comprehensive collection of R scripts and R Markdown files for learning and implementing data analysis, statistics, and visualization techniques. The materials are organized in a structured manner, progressing from basic R programming concepts to advanced statistical distributions and analyses.

## 📚 Repository Contents

### Getting Started with R
- **R Basics** (1.4.3): Introduction to basic R commands, variables, and simple calculations
- **Loading Datasets** (1.4.4): Methods to import CSV, TXT, and XLSX files into R
- **Data Manipulation** (1.4.5): Techniques for filtering, subsetting, and transforming data using dplyr

### Descriptive Statistics and Visualization
- **Descriptive Statistics with Diamonds Dataset** (1.5.2): Summary statistics and plots using the diamonds dataset
- **Income Example Statistics** (1.5.3): Mean, median, and visualization techniques for income data
- **Visualizations with ggplot2** (1.6.3): Creating different types of visualizations using income demographics data

### Probability Distributions
- **Expected Values** (2.1.4): Calculating means and standard deviations with dice roll examples
- **Uniform Distributions** (2.2.1, 2.2.3): Continuous and discrete uniform distribution concepts and applications
- **Binomial Distribution** (2.3.1, 2.3.2, 2.3.3): Theory, context, and data simulations
- **Normal Distribution** (2.4.1, 2.4.2, 2.4.3): Properties, applications in business contexts, and Q-Q plots
- **Poisson and Exponential Distributions** (2.5.1, 2.5.2, 2.5.3): Introduction, contextual applications, and special properties
- **Bivariate Normal Distribution** (2.6.2): Generating and visualizing data from bivariate normal distributions
- **Random Sampling** (2.2.3): Implementation of simple random sampling techniques

## 📋 Prerequisites

To run these scripts, you'll need:

- R (version 4.0.0 or higher recommended)
- RStudio (recommended for working with R Markdown files)
- Required R packages (installation instructions included in scripts):
  - dplyr, ggplot2, readr, magrittr, here (for data manipulation and visualization)
  - MASS, VGAM, purrr, plyr (for statistical functions)
  - RColorBrewer (for advanced plotting)
  - lubridate (for date handling)
  - forcats (for factor manipulation)
  - readxl, openxlsx (for Excel file handling)

## 🔍 Data Files

The scripts use several datasets including:
- Diamonds dataset (with price and attribute data for ~54,000 diamonds)
- Bicycle dataset (traffic survey data)
- AusIncomeSample dataset (Australian income demographic data)

The repository assumes a project structure with a "data" folder containing these datasets.

## 🚀 Getting Started

1. Clone this repository
2. Open the project in RStudio
3. Install required packages using the installation commands in the scripts
4. Create a "data" folder in your project directory (if not already present)
5. Add the required datasets to the "data" folder
6. Run the scripts in numerical order for a progressive learning experience

## 📁 Folder Structure

The repository assumes the following folder structure:
```
project_root/
├── data/              # Place datasets here
├── outputs/           # Generated outputs will be saved here
└── scripts/           # R and R Markdown files
```

## 📖 File Naming Convention

Files follow a numbering system reflecting their module and section:
- 1.x.x files cover basic R operations and descriptive statistics
- 2.x.x files focus on probability distributions and statistical analyses

## 🔗 Additional Resources

For more information on the R programming language and statistical concepts covered in this repository, consider these resources:
- [R Project for Statistical Computing](https://www.r-project.org/)
- [RStudio Documentation](https://docs.rstudio.com/)
- [The Comprehensive R Archive Network (CRAN)](https://cran.r-project.org/)
- [R for Data Science by Hadley Wickham](https://r4ds.had.co.nz/)

## 📝 Notes

- These materials appear to be part of a structured learning course on data analysis and statistics using R
- Examples progress in complexity and build upon concepts introduced in earlier files
- The R Markdown (.Rmd) files contain both code and explanatory text, making them excellent learning resources

Happy analyzing!​​​​​​​​​​​​​​​​