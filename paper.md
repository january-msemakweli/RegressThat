---
title: 'RegressThat: An R Shiny Application for Advanced Regression Analysis'
tags:
  - R
  - Shiny
  - regression analysis
  - logistic regression
  - Modified Poisson regression
  - data science
authors:
  - name: January G. Msemakweli
    orcid: 0000-0000-0000-0000  # Replace with your actual ORCID
    affiliation: "1" 
affiliations:
  - name: Muhimbili University of Health and Allied Sciences, Tanzania
    index: 1
date: 3 September 2024
bibliography: references.bib
---

# Summary

**RegressThat** is an R Shiny application designed for performing advanced regression analyses, including Logistic Regression and Modified Poisson Regression with robust measures. The app is tailored for researchers, data analysts, and students who require an accessible yet powerful tool for exploring complex relationships within their datasets. It supports a wide range of data formats, including `.sav`, `.dta`, `.xls`, `.xlsx`, `.dat`, `.csv`, and `.RData`.

# Statement of Need

Statistical analysis is a cornerstone of data-driven research across various disciplines. However, performing advanced regression analyses can be daunting, especially when adjusting for multiple variables or dealing with robust measures. **RegressThat** addresses this need by providing an intuitive user interface that guides users through the process of performing Logistic Regression and Modified Poisson Regression, complete with diagnostic plots and data preview options.

The app is designed to be user-friendly while retaining the flexibility and depth needed for sophisticated analyses. Whether you are a student learning about regression techniques or a seasoned researcher, **RegressThat** simplifies the process, enabling you to focus on interpreting your results rather than getting bogged down in coding.

# Application Features

- **Data Upload:** Users can upload data in various formats, including `.sav`, `.dta`, `.xls`, `.xlsx`, `.dat`, `.csv`, and `.RData`.
- **Variable Selection:** The app provides dynamic dropdown menus for selecting outcome variables, predictor variables, and adjustment variables.
- **Regression Types:** Supports Logistic Regression and Modified Poisson Regression (Robust Measures).
- **Regression Results:** Outputs Crude Odds Ratios (COR) and Adjusted Odds Ratios (AOR) with 95% Confidence Intervals and p-values.
- **Diagnostic Plots:** Provides essential diagnostic plots, including Residuals vs Fitted, Normal Q-Q, Scale-Location, and Residuals vs Leverage.
- **Data Preview:** A tab for previewing the uploaded dataset.

# Usage Instructions

1. **Upload Data:** Start by uploading your data file using the 'Choose a Data File' button in the sidebar.
2. **Select Variables:** Choose the outcome variable, predictor variables, and any adjustment variables from the dropdown menus.
3. **Select Regression Type:** Choose between Logistic Regression or Modified Poisson Regression (Robust Measures).
4. **Run Regression:** Click the 'Run Regression' button to perform the analysis. Results will be displayed in the 'Regression Results' tab.
5. **View Diagnostic Plots:** Check the 'Diagnostic Plots' tab for various regression diagnostics.
6. **Data Preview:** The 'Data Preview' tab shows a preview of the uploaded data.

# About the Author

**January G. Msemakweli** is a distinguished alumnus of Muhimbili University of Health and Allied Sciences (MUHAS), where he earned a Bachelor’s Degree in Environmental Health, graduating with an overall first-class GPA. His academic achievements are complemented by his dedication to developing practical tools for data analysis, as demonstrated by his creation of the Shiny app **RegressThat**.

### Contact Information:
- **Phone:** +255 766 286 223
- **Address:** Department of Environmental and Occupational Health, School of Public Health and Social Sciences, MUHAS, P.O.BOX 65001, DAR ES SALAAM, Tanzania
- **Email:** msemakwelijanuary@gmail.com

# Acknowledgements

We acknowledge contributions from the R Shiny community and the support provided by Muhimbili University of Health and Allied Sciences during the development of this project.

# References

