
ui <- fluidPage(

    # style ----
    theme = bslib::bs_theme(
        bg = "#111",
        fg = "#DDD",
        primary = "#F00",
        secondary = "#00F",
        base_font = bslib::font_google("Overpass Mono"),  # DM Mono, Manjari, Varela, Balzamiq Sans, Comfortaa, Syne Mono, Atkinson Hyperlegible
        code_font = bslib::font_google("Overpass Mono")
    ),

    tags$style(HTML("#title{font-size:50px;}")),
    tags$style(HTML("#title,h2,h3{color:#0F0;}")),

    h1(id = "title", "Learn to read colour hex codes"),
    p(
        "[WIP] A demo of the R package",
        a(href = "https://github.com/matt-dray/dehex", "{dehex}"),
        " following",
        a(href = "https://metafizzy.co/blog/read-color-hex-codes/", "David DeSandro's method")
    ),
    br(),

    sidebarLayout(

        sidebarPanel(

            # start ----

            p("Generate a random code then follow the steps in the tabs",),
            p(actionButton("action", label = "Generate")),
            tags$span(textOutput("hex_long"), style = "font-size:50px;")

            # # dehex logo ----
            # p(),
            # img(
            #     src = "logo.png",
            #     alt = "A hexagon-shaped logo with the text 'dehex' in the lower right and a bar chart with a single red, green and blue bar that originates in the top left.",
            #     width = "100px"
            #     #style = "display: block; margin-left: auto; margin-right: auto;"
            # ),
            #
            # # meta ----
            # HTML(
            #     "<p>Made with <a href='https://shiny.rstudio.com/'>{shiny}</a> | ",
            #     "<a href='https://github.com/matt-dray/dehex-challenge'>app source</a> | ",
            #     "<a href='https://github.com/matt-dray/dehex'>{dehex} source</a>"
            # )

        ),

        mainPanel(

            tabsetPanel(

                type = "tabs",

                # tab 1 ----
                tabPanel(
                    title = "1. Shorten",
                    h3("Task"),
                    p("Simplify your hex code from six to three values."),
                    h3("Explanation"),
                    tags$div(
                        tags$ul(
                            tags$li("There are three pairs of alphanumeric characters in a colour hex code"),
                            tags$li("The pairs represent red, green and blue (so #A1B2C3 encodes A1 for red, B2 for green and C3 for blue)"),
                            tags$li("The first value of each pair contains enough information for our needs (so #A1B2C3 becomes #ABC)")
                        )
                    ),
                    h3("Hints"),
                    HTML(
                        paste(
                            "<p><details><summary style='color:red'>Reveal short code for generated hex</summary>",
                            tags$span(textOutput("hex_short"), style = "font-size:50px;"),
                            "</details></p>"
                        )
                    )
                ),

                # tab 2 ----
                tabPanel(
                    title = "2. RGB",
                    h3("Task"),
                    p("Convert your shortened hex code to a bar chart of decimal values for red, green and blue."),
                    h3("Explanation"),
                    tags$div(
                        tags$ul(
                            tags$li("The alphanumeric values are in hexadecimal code, taking values of 0 to 9 then A to F, which represent 10 to 15 in decimal"),
                            tags$li("So you can convert your shortened hex code to decimal values  (so #ABC encodes 10, 11 and 12 for red, green and blue)"),
                            tags$li("Imagine a bar chart of these values to get a sense of the RGB 'profile' of your shortened hex code")
                        )
                    ),
                    h3("Hints"),
                    HTML(
                        paste(
                            "<details><summary style='color:red'>Reveal simple RGB profile</summary>",
                            "You'll compare this against other bar charts in the next few steps.",
                            verbatimTextOutput("hex_graph_simple"),
                            "</details>"
                        )
                    )
                ),

                # tab 3 ----
                tabPanel(
                    title = "3. Hue",
                    h3("Task"),
                    p("Select the hue with the closest RGB profile to your shortened hex code."),
                    h3("Explanation"),
                    tags$div(
                        tags$ul(
                            tags$li("'Hue' is basically the 'name' of a colour, e.g. 'red'"),
                            tags$li("You can infer hue from the relative ranking in the amount of red, blue and green (so #F11 has a lot of red and a tied, smaller amount of green and blue)"),
                            tags$li("Compare the relative RGB rankings of your shortened hex code against profiles for the primary colours of red, green and blue, and their secondary and tertiary mixtures")
                        )
                    ),
                    h3("Hints"),
                    HTML(
                        paste(
                            "<p><details><summary style='color:red'>Reveal RGB profile with hue guide</summary>",
                            "The 'H' at the end of the bar shows how the decimal RGB values rank against each other (1 is smallest, ties are possible)",
                            verbatimTextOutput("hex_graph_h"),
                            "</details></p>"
                        )
                    ),
                    HTML(
                        paste(
                            "<p><details><summary style='color:red'>Reveal hue guides</summary>",
                            "Which RGB hue-rank profile best matches the one for your shortened hex code?",
                            "To keep it simple, we're only using hue-rank profiles for red, green, blue and their secondary and tertiary mixtures.",
                            verbatimTextOutput("hex_guide_h"),
                            "</details></p>"
                        )
                    ),
                    HTML(
                        paste(
                            "<P><details><summary style='color:red'>Reveal hue solution</summary>",
                            "placeholder",
                            "</details></p>"
                        )
                    )
                ),

                # tab 4 ----
                tabPanel(
                    title = "4. Saturation",
                    h3("Task"),
                    p("Select the saturation level that has the closest range to your shortened hex code."),
                    h3("Explanation"),
                    tags$div(
                        tags$ul(
                            tags$li("Saturation is like the 'intensity' of a colour"),
                            tags$li("The greater the range of the RGB values, the more saturated"),
                        )
                    ),
                    h3("Hints"),
                    HTML(
                        paste(
                            "<p><details><summary style='color:red'>Reveal RGB profile with saturation guide</summary>",
                            "The 'S' column has been added to help you see the range of RGB values.",
                            verbatimTextOutput("hex_graph_s"),
                            "</details></p>"
                        )
                    ),
                    HTML(
                        paste(
                            "<p><details><summary style='color:red'>Reveal saturation guides</summary>",
                            "Which of these RGB ranges best matches that of your shortened hex code? To keep things simple, we'll only look at three intensities (plus grey, which has zero range).",
                            verbatimTextOutput("hex_guide_s"),
                            "</details></p>"
                        )
                    ),
                    HTML(
                        paste(
                            "<p><details><summary style='color:red'>Reveal saturation solution</summary>",
                            "placeholder",
                            "</details></p>"
                        )
                    )
                ),

                # tab 5 ----
                tabPanel(
                    title = "5. Lightness",
                    h3("Task"),
                    p("Select the lightness value that has the closest mean RGB value to your shortened hex code."),
                    h3("Explanation"),
                    tags$div(
                        tags$ul(
                            tags$li("Lightness is as it sounds: how light or dark is the colour?"),
                            tags$li("We can assess this by looking at the average of the RGB values"),
                            tags$li("The higher the value, the lighter the colour"),
                        )
                    ),
                    h3("Hints"),
                    HTML(
                        paste(
                            "<p><details><summary style='color:red'>Reveal RGB profile with lightness guide</summary>",
                            "The 'L' column has been added to help you see the average of the RGB values.",
                            verbatimTextOutput("hex_graph_l"),
                            "</details></p>"
                        )
                    ),
                    HTML(
                        paste(
                            "<p><details><summary style='color:red'>Reveal lightness guides</summary>",
                            "Which of these has the most similar average RGB value to your shortened hex code's average?",
                            verbatimTextOutput("hex_guide_l"),
                            "</details></p>"
                        )
                    ),
                    HTML(
                        paste(
                            "<p><details><summary style='color:red'>Reveal lightness solution</summary>",
                            "placeholder",
                            "</details></p>"
                        )
                    )
                ),

                # tab 6 ----
                tabPanel(
                    title = "6. Solve",
                    h3("Task"),
                    p("Put the hue, saturation and lightness levels together to get the rough colour name."),
                    HTML(
                        paste(
                            "<p><details><summary style='color:red'>Reveal best matches</summary>",
                            verbatimTextOutput("hex_solve_graphs"),
                            "</details></p>"
                        )
                    ),
                    HTML(
                        paste(
                            "<p><details><summary style='color:red'>Reveal the answer</summary>",
                            tags$span(textOutput("hex_solve"), style = "font-size:50px;"),
                            plotOutput("hex_swatch"),
                            "</details></p>"
                        )
                    )
                )  # tabPanel
            )  # tabsetPanel
        )  # mainPanel
    )  # sidebarLayout
)  # fluidPage
