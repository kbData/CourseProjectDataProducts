require(datasets)
require(ggplot2)
shinyServer(function(input, output) {
        
        # Expression that generates a histogram. The expression is
        # wrapped in a call to renderPlot to indicate that:
        #
        #  1) It is "reactive" and therefore should re-execute automatically
        #     when inputs change
        #  2) Its output type is a plot
        
        
        
                
        
        output$distPlot <- renderPlot({
                
                
                hoursepower<-input$hp
                # draw the histogram with the specified number of bins
                #hist(x, breaks = bins, col = 'darkgray', border = 'white')
                fit <-lm(formula = mpg~hp, data = mtcars)
                coefs<-coef(fit)
                p <- qplot(hp, mpg, data = mtcars)
                prediction<-predict(fit, newdata = data.frame(hp=hoursepower))
                p + geom_abline(intercept = coefs[1], slope=coefs[2]) + geom_point(aes(x=hoursepower, y=prediction), color="red", size=5)
        })
})