# Load necessary packages
library(shiny)
library(shinyWidgets)
library(broom)
library(dplyr)
library(readr)
library(readxl)
library(haven)
library(foreign)
library(textshaping)
library(survey)
library(caret)

# Define UI for the app
ui <- fluidPage(
  # Add custom CSS for positioning the developer tag and enhancing the UI
  tags$head(tags$style(HTML("
    .developer-tag {
      position: fixed;
      bottom: 10px;
      right: 10px;
      font-size: 12px;
      color: gray;
    }
    .custom-title {
      color: blue;
    }
    .custom-sidebar {
      background-color: #f7f7f7;
      padding: 20px;
      border-right: 2px solid #ddd;
    }
    .custom-main {
      background-color: #fafafa;
      padding: 20px;
    }
    .custom-about {
      font-size: 16px;
    }
  "))),
  
  # Title and Developer tag in the main content
  titlePanel(h1("RegressThat", class = "custom-title")),
  
  sidebarLayout(
    sidebarPanel(
      class = "custom-sidebar",
      fileInput("datafile", "Choose a Data File",
                accept = c(".sav", ".dta", ".xls", ".xlsx", ".dat", ".csv", ".rdata", ".RData")),
      uiOutput("varSelectUI"),
      uiOutput("predictorSelectUI"),
      uiOutput("adjustSelectUI"),
      radioButtons("regressionType", "Select Regression Type",
                   choices = c("Logistic Regression", "Modified Poisson Regression (Robust Measures)")),
      actionButton("analyze", "Run Regression")  # Button color retained as requested
    ),
    
    mainPanel(
      class = "custom-main",
      tabsetPanel(
        id = "tabs",
        tabPanel("APP",
                 h2("Application"),
                 tabsetPanel(
                   tabPanel("Data Preview", tableOutput("dataPreview")),  # Data Preview as the first tab
                   tabPanel("Regression Results", verbatimTextOutput("regressionOutput")),
                   tabPanel("Diagnostic Plots", 
                            plotOutput("diagnosticPlot1"),  # Residual vs Fitted
                            plotOutput("diagnosticPlot2"),  # Normal Q-Q
                            plotOutput("diagnosticPlot3"),  # Scale-Location
                            plotOutput("diagnosticPlot4")   # Residuals vs Leverage
                   )
                 )
        ),
        tabPanel("Instructions",
                 h2("Instructions"),
                 p("1. Upload Data: Start by uploading your data file using the 'Choose a Data File' button in the sidebar. Supported formats include .sav, .dta, .xls, .xlsx, .dat, .csv, .rdata, and .RData."),
                 p("2. Select Variables: Choose the outcome variable, predictor variables, and any adjustment variables from the dropdown menus."),
                 p("3. Select Regression Type: Choose between Logistic Regression or Modified Poisson Regression (Robust Measures)."),
                 p("4. Run Regression: Click the 'Run Regression' button to perform the analysis. Results will be displayed in the 'Regression Results' tab."),
                 p("5. View Diagnostic Plots: Check the 'Diagnostic Plots' tab for residuals vs fitted values, normal Q-Q, scale-location, and residuals vs leverage plots."),
                 p("6. Data Preview: The 'Data Preview' tab shows a preview of the uploaded data."),
                 h3("Make sure the outcome variable is binary coded with 0 and 1.")
        ),
        tabPanel("About the Author",
                 h2("About the Author"),
                 div(class = "custom-about",
                     p("Mr. January G. Msemakweli is a distinguished alumnus of Muhimbili University of Health and Allied Sciences (MUHAS), where he earned a Bachelor’s Degree in Environmental Health, graduating with an overall first-class GPA. His academic achievements are complemented by his dedication to developing practical tools for data analysis, as demonstrated by his creation of the Shiny app 'RegressThat.' This app is designed to facilitate various types of regression analyses, making complex statistical tasks more accessible."),
                     h3("Contact Information:"),
                     p("Phone: +255 766 286 223"),
                     p("Address: January G. Msemakweli, Department of Environmental and Occupational Health, School of Public Health and Social Sciences, MUHAS, P.O.BOX 65001 DAR ES SALAAM"),
                     p("Email: msemakwelijanuary@gmail.com")
                 )
        )
      ),
      verbatimTextOutput("errorOutput")  # Output to display errors
    )
  ),
  
  # Developer tag positioned at the bottom right
  tags$div(class = "developer-tag", 
           "DEVELOPER: January G. Msemakweli")
)


# Define server logic
server <- function(input, output, session) {
  
  # Reactive expression to load the data
  dataset <- reactive({
    req(input$datafile)
    file <- input$datafile$datapath
    ext <- tools::file_ext(file)
    tryCatch({
      switch(ext,
             sav = read_sav(file),
             dta = read.dta(file),  # Support for Stata .dta files using foreign package
             xls = read_excel(file),
             xlsx = read_excel(file),
             dat = read_delim(file, delim = "\t"),
             csv = read_csv(file),
             rdata = get(load(file)),
             RData = get(load(file)),
             stop("Unsupported file type"))
    }, error = function(e) {
      output$errorOutput <- renderPrint({ paste("Error loading data:", e$message) })
      NULL  # Return NULL if there's an error
    })
  })
  
  # Generate UI for variable selection
  output$varSelectUI <- renderUI({
    req(dataset())
    selectInput("outcomeVar", "Select Outcome Variable", choices = names(dataset()))
  })
  
  output$predictorSelectUI <- renderUI({
    req(dataset())
    selectInput("predictors", "Select Predictor Variables", choices = names(dataset()), multiple = TRUE)
  })
  
  output$adjustSelectUI <- renderUI({
    req(dataset())
    selectInput("adjustVars", "Adjust for (Optional)", choices = names(dataset()), multiple = TRUE)
  })
  
  # Perform regression analysis and store the model globally for later use
  model <- reactiveVal(NULL)  # Reactive value to store the model
  
  observeEvent(input$analyze, {
    req(input$outcomeVar, input$predictors)
    
    tryCatch({
      formula <- as.formula(paste(input$outcomeVar, "~", paste(input$predictors, collapse = "+")))
      
      if (input$regressionType == "Logistic Regression") {
        m <- glm(formula, data = dataset(), family = binomial())
        model(m)  # Store the model in the reactive value
        
        tidy_model <- tidy(m, conf.int = TRUE)
        tidy_model <- tidy_model %>% mutate(estimate = exp(estimate),
                                            conf.low = exp(conf.low),
                                            conf.high = exp(conf.high))
        
        if (!is.null(input$adjustVars)) {
          formula_adjusted <- as.formula(paste(input$outcomeVar, "~", paste(c(input$predictors, input$adjustVars), collapse = "+")))
          m_adjusted <- glm(formula_adjusted, data = dataset(), family = binomial())
          tidy_model_adjusted <- tidy(m_adjusted, conf.int = TRUE) %>% 
            mutate(estimate = exp(estimate), 
                   conf.low = exp(conf.low), 
                   conf.high = exp(conf.high))
          output$regressionOutput <- renderPrint({
            cat("Crude Odds Ratios (COR) with 95% CI and P-value:\n")
            print(tidy_model)
            cat("\nAdjusted Odds Ratios (AOR) with 95% CI and P-value:\n")
            print(tidy_model_adjusted)
          })
        } else {
          output$regressionOutput <- renderPrint({
            cat("Crude Odds Ratios (COR) with 95% CI and P-value:\n")
            print(tidy_model)
          })
        }
        
      } else if (input$regressionType == "Modified Poisson Regression (Robust Measures)") {
        m <- glm(formula, data = dataset(), family = quasipoisson(link = "log"))
        model(m)  # Store the model in the reactive value
        
        robust_model <- svyglm(formula, design = svydesign(ids = ~1, data = dataset()), family = quasipoisson())
        
        tidy_model <- tidy(m, conf.int = TRUE)
        tidy_robust <- tidy(robust_model, conf.int = TRUE)
        
        tidy_model <- tidy_model %>% mutate(estimate = exp(estimate),
                                            conf.low = exp(conf.low),
                                            conf.high = exp(conf.high))
        tidy_robust <- tidy_robust %>% mutate(estimate = exp(estimate),
                                              conf.low = exp(conf.low),
                                              conf.high = exp(conf.high))
        
        if (!is.null(input$adjustVars)) {
          formula_adjusted <- as.formula(paste(input$outcomeVar, "~", paste(c(input$predictors, input$adjustVars), collapse = "+")))
          m_adjusted <- glm(formula_adjusted, data = dataset(), family = quasipoisson(link = "log"))
          robust_model_adjusted <- svyglm(formula_adjusted, design = svydesign(ids = ~1, data = dataset()), family = quasipoisson())
          tidy_model_adjusted <- tidy(m_adjusted, conf.int = TRUE) %>% 
            mutate(estimate = exp(estimate), 
                   conf.low = exp(conf.low), 
                   conf.high = exp(conf.high))
          tidy_robust_adjusted <- tidy(robust_model_adjusted, conf.int = TRUE) %>% 
            mutate(estimate = exp(estimate), 
                   conf.low = exp(conf.low), 
                   conf.high = exp(conf.high))
          output$regressionOutput <- renderPrint({
            cat("Crude Risk Ratios (CRR) with 95% CI and P-value:\n")
            print(tidy_model)
            cat("\nAdjusted Risk Ratios (ARR) with 95% CI and P-value:\n")
            print(tidy_model_adjusted)
          })
        } else {
          output$regressionOutput <- renderPrint({
            cat("Crude Risk Ratios (CRR) with 95% CI and P-value:\n")
            print(tidy_model)
            cat("\nRobust Risk Ratios with 95% CI and P-value:\n")
            print(tidy_robust)
          })
        }
      }
    }, error = function(e) {
      output$errorOutput <- renderPrint({ paste("Error in regression analysis:", e$message) })
    })
  })
  
  # Render diagnostic plots using the stored model
  output$diagnosticPlot1 <- renderPlot({
    req(model())  # Ensure the model is available
    tryCatch({
      plot(model(), which = 1)  # Residuals vs Fitted
    }, error = function(e) {
      output$errorOutput <- renderPrint({ paste("Error in generating diagnostic plot 1:", e$message) })
    })
  })
  
  output$diagnosticPlot2 <- renderPlot({
    req(model())  # Ensure the model is available
    tryCatch({
      plot(model(), which = 2)  # Normal Q-Q
    }, error = function(e) {
      output$errorOutput <- renderPrint({ paste("Error in generating diagnostic plot 2:", e$message) })
    })
  })
  
  output$diagnosticPlot3 <- renderPlot({
    req(model())  # Ensure the model is available
    tryCatch({
      plot(model(), which = 3)  # Scale-Location
    }, error = function(e) {
      output$errorOutput <- renderPrint({ paste("Error in generating diagnostic plot 3:", e$message) })
    })
  })
  
  output$diagnosticPlot4 <- renderPlot({
    req(model())  # Ensure the model is available
    tryCatch({
      plot(model(), which = 5)  # Residuals vs Leverage
    }, error = function(e) {
      output$errorOutput <- renderPrint({ paste("Error in generating diagnostic plot 4:", e$message) })
    })
  })
  
  # Display data preview
  output$dataPreview <- renderTable({
    req(dataset())
    head(dataset())
  })
}

# Run the application
shinyApp(ui = ui, server = server)
