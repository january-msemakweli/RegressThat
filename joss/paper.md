---
title: 'RegressThat: A User-Friendly R/Shiny Application for Computing Odds Ratios and Risk Ratios for Binary Outcomes'
tags:
  - R
  - Shiny
  - regression analysis
  - logistic regression
  - Modified Poisson regression
  - data science
authors:
  - name: January G. Msemakweli
    orcid: 0009-0007-6743-8479
    affiliation: 1 
affiliations:
  - name: Muhimbili University of Health and Allied Sciences, School of Public Health and Social Sciences, Department of Environmental and Occupational Health, Tanzania
    index: 1
date: 3 September 2024
bibliography: references.bib

---

# Introduction

**RegressThat** is an R Shiny web application designed to simplify and streamline the process of performing regression analysis  [@R-core-team2020][Chang2022]. The application allows users to upload datasets in various formats and select variables for analysis. Users can choose between Logistic Regression and Modified Poisson Regression with Robust Measures . The application provides a user-friendly interface for data input, variable selection, and viewing of analysis results and diagnostic plots. 

# Statement of need

R is a powerful statistical computing language and environment [@R-core-team2020]. Regression analysis is a powerful statistical tool used to understand relationships between variables [Liaw2002]. However, performing regression analysis can be complex and time-consuming, especially for those without a strong statistical background. **RegressThat** aims to make regression analysis more accessible by providing a user-friendly web application that simplifies the process.

# Methods

**RegressThat** is built using the R Shiny framework, which allows for the creation of interactive web applications directly from R. The application leverages several R packages, including `shiny`, `shinyWidgets`, `broom`, `dplyr`, `readr`, `readxl`, `haven`, `foreign`, `textshaping`, `survey`, and `caret` [Wickham2019]. These packages facilitate data input, perform regression analysis, and generate diagnostic plots.

# Results

**RegressThat** offers a simple and intuitive interface for performing regression analysis. Users can upload datasets in various formats (`.sav`, `.dta`, `.xls`, `.xlsx`, `.dat`, `.csv`, `.rdata`, `.RData`), select variables for analysis, and choose the type of regression to perform. The application executes the regression analysis and presents the results clearly and understandably. Additionally, the application generates diagnostic plots, including Residuals vs Fitted, Normal Q-Q, Scale-Location, and Residuals vs Leverage plots. The estimates in the app are Odds ratios or Risk Ratios depending on the analysis performed.

![Regression Diagnostic Plots](https://github.com/january-msemakweli/RegressThat/blob/main/joss/Figures/Diagnostic%20Plots.PNG)

![Regression Results](https://github.com/january-msemakweli/RegressThat/blob/main/joss/Figures/Regression%20Results.PNG)

# Conclusion

**RegressThat** is a valuable tool for anyone needing to perform regression analysis. By simplifying the process and providing a user-friendly interface, **RegressThat** makes regression analysis more accessible to a wider audience.

# Acknowledgements

I would like to thank the open-source community for the valuable packages used in this application. I also appreciate the support from the Muhimbili University of Health and Allied Sciences during the development of this project.

# References
