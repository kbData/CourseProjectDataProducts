require(datasets)
require(ggplot2)
fit<-lm(formula = mpg~hp, data = mtcars)
coefs<-coef(fit)

shinyServer(function(input, output) {
        graphic<-qplot(hp, mpg, data = mtcars)+
                xlab("Hourse power")+
                ylab("Miles per Gallon")+
                geom_abline(intercept = coefs[1], slope=coefs[2])

        
        prediction <- reactive({
                predict(fit, newdata = data.frame(hp=input$hp))
        })
        output$distPlot <- renderPlot({        
                #add big red prediction point to display our prediction
                graphic + geom_point(aes(x=input$hp, y=prediction()), color="red", size=5)
        })
        
        output$mpg<-renderText({
                prediction()
        })
})