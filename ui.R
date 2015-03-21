shinyUI(fluidPage(
  titlePanel("Gas Mileage for Cars"),
  fluidRow(
    
    #Creating are for input with slider and two text boxes.
    
    column(3, wellPanel(
      sliderInput("weight", "Enter weight of car (in 1000 * lbs):", min = 1.5, max = 5.5, value = 2,
                  step = 0.1),
      numericInput('cyl', 'Enter number of cylinders (4,6 or 8)', 4, min = 4, max = 8, step = 2),
      numericInput('mpg', 'Enter actual mpg for your car', 0, min = 10, max = 40, step = 0.01),
      submitButton("Submit")
    )),
    
    #Creating area for output.
    
    column(6,
           plotOutput("plot1", width = 400, height = 300),
           verbatimTextOutput("text")
    )
  )
))