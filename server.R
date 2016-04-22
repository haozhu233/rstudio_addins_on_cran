library(shiny)

shinyServer(function(input, output, session) {
  
  source("manipulation/global.R")
  suppressWarnings(source("manipulation/fetch.R"))
  
  cran_addins_tbl <- addins_list %>%
    filter(org == "cran") %>%
    arrange(package, Name) %>%
    mutate(
      cran_version = paste0(
        '<img src="http://www.r-pkg.org/badges/version/', package, 
        '" alt="CRAN Release">'
        ),
      github_url = paste0(
        '<a href="https://github.com/', github_url, '">', github_url, '</a>'
      ),
      package = paste0('<a href="', dl_link, '">', package, "</a>")
    ) %>%
    select(Name, Description, package, cran_version, github_url)
names(cran_addins_tbl) <- c(
  "Addin Name", "Description", "Package", "CRAN Version", "Development Version"
)
  
  output$cran_addins_table <- function(){
      kable(
        cran_addins_tbl, 
        format = "html", output = F, align = c("l", "l", "l", "c", "l"), escape=F,
        table.attr="class='table table-striped table-hover'"
      )
  }
  
  rstudio_addins_tbl <- addins_list %>%
    filter(org == "rstudio") %>%
    arrange(package, Name) %>%
    mutate(
      cran_version = paste0(
        '<img src="http://www.r-pkg.org/badges/version/', package,
        '" alt="CRAN Release">'
      ),
      cran_dl = paste0(
        '<img src="http://cranlogs.r-pkg.org/badges/', package,
        '" alt="CRAN Release">'
      ),
      package = paste0('<a href="', dl_link, '">', package, "</a>")
    ) %>%
    select(Name, Description, package)
  names(rstudio_addins_tbl) <- c("Addin Name", "Description", "Github Page")
  
  output$rstudio_addins_table <- function(){
    kable(
      rstudio_addins_tbl,
      format = "html", output = F, align = c("l", "l", "l"), escape=F,
      table.attr="class='table table-striped table-hover'"
    )
  }
  
})