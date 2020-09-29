library(shiny)
shinyUI(fluidPage(
    titlePanel('Artificial Intelligence + Data Science = AIDS'),
    sidebarLayout(
        mainPanel(
            h3('Central Limit Theorem Visualization'),
            tabsetPanel(type='tabs',
                        tabPanel('Column plot', br(), plotOutput('output_column')),
                        tabPanel('Line plot', br(), plotOutput('output_line')),
                        tabPanel('Instruction', br(), div('Instruction: Use the sliders to modify parameters, which are use to randomly generate sample mean, which centers at the population means. You can see the effects of the number of simulations, as well as the size of sample on the theorem. With this, you can easily see what the Central Limit Theorem is.'))
            )
        ),
        sidebarPanel(
            h3('Simulation parameters'),
            sliderInput('nsim_slider', 'How many simulations?', 100, 10000, 100),
            sliderInput('nsam_slider', 'How samples to simulate?', 10, 100, 10),
            sliderInput('mean_slider', 'What is the population mean?', 0, 1000, 0),
            sliderInput('sd_slider', 'What is the population standard deviation?', 1, 100, 1)
        )
    )
))
