
# dehex-challenge

<!-- badges: start -->
[![rostrum.blog
post](https://img.shields.io/badge/rostrum.blog-post-008900?style=flat&labelColor=black&logo=data:image/gif;base64,R0lGODlhEAAQAPEAAAAAABWCBAAAAAAAACH5BAlkAAIAIf8LTkVUU0NBUEUyLjADAQAAACwAAAAAEAAQAAAC55QkISIiEoQQQgghRBBCiCAIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAAh+QQJZAACACwAAAAAEAAQAAAC55QkIiESIoQQQgghhAhCBCEIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAA7)](https://www.rostrum.blog/2021/08/10/dehex/)
![](https://img.shields.io/badge/Shiny-not_hosted-blue?style=flat&labelColor=white&logo=RStudio&logoColor=blue)
<!-- badges: end -->

This is a work-in-progress Shiny app to test how good you are at deciphering a colour from its hex code.

The app is built around the {dehex} package ([source](https://github.com/matt-dray/dehex), [blog]((https://www.rostrum.blog/2021/08/10/dehex/)), which follows [David DeSandro's method](https://metafizzy.co/blog/read-color-hex-codes/) for learning how to assess hex codes by eye. 

The app is in in development and not yet hosted on the web. If you want to see it, you could run this from an R session (but be aware that it's in early development and may be broken):

``` r
# Required packages
install.packages("shiny", "remotes")
remotes::install_github("matt-dray/dehex")

# Download and run app
shiny::runGitHub("dehex-challenge", "matt-dray", "main")
```
