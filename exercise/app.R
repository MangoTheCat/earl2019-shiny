library(shiny)
library(dplyr)
library(ggplot2)
library(broom)


ui <- fluidPage(
  
  sidebarLayout(
    
    sidebarPanel(
      
      selectInput(
        "coef", "Select Model Coefficient (x-axis):", 
        choices = c("DayOfWeek", "DepTime", "AirTime", "Distance"), 
        selected = "Distance"
      ),
      
      sliderInput(
        "nsamp", "Number of Random Samples:", 
        value = 10000, min = 0, max = 20000, step = 1000
      )
    ),
    
    
    mainPanel(
      fluidRow(
        column(width = 6, 
               plotOutput("delay")
        ),
        column(width = 6, 
               plotOutput("model")
        )
      ),
      fluidRow(
        dataTableOutput("coeffs")
      )
    )
  )
)


server <- function(input, output, session) {
  
  atlanta <- read_csv("../data/flights08.csv") %>%
    filter(Origin == "ATL")
  
  fit_model <- reactive({
    
    model <- paste0("DepDelay ~ ", input$coef)
    
    lm(as.formula(model), data = atlanta)
    
  })
  
  
  output$model <- renderPlot({
    
    hour_delay <- atlanta %>% 
      filter(DepDelay > 60)
    
    ggplot(data = hour_delay, aes_string(input$coef, "DepDelay")) + 
      geom_point() +
      geom_smooth(method = "lm")
    
  })
  
  
  output$delay <- renderPlot({
    
    random_sample <- atlanta %>% 
      sample_n(input$nsamp)
    
    ggplot(data = random_sample, aes(DepDelay)) + 
      geom_histogram()
    
  })
  
  
  output$coeffs <- renderDataTable({
    
    fit_model() %>%
      tidy()
    
  })
  
}


shinyApp(ui, server)
