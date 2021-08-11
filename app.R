
library(shiny)
library(dehex)

ui <- fluidPage(

    actionButton("action", label = "Get hex!"),

    hr(),
    textOutput("hex_long"),
    textOutput("hex_short"),
    tags$details(verbatimTextOutput("hex_graph")),

    hr(),
    tags$details(verbatimTextOutput("hex_guide_h")),
    tags$details(verbatimTextOutput("hex_guide_s")),
    tags$details(verbatimTextOutput("hex_guide_l")),

    hr(),
    textOutput("hex_solve"),
    plotOutput("hex_swatch")

)

server <- function(input, output) {

    v <- reactiveValues(hex_long = NULL)

    observeEvent(input$action, {
        v$hex_random <- dehex::dh_random()
    })

    output$hex_long <- renderText({
        v$hex_random
    })

    output$hex_short <- renderText({
        dehex::dh_shorten(v$hex_random)
    })

    output$hex_guide_h <- renderPrint({
        dehex::dh_guide("H", crayon = FALSE)
    })

    output$hex_guide_s <- renderPrint({
        dehex::dh_guide("S", crayon = FALSE)
    })

    output$hex_guide_l <- renderPrint({
        dehex::dh_guide("L", crayon = FALSE)
    })

    output$hex_solve <- renderText({
        dehex::dh_solve(v$hex_random)
    })

    output$hex_graph <- renderPrint({
        dehex::dh_graph(
            dehex::dh_shorten(v$hex_random),
            text = "",
            crayon = FALSE
        )
    })

    output$hex_swatch <- renderPlot({
        dehex::dh_swatch(dehex::dh_shorten(v$hex_random))
    })

}

shinyApp(ui = ui, server = server)
