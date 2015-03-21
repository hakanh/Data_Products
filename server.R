shinyServer(function(input, output) {

  #Plots mpg as function of weight for chosen number of cylinders.
  #Linerar regression line drawn and predicted mpg value marked with blue spot.
  #Entered mpg value for your own car marked with red spot,
  
  output$plot1 <- renderPlot({
    res<-lm(mpg~wt, mtcars, cyl==input$cyl)
    value<-res$coef[1]+res$coef[2]*input$weight
    plot(mpg~wt, subset(mtcars, cyl==input$cyl), xlab="weight (kilo lbs)")
    abline(lm(mpg~wt, mtcars, cyl==input$cyl))
    points(input$weight, value,col="blue", lwd=10)
    points(input$weight, input$mpg,col="red", lwd=10)
  })
  
  #Text giving predicted mpg value for chosen weight and number of cylinders.
  
  output$text <- renderText({
    res<-lm(mpg~wt, mtcars, cyl==input$cyl)
    value<-res$coef[1]+res$coef[2]*input$weight
    paste("Predicted Gas Mileage with", input$cyl, "cylinders and", input$weight, "kilo lbs of weight is", round(value,2),"mpg.")
  })
  
  
})