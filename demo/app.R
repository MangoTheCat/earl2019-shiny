library(shiny)
library(ggplot2)
library(dplyr)
library(readr)


ui <- fluidPage(
  
  fluidRow(
    selectInput(
      "airport", "Select Origin Airport", 
      choices = list("New York, JFK" = "JFK", 
                     "San Francisco Int." = "SFO",
                     "Chicago O'Hare" = "ORD"))
  ),
  
  fluidRow(
    column(width = 6, 
           plotOutput("dep_vs_arr")),
    column(width = 6, 
           dataTableOutput("arr_delay"))
  )
  
)


server <- function(input, output, session) {
  
  flights <- read_csv("../data/flights08.csv")
  airports <- read_csv("../data/airports.csv") 
  
  
  output$dep_vs_arr <- renderPlot({
    
    airport_data <- flights %>%
      filter(Origin == input$airport)
    
    ggplot(airport_data, aes(DepDelay, ArrDelay)) + 
      geom_point() +
      labs(title = input$airport)
    
  })
  
  
  output$arr_delay <- renderDataTable({
    
    flights %>%
      filter(Origin == input$airport) %>%
      group_by(Dest) %>%
      summarise("Median Arrival Delay" = median(ArrDelay, na.rm = TRUE)) %>%
      left_join(airports, by = c("Dest" = "iata")) %>%
      select(airport, `Median Arrival Delay`) %>%
      arrange(desc(`Median Arrival Delay`))
    
  })
  
}


shinyApp(ui, server)
