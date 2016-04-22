library(shiny)
shinyUI(
  navbarPage(
    "Discover RStudio Addins",
    tags$head(
      tags$link(rel = "stylesheet", href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.6/simplex/bootstrap.min.css"),
      tags$link(rel = "stylesheet", href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css")
    ),
    position = "static-top",
    fluid = F,
    windowTitle = "Football Player Health Study - Distracted Walking",
    
    tabPanel(
      "Addins on CRAN", class = "active",
      h2("CRAN Packages with RStudio Addins", class="text-center"),
      tableOutput("cran_addins_table")
    ),
    
    tabPanel(
      "Addins by RStudio", 
      h2("Packages developed by RStudio", class="text-center"),
      tableOutput("rstudio_addins_table")
    )
  )
)