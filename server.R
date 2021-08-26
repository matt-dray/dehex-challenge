
server <- function(input, output) {

  # React

  v <- reactiveValues(
    hex_long = NULL
  )

  observeEvent(input$action, {
    v$hex_random <- dehex::dh_random()
  })

  # Hex codes

  output$hex_long <- renderText({
    v$hex_random
  })

  error_message <- "Click 'generate' button"

  output$hex_short <- renderText({
    validate(need(v$hex_random, error_message))
    dehex::dh_shorten(v$hex_random)
  })

  # HSL guides

  output$hex_guide_h <- renderPrint({
    validate(need(v$hex_random, error_message))
    dehex::dh_guide("H", crayon = FALSE)
  })

  output$hex_guide_s <- renderPrint({
    validate(need(v$hex_random, error_message))
    dehex::dh_guide("S", crayon = FALSE)
  })

  output$hex_guide_l <- renderPrint({
    validate(need(v$hex_random, error_message))
    dehex::dh_guide("L", crayon = FALSE)
  })

  # Graphs

  output$hex_graph_simple <- renderPrint({
    validate(need(v$hex_random, error_message))
      dehex::dh_graph(
        dehex::dh_shorten(v$hex_random),
        adorn_h = FALSE,
        adorn_s = FALSE,
        adorn_l = FALSE,
        crayon = FALSE
      )
  })

  output$hex_graph_h <- renderPrint({
    validate(need(v$hex_random, error_message))
    dehex::dh_graph(
      dehex::dh_shorten(v$hex_random),
      adorn_s = FALSE,
      adorn_l = FALSE,
      crayon = FALSE
    )
  })

  output$hex_graph_s <- renderPrint({
    validate(need(v$hex_random, error_message))
    dehex::dh_graph(
      dehex::dh_shorten(v$hex_random),
      adorn_h = FALSE,
      adorn_l = FALSE,
      crayon = FALSE
    )
  })

  output$hex_graph_l <- renderPrint({
    validate(need(v$hex_random, error_message))
    dehex::dh_graph(
      dehex::dh_shorten(v$hex_random),
      adorn_h = FALSE,
      adorn_s = FALSE,
      crayon = FALSE
    )
  })

  output$hex_graph <- renderPrint({
    validate(need(v$hex_random, error_message))
    dehex::dh_graph(
      dehex::dh_shorten(v$hex_random),
      crayon = FALSE
    )
  })

  # Solution

  output$hex_solve <- renderText({
    validate(need(v$hex_random, error_message))
    dehex::dh_solve(v$hex_random)
  })

  output$hex_solve_graphs <- renderPrint({
    validate(need(v$hex_random, error_message))
    invisible(dehex::dh_solve(v$hex_random, graphs = TRUE, crayon = FALSE))
  })

  # Colour sample

  output$hex_swatch <- renderPlot({
    validate(need(v$hex_random, error_message))
    dehex::dh_swatch(dehex::dh_shorten(v$hex_random))
  }, width = 320, height = 100)

}
