addins_raw <- fromJSON(
  "https://api.github.com/search/code?q=org:cran+org:rstudio+filename:addins.dcf"
  )[[3]] %>%
  flatten() %>%
  # In case people put extra addins.dcf files elsewhere
  filter(path == "inst/rstudio/addins.dcf") %>%
  mutate(
    addin.dl.url = paste0(
      "https://raw.githubusercontent.com/", repository.owner.login, "/", 
      repository.name, "/master/inst/rstudio/addins.dcf"
    ),
    github.url =  ifelse(
      repository.owner.login == "cran",
      str_match(
        repository.description,
        "Homepage:[:space:]https://github.com/(.*)[:space:][:space:]")[,2],
      repository.full_name
    )
  )



addins_list <- lapply(addins_raw$addin.dl.url, curl) %>% 
  lapply(read.dcf) %>%
  lapply(as.data.frame) 
names(addins_list) <- paste(
  sub("/", " - ", addins_raw$repository.full_name), addins_raw$github.url,
  sep = " - "
)

addins_list <- addins_list %>%
  bind_rows(.id = "repo_name") %>%
  select(repo_name, Name, Description) %>%
  separate(repo_name, c("org", "package", "github_url"), sep = " - ") %>%
  mutate(
    dl_link = ifelse(
      org == "cran",
      paste0("https://cran.r-project.org/web/packages/", package),
      paste0("https://github.com/", org, "/", package)
    )
  )

closeAllConnections()
