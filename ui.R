
# This is the user-interface definition of a Shiny web application.

library(shiny)
library(ggplot2)
dataset <- women

shinyUI(fluidPage(

  # Application title
  titlePanel("Calculate BMI "),
  p("This Shiny App provides the following functionalities:  "),
  p(" 1. It plots the BMI of Women using the 'Women' dataset in R   "),
  p(" 2. It allows the user to add details (weight and height) of another person "),
  p(" 3. It calculates the BMI for the newly entered details and shows the relative position ",
    "    of the new observation against those of 'Women' dataset ."),
  p(" The App finally allows a comparison between the average BMIs of women in the past",
    "    with that of the newly entered person values "),

  # Sidebar with a select input to enter details of a new person
  sidebarLayout(
    sidebarPanel(
        helpText("The below section is used for adding details of a person"),
        sliderInput("wt", "Weight (in lbs):", 
                    min=1, max=200,
                    value=130, 
                    step=1, round=0),
        numericInput("htft", label = "Height (in Feet):", value = 5, 
                     min = 3, max = 8),
        numericInput("htin", label = "Height (in Inches):", value = 4, 
                     min = 0, max = 12),
        actionButton("goButton", "Add"),
        p("Click the button to add the details of the person entered above into the main panel."),
        
        br(),
        helpText("The below section is used for the purpose of plotting the values"),
        selectInput('x', 'X', names(dataset)),
        selectInput('color', 'Color', c('None', names(dataset))),
        
        checkboxInput('smooth', 'Smooth')
    ),

    # Show a plot of the generated distribution
    mainPanel(
        verbatimTextOutput("nTotObs"),
        plotOutput("plot"),

        tableOutput("view"),
        verbatimTextOutput("txtAdvsry")
    )
  )
))
