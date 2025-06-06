# MATH2406 Applied Analytics - Assessment 2

## Overview
This repository contains the R Markdown report for Assessment 2 of MATH2406 Applied Analytics. The project demonstrates practical applications of statistical concepts including probability distributions, sampling distributions, confidence intervals, hypothesis testing, and ANOVA through five scenario-based problems.

## Author
Steven Byrne

## Project Structure
The assessment consists of five problems that test understanding of key statistical concepts:

### Problem 1: Flu Vaccination Experiment
- Simulates flu infection rates in vaccinated vs unvaccinated groups using binomial distribution
- Calculates probabilities and confidence intervals
- Analyzes vaccine effectiveness with 40% population uptake

### Problem 2: Exponential Distribution and Central Limit Theorem
- Generates observations from exponential distribution (mean = 10)
- Demonstrates CLT by analyzing sample means of different sizes (n=2 and n=30)
- Compares sample statistics with theoretical values

### Problem 3: Paired t-test for Package Design
- Analyzes milk carton design attractiveness ratings
- Conducts one-tailed paired t-test
- Provides management recommendations based on statistical findings

### Problem 4: Bivariate Normal Distribution Tests
- Compares paired observations with different sample sizes (n=10 vs n=30)
- Demonstrates the effect of sample size on statistical power
- Uses multivariate normal distribution to generate correlated data

### Problem 5: ANOVA for Promotional Scenarios
- Compares three promotional strategies for chocolate sales
- Tests with different standard deviations (σ=30 vs σ=25)
- Includes post-hoc Tukey HSD tests when significant differences are found

## Prerequisites
- R (version 4.0 or higher recommended)
- RStudio
- Required R packages:
  - `dplyr` - Data manipulation
  - `ggplot2` - Data visualization
  - `readr` - Reading data files
  - `magrittr` - Pipe operators
  - `MASS` - Multivariate normal distribution

## Installation
1. Clone this repository or download the R Markdown file
2. Install required packages:
```r
install.packages(c("dplyr", "ggplot2", "readr", "magrittr", "MASS"))
```

## Usage
1. Open the `.Rmd` file in RStudio
2. Ensure all required packages are installed
3. Set the working directory appropriately
4. Run all chunks or knit the document to generate the report

**Important**: The analysis uses `set.seed(3112668)` for reproducibility. This ensures that random number generation produces consistent results.

## Output
The R Markdown file can be knitted to produce:
- HTML document (with paged data frames)
- Word document
- PDF document (requires LaTeX installation)

## Key Statistical Methods Used
- **Binomial Distribution**: Modeling binary outcomes (flu infection)
- **Exponential Distribution**: Analyzing waiting times/intervals
- **Central Limit Theorem**: Understanding sampling distributions
- **Confidence Intervals**: Estimating population parameters
- **Hypothesis Testing**: 
  - One-sample t-test
  - Paired t-test
  - ANOVA (Analysis of Variance)
- **Post-hoc Tests**: Tukey's HSD for multiple comparisons

## Report Features
- Clear problem statements and solutions
- Comprehensive code comments explaining each step
- Visualizations using ggplot2
- Statistical interpretations in plain language
- Reflection on test results and their practical implications

## Notes
- Maximum report length: 15 pages (excluding references/appendix/code)
- All random data generation uses student ID as seed for reproducibility
- Statistical significance level: α = 0.05 throughout

## License
This project is submitted as part of academic coursework for MATH2406 at RMIT University.
