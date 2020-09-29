
library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
    create_random_data <- reactive({
        nsim <- input$nsim_slider
        nsam <- input$nsam_slider
        pop_mean <- input$mean_slider
        pop_sd <- input$sd_slider
        matrix_data <- matrix(rnorm(nsim * nsam, mean=pop_mean, sd=pop_sd), nrow=nsim, ncol=nsam)
        sample_means <- apply(matrix_data, 1, mean)
        data.frame(PMF=sample_means)
    })
    output$output_column <- renderPlot({
        my_data <- create_random_data()
        ggplot(my_data, aes(x=PMF)) + geom_histogram(fill='lightblue', bins=100, aes(y=..density..)) +
            geom_vline(xintercept=input$mean_slider, color='red') +
            stat_function(fun=dnorm, args=list(mean=mean(my_data$PMF), sd=sd(my_data$PMF)), color='yellow')
    })
    output$output_line <- renderPlot({
        my_data <- create_random_data()
        ggplot(my_data, aes(x=PMF)) + geom_density(adjust=0.1, color='orange') +
            geom_vline(xintercept=input$mean_slider, color='red') +
            stat_function(fun=dnorm, args=list(mean=mean(my_data$PMF), sd=sd(my_data$PMF)), color='green')
    })
})
