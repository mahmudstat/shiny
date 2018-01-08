library(shiny)

# Define UI for app that draws a histogram ----
ui <- fluidPage(

  # App title ----
  titlePanel("Mahmud Shiny App 1!"),

  # Sidebar layout with input and output definitions ----
  sidebarLayout(

    # Sidebar panel for inputs ----
    sidebarPanel(

      # Input: Slider for the number of bars ----
      sliderInput(inputId = "bar",
                  label = "Number of bars:",
                  min = 5,
                  max = 100,
                  value = 10,
                  animate = TRUE)

    ),

    # Main panel for displaying outputs ----
    mainPanel(

      # Output: Histogram ----
      plotOutput(outputId = "distPlot")

    )
  )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {

  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  output$distPlot <- renderPlot({

    x    <- mpg
    bar  <- seq(min(x), max(x), length.out = input$bar + 1)

    hist(x, breaks = bar, col = "#FF8C00", border = "blue",
         xlab = "mpg of mtcars data",
         main = "Histogram of mpg Data")

    })

}

# Create Shiny app ----
shinyApp(ui = ui, server = server)