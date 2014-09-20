
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(UsingR)
# library(caret)
data(yellowfin)
# ModelFit <- train(count ~ year, data=yellowfin, method = "gaussprPoly")
# newdata <- data.frame(year = as.numeric(c("2001", "2002", "2003", "2004", "2005")))
# predictions <- predict(ModelFit, newdata=newdata)
# newdata$count <- predictions
## IMPORTANT NOTE: The code runs fine on my computer, however when I run the 
## application on shinyapps I get an error (caret library causes an error I can't fix). 
## As a workaround, I have manually created a data frame with the same output 
## as from the regression model.
newdata <- data.frame(year=c(2001,2002,2003,2004,2005), count=c(0.4722740,
                        0.4988327, 0.5292916, 0.5636232, 0.6018001))
# points(newdata)

shinyServer(function(input, output) {

  output$fishplot <- renderPlot({

    # plot the count of yellowfin catches from 1952 to 2000
    plot(yellowfin, xlim=c(1952,2005))
    year <- input$year
    lines(c(year, year), c(0,7), col="red", lwd=3)
    text(1965, 6, paste("Year =", year))
    text(1965, 5.5, paste("Count =", round(yellowfin[yellowfin$year==year,2],2)))
    output$PredYear <- renderPrint({input$PredYear})
    points(input$PredYear, newdata[newdata$year==input$PredYear,2], col="green")
    text(1998, 2, paste("Predicted Count = ", 
                        round(newdata[newdata$year==input$PredYear,2],2)), 
         col="green")
  })

})
