library(shiny)
source("manipulation/modules.R")

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
    ribbon_corner("https://github.com/haozhu233/rstudio_addins_on_cran", 
                  fill_color = "#777777"),
    
    tabPanel(
      "Addins on CRAN", class = "active", icon = icon("rocket"),
      h2("CRAN Packages with RStudio Addins", class="text-center"),
      tableOutput("cran_addins_table"),
      tags$div(
        class = "well well-lg",
        h3("Notes:"),
        HTML(
          '1. This app takes benefit from the unofficial <a href="', 
          'https://github.com/cran">CRAN mirror on github</a> and completes ',
          'searching through Github API. <br><br>',
          
          '2. Currently, many RStudio addins only live in the wild on Github. ', 
          '<a href="https://twitter.com/daattali">Dean Attali</a> solved this ', 
          'problem by creating a project listing out all those packages. If you ', 
          'are actively looking for an addin, I think that project is more ', 
          'realistically useful. You can click <code>Addins on Github</code> ', 
          'to jump to that project. <br><br>',
          
          '3. There seems to be a bug on Github API that sometimes the API ',
          'search may miss one or two items. When this bug happened, it ',
          'took place at the initial data fetch step. There seems to be ',
          'nothing I can do... <br><br>'
        )
      )
    ),
    
    tabPanel(
      "Addins by RStudio", icon = icon("registered"),
      h2("Packages developed by RStudio", class="text-center"),
      tableOutput("rstudio_addins_table"),
      tags$div(
        class = "well well-lg",
        h3("Notes:"),
        HTML(
          '1. This app takes benefit from the unofficial <a href="', 
          'https://github.com/cran">CRAN mirror on github</a> and completes ',
          'searching through Github API. <br><br>',
          
          '2. Currently, many RStudio addins only live in the wild on Github. ', 
          '<a href="https://twitter.com/daattali">Dean Attali</a> solved this ', 
          'problem by creating a project listing out all those packages. If you ', 
          'are actively looking for an addin, I think that project is more ', 
          'realistically useful. You can click <code>Addins on Github</code> ', 
          'to jump to that project. <br><br>',
          
          '3. There seems to be a bug on Github API that sometimes the API ',
          'search may miss one or two items. When this bug happened, it ',
          'took place at the initial data fetching step. There seems to be ',
          'nothing I can do... <br><br>'
        )
      )
    ), 
    
    tabPanel(
      a('Addins on Github', href='https://github.com/daattali/rstudio-addins', 
        target='_blank', style="margin-top: -40px; margin-left: 20px"), 
      icon = icon("github")
    )
  )
)