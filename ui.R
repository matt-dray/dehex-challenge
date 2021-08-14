
ui <- fluidPage(

    h1("Learn to read colour hex codes"),
    p(),

    img(
        src = "/logo.png",
        alt = paste(
            "A hexagon-shaped logo with the text 'dehex' in the lower right",
            "and a bar chart with a single red, green and blue bar that",
            "originates in the top left."
        ),
        width = "100px"
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
    h2("Start"),
    actionButton("action", label = "Get random hex"),
    p(),
    textOutput("hex_long"),

    hr(),
    h2("1. Shorten"),
    "Shorten the hex code from six to three characters",
    p(),
    HTML(
        paste(
            "<details><summary>Reveal short code</summary>",
            textOutput("hex_short"),
            "</details>"
        )
    ),

    hr(),
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
    ),

    hr(),
    h2("2. Hue"),
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
    ),

    hr(),
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
    ),

    hr(),
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
    ),

    hr(),
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
            plotOutput("hex_swatch"),
            "</details>"
        )
    ),

    hr(),
    HTML(
        "Made with <a href='https://shiny.rstudio.com/'>{shiny}</a> | ",
        "<a href='https://github.com/matt-dray/dehex-challenge'>app source</a> | ",
        "<a href='https://github.com/matt-dray/dehex'>{dehex} source</a>"
    )

)
