
# RegressThat

## Description
**RegressThat** is a Shiny application developed by Mr. January G. Msemakweli. This app allows users to perform logistic and modified Poisson regression analyses on various datasets, providing both crude and adjusted results with associated diagnostic plots.

## Prerequisites
To run the application, you need to have the following R packages installed:

```r
install.packages(c("shiny", "shinyWidgets", "broom", "dplyr", "readr", "readxl", "haven", "foreign", "textshaping", "survey", "caret"))
```

## Running the App
To run the application, use the following steps:

1. Clone or Download this repository to your local machine.
2. Open RStudio and set the working directory to the folder containing `app.R`.
3. Run the app using the following command:

```r
shiny::runApp("app.R")
```

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
