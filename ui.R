
ui <- fluidPage(

    theme = bslib::bs_theme(  # style ----
        bg = "#111",
        fg = "#DDD",
        primary = "#F00",
        secondary = "#00F",
        base_font = bslib::font_google("Varela Round")
    ),

    tags$style(HTML("#title{color:#0F0;font-size:60px;}")),
    tags$style(HTML("#subtitle{color:#0F0;}")),

    h1(id = "title", "Learn to read colour hex codes"),

    sidebarLayout(

        sidebarPanel(
            img(  # dehex logo ----
                src = "/logo.png",
                alt = "A hexagon-shaped logo with the text 'dehex' in the lower right and a bar chart with a single red, green and blue bar that originates in the top left.",
                width = "100px",
                style = "display: block; margin-left: auto; margin-right: auto;"
            ),


            br(),
            p(  # blurb ---
                "Work in progress: a demo of the R package",
                a(href = "https://github.com/matt-dray/dehex", "{dehex}"),
                " following",
                a(href = "https://metafizzy.co/blog/read-color-hex-codes/", "David DeSandro")
            ),

            hr(),
            "Start by generating a random colour hex code",  # start ----
            p(),
            p(actionButton("action", label = "Generate")),
            tags$span(textOutput("hex_long"), style = "font-size:50px;"),
            p("Now follow the steps in the main-panel tabs"),


            hr(),
            HTML(  # meta ----
                "Made with <a href='https://shiny.rstudio.com/'>{shiny}</a> | ",
                "<a href='https://github.com/matt-dray/dehex-challenge'>app source</a> | ",
                "<a href='https://github.com/matt-dray/dehex'>{dehex} source</a>"
            )
        ),

        mainPanel(

            tabsetPanel(

                type = "tabs",

                tabPanel(  # tab 1 ----
                    title = "1. Shorten",
                    h2(id = "subtitle", "1. Shorten"),
                    br(),
                    p("Task: simplify your hex code from six to three values."),
                    br(),
                    tags$div(
                        tags$ul(
                            tags$li("There are three pairs of alphanumeric characters in a colour hex code (think of #A1B2C3 as A1-B2-C3)"),
                            tags$li("The pairs represent red, green and blue (so #A1B2C3 encodes A1 for red, B2 for green and C3 for blue)"),
                            tags$li("The first value of each pair contains enough information for our needs (so #A1B2C3 becomes #ABC)")
                        )
                    ),
                    br(),
                    HTML(
                        paste(
                            "<details><summary style='color:red'>Reveal short code for generated hex</summary>",
                            tags$span(textOutput("hex_short"), style = "font-size:50px;"),
                            "</details>"
                        )
                    )
                ),

                tabPanel(  # tab 2 ----
                    title = "2. RGB profile",
                    h2(id = "subtitle", "2. RGB profile"),
                    br(),
                    p("Task: convert your shortened hex code to a bar chart of decimal values for red, green and blue."),
                    br(),
                    tags$div(
                        tags$ul(
                            tags$li("The alphanumeric values are in hexadecimal code, taking values of 0 to 9 then A to F, which represent 10 to 15 in decimal"),
                            tags$li("So your shortened hex code has  (so #ABC is 10, 11 and 12 for red, green and blue)")
                        )
                    ),
                    br(),
                    HTML(
                        paste(
                            "<details><summary style='color:red'>Reveal simple RGB profile</summary>",
                            verbatimTextOutput("hex_graph_simple"),
                            "</details>"
                        )
                    )
                ),

                tabPanel(  # tab 3 ----
                    title = "3. Hue",
                    h2(id = "subtitle", "3. Hue"),
                    br(),
                    p("Task: select the hue with the closest RGB profile to your shortened hex code."),
                    br(),
                    tags$div(
                        tags$ul(
                            tags$li("'Hue' is basically the 'name' of a colour, like 'red', 'orange' or 'grey'"),
                            tags$li("For simplicity, we'll use only the primary colours of red, green and blue, and their secondary and tertiary mixtures"),
                            tags$li("Hue is represented by the relative ranking in the amount of red, blue and green, so #F11 has a lot of red and a tied, smaller amount of green and blue")
                        )
                    ),
                    br(),
                    # HTML(
                    #     paste(
                    #         "<details><summary style='color:red'>Reveal RGB profile with HSL guides</summary>",
                    #         verbatimTextOutput("hex_graph"),
                    #         "</details>"
                    #     )
                    # ),
                    HTML(
                        paste(
                            "<details><summary style='color:red'>Reveal hue guides</summary>",
                            verbatimTextOutput("hex_guide_h"),
                            "</details>"
                        )
                    ),
                    HTML(
                        paste(
                            "<details><summary style='color:red'>Reveal hue solution</summary>",
                            "placeholder",
                            "</details>"
                        )
                    )
                ),

                tabPanel(  # tab 4 ----
                    title = "4. Saturation",
                    h2(id = "subtitle", "4. Saturation"),
                    br(),
                    p("Task: select the saturation level that has the closest range to your shortened hex code."),
                    br(),
                    tags$div(
                        tags$ul(
                            tags$li("Saturation is like the 'intensity' of a colour"),
                            tags$li("The greater the range of the RGB values, the more saturated"),
                            tags$li("To keep things simple, we'll only look at three intensities (plus grey, which has zero range)"),
                        )
                    ),
                    br(),
                    # HTML(
                    #     paste(
                    #         "<details><summary style='color:red'>Reveal RGB profile with HSL guides</summary>",
                    #         verbatimTextOutput("hex_graph"),
                    #         "</details>"
                    #     )
                    # ),
                    HTML(
                        paste(
                            "<details><summary style='color:red'>Reveal saturation guides</summary>",
                            verbatimTextOutput("hex_guide_s"),
                            "</details>"
                        )
                    ),
                    HTML(
                        paste(
                            "<details><summary style='color:red'>Reveal saturation solution</summary>",
                            "placeholder",
                            "</details>"
                        )
                    )
                ),

                tabPanel(  # tab 5 ----
                    title = "5. Lightness",
                    h2(id = "subtitle", "5. Lightness"),
                    br(),
                    p("Task: select the lightness value that has the closest mean RGB value to your shortened hex code."),
                    br(),
                    tags$div(
                        tags$ul(
                            tags$li("Lightness is as it sounds: how light or dark is the colour?"),
                            tags$li("We can assess this by looking at the average of the RGB values"),
                            tags$li("The higher the value, the lighter the colour"),
                        )
                    ),
                    br(),
                    # HTML(
                    #     paste(
                    #         "<details><summary style='color:red'>Reveal RGB profile with HSL guides</summary>",
                    #         verbatimTextOutput("hex_graph"),
                    #         "</details>"
                    #     )
                    # ),
                    HTML(
                        paste(
                            "<details><summary style='color:red'>Reveal lightness guides</summary>",
                            verbatimTextOutput("hex_guide_l"),
                            "</details>"
                        )
                    ),
                    HTML(
                        paste(
                            "<details><summary style='color:red'>Reveal lightness solution</summary>",
                            "placeholder",
                            "</details>"
                        )
                    )
                ),

                tabPanel(  # tab 6 ----
                    title = "6. Solution",
                    h2(id = "subtitle", "Solution"),
                    br(),
                    tags$div(
                        tags$ul(
                            tags$li("do"),
                            tags$li("the"),
                            tags$li("thing"),
                        )
                    ),
                    br(),
                    # HTML(
                    #     paste(
                    #         "<details><summary style='color:red'>Reveal RGB profile with HSL guides</summary>",
                    #         verbatimTextOutput("hex_graph"),
                    #         "</details>"
                    #     )
                    # ),
                    HTML(
                        paste(
                            "<details><summary style='color:red'>Reveal the answer</summary>",
                            tags$span(textOutput("hex_solve"), style = "font-size:50px;"),
                            plotOutput("hex_swatch", width = "100%", height = 200),
                            "</details>"
                        )
                    )
                )
            )
        )

    )
)
