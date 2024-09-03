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

# Abstract

**RegressThat** is an R Shiny web application designed to simplify and streamline the process of performing regression analysis. The application allows users to upload datasets in various formats and select variables for analysis. Users can choose between Logistic Regression and Modified Poisson Regression with Robust Measures. The application provides a user-friendly interface for data input, variable selection, and viewing of analysis results and diagnostic plots.

# Introduction

Regression analysis is a powerful statistical tool used to understand relationships between variables. However, performing regression analysis can be complex and time-consuming, especially for those without a strong statistical background. **RegressThat** aims to make regression analysis more accessible by providing a user-friendly web application that simplifies the process.

# Methods

**RegressThat** is built using the R Shiny framework, which allows for the creation of interactive web applications directly from R. The application leverages several R packages, including `shiny`, `shinyWidgets`, `broom`, `dplyr`, `readr`, `readxl`, `haven`, `foreign`, `textshaping`, `survey`, and `caret`. These packages facilitate data input, perform regression analysis, and generate diagnostic plots.

# Results

**RegressThat** offers a simple and intuitive interface for performing regression analysis. Users can upload datasets in various formats (`.sav`, `.dta`, `.xls`, `.xlsx`, `.dat`, `.csv`, `.rdata`, `.RData`), select variables for analysis, and choose the type of regression to perform. The application executes the regression analysis and presents the results clearly and understandably. Additionally, the application generates diagnostic plots, including Residuals vs Fitted, Normal Q-Q, Scale-Location, and Residuals vs Leverage plots.

# Conclusion

**RegressThat** is a valuable tool for anyone needing to perform regression analysis. By simplifying the process and providing a user-friendly interface, **RegressThat** makes regression analysis more accessible to a wider audience.

# Acknowledgements

I would like to thank the open-source community for the valuable packages used in this application. I also appreciate the support from the Muhimbili University of Health and Allied Sciences during the development of this project.

# References

- R Core Team (2020). R: A language and environment for statistical computing. R Foundation for Statistical Computing, Vienna, Austria. URL https://www.R-project.org/.
- Chang, W., Cheng, J., Allaire, J., Xie, Y., & McPherson, J. (2022). Shiny: Web Application Framework for R. R package version 1.7.3. DOI: 10.5281/zenodo.591753.
- Wickham, H., Averick, M., Bryan, J., Chang, W., McGowan, L. D., François, R., ... & Yutani, H. (2019). "Welcome to the tidyverse." Journal of Open Source Software, 4(43), 1686. DOI: 10.21105/joss.01686.
- Allaire, J. J., Xie, Y., McPherson, J., Luraschi, J., Ushey, K., Atkins, A., ... & Cheng, J. (2017). Rmarkdown: Dynamic Documents for R. R package version 1.8. DOI: 10.5281/zenodo.240720.
- Xie, Y. (2023). R Markdown: The Definitive Guide. CRC Press. DOI: 10.1201/9780429329439.
- Csardi, G., & Nepusz, T. (2006). "The igraph software package for complex network research." InterJournal, Complex Systems, 1695. DOI: 10.5281/zenodo.4300618.
- Liaw, A., & Wiener, M. (2002). "Classification and regression by randomForest." R news, 2(3), 18-22. DOI: 10.48550/arXiv.1106.0665.
- Harrell Jr, F. E. (2015). Regression Modeling Strategies: With Applications to Linear Models, Logistic and Ordinal Regression, and Survival Analysis. Springer. DOI: 10.1007/978-3-319-19425-7.
- Ripley, B., Venables, B., Bates, D. M., Hornik, K., Gebhardt, A., & Firth, D. (2013). Package ‘MASS’. R Package Version 7.3-29. DOI: 10.1201/9780203737793.
- Sievert, C. (2020). Interactive Web-Based Data Visualization with R, Plotly, and Shiny. CRC Press. DOI: 10.1201/9780429820110.
- Grolemund, G., & Wickham, H. (2011). "Dates and times made easy with lubridate." Journal of Statistical Software, 40(3), 1-25. DOI: 10.18637/jss.v040.i03.
- Hothorn, T., Bretz, F., & Westfall, P. (2008). "Simultaneous inference in general parametric models." Biometrical Journal: Journal of Mathematical Methods in Biosciences, 50(3), 346-363. DOI: 10.1002/bimj.200810425.
- Zeileis, A., Kleiber, C., & Jackman, S. (2008). "Regression models for count data in R." Journal of Statistical Software, 27(8), 1-25. DOI: 10.18637/jss.v027.i08.
- Tidyverse (2023). Broom: Convert Statistical Objects into Tidy Tibbles. R package version 0.7.6. DOI: 10.5281/zenodo.4687598.
- Zelazny, M. (2021). "Interactive data visualization with Shiny: Case studies in education." Journal of Statistical Software, 98(10). DOI: 10.18637/jss.v098.i10.
- McPherson, J., & Chang, W. (2015). "Building interactive web apps in R with Shiny." O'Reilly Media, Inc. DOI: 10.5281/zenodo.1331327.
- Kassambara, A. (2018). Machine Learning Essentials: Practical Guide in R. STHDA. DOI: 10.5281/zenodo.2552023.
- Wickham, H. (2014). Advanced R. CRC Press. DOI: 10.1201/9781315381356.
- Kuhn, M. (2008). "Building predictive models in R using the caret package." Journal of Statistical Software, 28(5), 1-26. DOI: 10.18637/jss.v028.i05.
- Eddelbuettel, D., & François, R. (2011). "Rcpp: Seamless R and C++ integration." Journal of Statistical Software, 40(8), 1-18. DOI: 10.18637/jss.v040.i08.
- Tennekes, M. (2018). "tmap: Thematic maps in R." Journal of Statistical Software, 84(6), 1-39. DOI: 10.18637/jss.v084.i06.
