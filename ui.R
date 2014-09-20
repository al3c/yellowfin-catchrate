
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Yellowfin Catch Rate between 1952 and 2000"),
  
  # Sidebar with a slider input for year
  sidebarLayout(
    sidebarPanel(
      sliderInput("year",
                  "Year:",
                  min = 1952,
                  max = 2000,
                  value = 1990,
                  step = 1),
      selectInput("PredYear", "Catch Rate Predictions:",
                       c("2001" = "2001", "2002" = "2002", "2003" = "2003",
                         "2004" = "2004", "2005" = "2005"), multiple = F),
      hr(),
      p(HTML(paste("This is a simple shiny app to show historical data as well as", 
                   "predicted data.",
                   "The dataset comes from the UsingR package and shows",
                   "the yellow fin tuna catch rate in the Tropical Indian Ocean",
                   "between 1952-2000. Catch rates for 2001-2005 were predicted",
                   "using a simple polynomial regression model."))),
      p(HTML("To view the catch rate from the original dataset, drag the slider above.")),
      p(HTML("To select a year (between 2001-2005) to predict the catch rate, select from the dropdown menu."))
    ),
    
    # Show a plot of the catch rate
    mainPanel(
      plotOutput("fishplot"),
      h4("You selected"),
      verbatimTextOutput("PredYear")
    )
  )
))
