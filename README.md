# RegressThat

## Overview
**RegressThat** is a Shiny application designed to simplify regression analysis, offering a user-friendly interface for running Logistic Regression and Modified Poisson Regression (Robust Measures). The app allows users to upload data, select variables, and obtain both crude and adjusted estimates, complete with confidence intervals and p-values. Additionally, users can explore diagnostic plots to assess model performance.

## Features
- **Data Upload**: Supports multiple file formats, including `.sav`, `.dta`, `.xls`, `.xlsx`, `.dat`, `.csv`, and `.rdata`.
- **Variable Selection**: Provides dynamic dropdown menus for selecting outcome, predictor, and adjustment variables.
- **Regression Types**: Allows selection between Logistic Regression and Modified Poisson Regression (Robust Measures).
- **Regression Results**: Outputs crude and adjusted odds or risk ratios with 95% confidence intervals and p-values.
- **Diagnostic Plots**: Generates plots for Residuals vs Fitted, Normal Q-Q, Scale-Location, and Residuals vs Leverage.
- **Error Handling**: Captures and displays errors encountered during data loading or regression analysis.

## Getting Started

### Prerequisites
Ensure that you have R installed on your machine along with the following packages:

```r
install.packages(c("shiny", "shinyWidgets", "broom", "dplyr", "readr", "readxl", "haven", "foreign", "textshaping", "survey", "caret"))
## Running the App
To run the application, use the following steps:

1. **Clone or Download** this repository to your local machine.
2. **Open RStudio** and set the working directory to the folder containing `app.R`.
3. **Run the app** using the following command:

```r
shiny::runApp("app.R")
