library(shiny)

shinyUI(fluidPage(
        
        # Application title
        titlePanel("Predict Miles per Gallon of a car"),
        h3("Besed of our linear model you can predict, how many miles per galon a car has. Just input its hourse power."),
        p("The graphic on the right visualizes our prediction model. Black dots are popular car models, the line is our prediction, and the red dot is you car."),
        # Sidebar with a slider input for the number of bins
        sidebarLayout(
                sidebarPanel(
                        sliderInput("hp",
                                    "How many hourse power a car has?",
                                    min = 55,
                                    max = 275,
                                    value = 100),
                        h4("Expected Miles per Galon"),
                        textOutput("mpg")
                ),
                
                # Show a plot of the generated distribution
                mainPanel(
                        plotOutput("distPlot")
                )
        )
))