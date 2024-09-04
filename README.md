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


## Using the App
- **Upload Data**: Use the "Choose a Data File" button to upload your dataset.
- **Select Variables**: Choose the outcome, predictor, and optional adjustment variables from the dropdown menus.
- **Select Regression Type**: Choose between Logistic Regression or Modified Poisson Regression.
- **Run Analysis**: Click the "Run Regression" button to perform the analysis. The results will be displayed in the "Regression Results" tab.
- **View Diagnostic Plots**: Check the "Diagnostic Plots" tab for various diagnostic plots.

## Instructions Tab
Detailed instructions on using the app are available within the application under the "Instructions" tab.

## About the Author
Mr. January G. Msemakweli, a distinguished alumnus of Muhimbili University of Health and Allied Sciences (MUHAS), developed **RegressThat**. He holds a Bachelor’s Degree in Environmental Health and graduated with an overall first-class GPA. His academic achievements are complemented by his dedication to developing practical tools for data analysis, as demonstrated by this app. He can be contacted at:

- **Phone**: +255 766 286 223
- **Email**: msemakwelijanuary@gmail.com
- **Address**: January G. Msemakweli, Department of Environmental and Occupational Health, School of Public Health and Social Sciences, MUHAS, P.O.BOX 65001 DAR ES SALAAM
