
server <- function(input, output) {

  # React

  v <- reactiveValues(hex_long = NULL)

  observeEvent(input$action, {
    v$hex_random <- dehex::dh_random()
  })

  # Hex codes

  output$hex_long <- renderText({
    v$hex_random
  })

  output$hex_short <- renderText({
    dehex::dh_shorten(v$hex_random)
  })

  # HSL guides

  output$hex_guide_h <- renderPrint({
    dehex::dh_guide("H", crayon = FALSE)
  })

  output$hex_guide_s <- renderPrint({
    dehex::dh_guide("S", crayon = FALSE)
  })

  output$hex_guide_l <- renderPrint({
    dehex::dh_guide("L", crayon = FALSE)
  })

  # Graphs

  output$hex_graph_simple <- renderPrint({
    dehex::dh_graph(
      dehex::dh_shorten(v$hex_random),
      adorn_h = FALSE,
      adorn_s = FALSE,
      adorn_l = FALSE,
      crayon = FALSE
    )
  })

  output$hex_graph <- renderPrint({
    dehex::dh_graph(
      dehex::dh_shorten(v$hex_random),
      crayon = FALSE
    )
  })

  # Solution

  output$hex_solve <- renderText({
    dehex::dh_solve(v$hex_random)
  })

  # Colour sample

  output$hex_swatch <- renderPlot({
    dehex::dh_swatch(dehex::dh_shorten(v$hex_random))
  })

}
