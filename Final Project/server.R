
library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
    my_points <- data.frame(X=runif(0, 0, 100), Y=runif(0, 0, 100))
    
    our_data <- reactive({
        brushed_data <- brushedPoints(my_points, input$my_brush, xvar='X', yvar='Y')
        brushed_data
    })
    
    output$my_plot <- renderPlot({
        n <- input$my_slider^2
        cut_points <- our_data()
        print(cut_points)
        if (nrow(cut_points) == 0) {
            my_points <<- data.frame(X=runif(n, 0, 100), Y=runif(n, 0, 100))
        } else {
            my_points <<- cut_points
        }
        ggplot(my_points, aes(x=X, y=Y)) + geom_point()
    })
})
