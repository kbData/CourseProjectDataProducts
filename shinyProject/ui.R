library(shiny)

shinyUI(fluidPage(
        
        # Application title
        titlePanel("Hello Shiny!"),
        
        # Sidebar with a slider input for the number of bins
        sidebarLayout(
                sidebarPanel(
                        sliderInput("hp",
                                    "Number of bins:",
                                    min = 75,
                                    max = 250,
                                    value = 100)
                ),
                
                # Show a plot of the generated distribution
                mainPanel(
                        plotOutput("distPlot")
                )
        )
))