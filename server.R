
# This is the server logic for a Shiny web application.

library(shiny)
library(ggplot2)

getBMI <- function(x, y) {
    (x * 0.45) / ((y * 0.025) ^ 2)
}

BMI <- getBMI(women$weight, women$height)
dt <- data.frame(women, BMI = BMI)
minbmi <- floor(min(dt$BMI))
maxbmi <- ceiling(max(dt$BMI))

shinyServer(function(input, output) {

    ## Based on whether a new person details are added, 
    ### lets add another point in "red" color
    dataset <- eventReactive(input$goButton, {
        data.frame(height = ( input$htft * 12 + input$htin ), 
                   weight = input$wt, 
                   BMI = getBMI(input$wt, ( input$htft * 12 + input$htin )) ,
                   row.names = c("New_Obs")
                  )
    })
    
    output$view <- renderTable({
        rbind(sapply(dt, mean), dataset())
    })
    
    output$plot <- renderPlot({
        p <- ggplot(dt, aes_string(x = input$x, y = "BMI")) 
        p <- p + geom_point()
        
        if (input$color != 'None')
            p <- p + aes_string(color=input$color)
        
        if (input$smooth)
            p <- p + geom_smooth()
        
        p <- p + geom_point(data = dataset(), color = "red", size = 5)
        
        print(p)
    })

    output$nTotObs <- renderText({
        paste("Total number of Observations are: ", nrow(dt) + nrow(dataset()))
    })
    
    output$txtAdvsry <- renderText({
        bmi <- round(dataset()$BMI, 2)
        if ( bmi <= maxbmi && bmi >= minbmi )
            paste("BMI value of ", bmi, " is WITHIN the range of Standard values ", 
                  " based on Women dataset")
        else if ( bmi > maxbmi )
            paste("BMI value of ", bmi, " is HIGHER than Standard BMI values!!",
                    "Please regulate your diet or visit your physician.")
        else
            paste("BMI value of ", bmi, " is LOWER than Standard BMI values!!",
                  "Please undertake a dietary exercise or visit your physician.")
    })
})
