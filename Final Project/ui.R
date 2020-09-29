library(shiny)
shinyUI(fluidPage(
    titlePanel('Artificial Intelligence + Data Science = AIDS'),
    sidebarLayout(
        mainPanel(
            h3('Artificial Intelligence'),
            plotOutput('my_plot', brush=brushOpts(
                id='my_brush'
            )),
            tabsetPanel(type='tabs',
                        tabPanel('Tab 1', br(), textOutput('output_1')),
                        tabPanel('Tab 2', br(), textOutput('output_2')),
                        tabPanel('Tab 3', br(), textOutput('output_3'))
                        )
        ),
        sidebarPanel(
            h3("Data Science"),
            sliderInput('my_slider', 'Slide Me!', 0, 100, 0),
            submitButton('Submit')
        )
    )
))
