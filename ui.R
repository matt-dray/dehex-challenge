
ui <- fluidPage(

    theme = bslib::bs_theme(
        bg = "#111",
        fg = "#DDD",
        primary = "#F00",
        secondary = "#00F",
        base_font = bslib::font_google("Varela Round")
    ),

    tags$style(HTML("#title{color: #0F0;}")),

    # App title ----
    h1(id = "title", "Learn to read colour hex codes"),

    # Sidebar layout with input and output definitions ----
    sidebarLayout(

        # Sidebar panel for inputs ----
        sidebarPanel(
            img(
                src = "/logo.png",
                alt = paste(
                    "A hexagon-shaped logo with the text 'dehex' in the lower right",
                    "and a bar chart with a single red, green and blue bar that",
                    "originates in the top left."
                ),
                width = "100px",
                style = "display: block; margin-left: auto; margin-right: auto;"
            ),


            br(),
            "Work in progress: a demo of the R package",
            a(href = "https://github.com/matt-dray/dehex", "{dehex}"),
            " following",
            a(href = "https://metafizzy.co/blog/read-color-hex-codes/", "David DeSandro"),
            p(),
            "Get a random hex code and try to work out the colour." ,
            "Make use of the guides to help you.",
            p(),

            hr(),
            actionButton("action", label = "Get random hex"),
            p(),
            tags$span(textOutput("hex_long"), style = "font-size:50px;"),

            hr(),
            HTML(
                "Made with <a href='https://shiny.rstudio.com/'>{shiny}</a> | ",
                "<a href='https://github.com/matt-dray/dehex-challenge'>app source</a> | ",
                "<a href='https://github.com/matt-dray/dehex'>{dehex} source</a>"
            )
        ),

        # Main panel for displaying outputs ----
        mainPanel(

            # Output: Tabset w/ plot, summary, and table ----
            tabsetPanel(
                type = "tabs",
                tabPanel(
                    title = "1. Shorten",
                    h2("1. Shorten"),
                    "Shorten the hex code from six to three characters",
                    p(),
                    HTML(
                        paste(
                            "<details><summary>Reveal short code</summary>",
                            textOutput("hex_short"),
                            "</details>"
                        )
                    )
                ),
                tabPanel(
                    title = "2. RGB profile",
                    h2("2. Define RGB profile"),
                    "Shorten the hex code from six to three digits.",
                    p(),
                    HTML(
                        paste(
                            "<details><summary>Reveal simple RGB profile</summary>",
                            verbatimTextOutput("hex_graph_simple"),
                            "</details>"
                        )
                    ),
                    HTML(
                        paste(
                            "<details><summary>Reveal RGB profile with HSL guides</summary>",
                            verbatimTextOutput("hex_graph"),
                            "</details>"
                        )
                    )
                ),
                tabPanel(
                    title = "3. Hue",
                    h2("3. Hue"),
                    "Match the RGB profile.",
                    p(),
                    HTML(
                        paste(
                            "<details><summary>Reveal hue guides</summary>",
                            verbatimTextOutput("hex_guide_h"),
                            "</details>"
                        )
                    ),
                    HTML(
                        paste(
                            "<details><summary>Reveal hue solution</summary>",
                            "placeholder",
                            "</details>"
                        )
                    )
                ),
                tabPanel(
                    title = "4. Saturation",
                    h2("4. Saturation"),
                    "Match the RGB range.",
                    p(),
                    HTML(
                        paste(
                            "<details><summary>Reveal saturation guides</summary>",
                            verbatimTextOutput("hex_guide_s"),
                            "</details>"
                        )
                    ),
                    HTML(
                        paste(
                            "<details><summary>Reveal saturation solution</summary>",
                            "placeholder",
                            "</details>"
                        )
                    )

                ),
                tabPanel(
                    title = "5. Lightness",
                    h2("5. Lightness"),
                    "Match the mean RGB value.",
                    p(),
                    HTML(
                        paste(
                            "<details><summary>Reveal lightness guides</summary>",
                            verbatimTextOutput("hex_guide_l"),
                            "</details>"
                        )
                    ),
                    HTML(
                        paste(
                            "<details><summary>Reveal lightness solution</summary>",
                            "placeholder",
                            "</details>"
                        )
                    )
                ),
                tabPanel(
                    title = "6. Solution",
                    h2("Solution"),
                    "What colour is the shortened hex code as an English phrase?",
                    p(),
                    HTML(
                        paste(
                            "<details><summary>Reveal the answer</summary>",
                            textOutput("hex_solve"),
                            "</details>"
                        )
                    ),

                    hr(),
                    h2("Sample"),
                    "What does the colour represented by the shortened hex code actually look like?",
                    p(),
                    HTML(
                        paste(
                            "<details><summary>Reveal a colour sample</summary>",
                            plotOutput("hex_swatch", width = "100%", height = 200),
                            "</details>"
                        )
                    )
                )
            )
        )

    )
)



# ui <- fluidPage(
#
#     h1("Learn to read colour hex codes"),
#     p(),
#
#     img(
#         src = "/logo.png",
#         alt = paste(
#             "A hexagon-shaped logo with the text 'dehex' in the lower right",
#             "and a bar chart with a single red, green and blue bar that",
#             "originates in the top left."
#         ),
#         width = "100px"
#     ),
#
#     br(),
#     "Work in progress: a demo of the R package",
#     a(href = "https://github.com/matt-dray/dehex", "{dehex}"),
#     " following",
#     a(href = "https://metafizzy.co/blog/read-color-hex-codes/", "David DeSandro"),
#     p(),
#     "Get a random hex code and try to work out the colour." ,
#     "Make use of the guides to help you.",
#     p(),
#
#     hr(),
#     h2("Start"),
#     actionButton("action", label = "Get random hex"),
#     p(),
#     textOutput("hex_long"),
#
#     hr(),
#     h2("1. Shorten"),
#     "Shorten the hex code from six to three characters",
#     p(),
#     HTML(
#         paste(
#             "<details><summary>Reveal short code</summary>",
#             textOutput("hex_short"),
#             "</details>"
#         )
#     ),
#
#     hr(),
#     h2("2. Define RGB profile"),
#     "Shorten the hex code from six to three digits.",
#     p(),
#     HTML(
#         paste(
#             "<details><summary>Reveal simple RGB profile</summary>",
#             verbatimTextOutput("hex_graph_simple"),
#             "</details>"
#         )
#     ),
#     HTML(
#         paste(
#             "<details><summary>Reveal RGB profile with HSL guides</summary>",
#             verbatimTextOutput("hex_graph"),
#             "</details>"
#         )
#     ),
#
#     hr(),
#     h2("2. Hue"),
#     "Match the RGB profile.",
#     p(),
#     HTML(
#         paste(
#             "<details><summary>Reveal hue guides</summary>",
#             verbatimTextOutput("hex_guide_h"),
#             "</details>"
#         )
#     ),
#     HTML(
#         paste(
#             "<details><summary>Reveal hue solution</summary>",
#             "placeholder",
#             "</details>"
#         )
#     ),
#
#     hr(),
#     h2("4. Saturation"),
#     "Match the RGB range.",
#     p(),
#     HTML(
#         paste(
#             "<details><summary>Reveal saturation guides</summary>",
#             verbatimTextOutput("hex_guide_s"),
#             "</details>"
#         )
#     ),
#     HTML(
#         paste(
#             "<details><summary>Reveal saturation solution</summary>",
#             "placeholder",
#             "</details>"
#         )
#     ),
#
#     hr(),
#     h2("5. Lightness"),
#     "Match the mean RGB value.",
#     p(),
#     HTML(
#         paste(
#             "<details><summary>Reveal lightness guides</summary>",
#             verbatimTextOutput("hex_guide_l"),
#             "</details>"
#         )
#     ),
#     HTML(
#         paste(
#             "<details><summary>Reveal lightness solution</summary>",
#             "placeholder",
#             "</details>"
#         )
#     ),
#
#     hr(),
#     h2("Solution"),
#     "What colour is the shortened hex code as an English phrase?",
#     p(),
#     HTML(
#         paste(
#             "<details><summary>Reveal the answer</summary>",
#             textOutput("hex_solve"),
#             "</details>"
#         )
#     ),
#
#     hr(),
#     h2("Sample"),
#     "What does the colour represented by the shortened hex code actually look like?",
#     p(),
#     HTML(
#         paste(
#             "<details><summary>Reveal a colour sample</summary>",
#             plotOutput("hex_swatch"),
#             "</details>"
#         )
#     ),
#
#     hr(),
#     HTML(
#         "Made with <a href='https://shiny.rstudio.com/'>{shiny}</a> | ",
#         "<a href='https://github.com/matt-dray/dehex-challenge'>app source</a> | ",
#         "<a href='https://github.com/matt-dray/dehex'>{dehex} source</a>"
#     )
#
# )
