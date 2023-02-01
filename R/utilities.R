#'Set session options
#'
#'Opens the help pane page for the packages and lists the functions to the 
#'console.
#'@examples
#'nsopts
#'if(F) ## Don't accidentally change options
#'  nsOpts()
nsOpts <- function(...){
  options(show.error.locations = TRUE, prompt = "R> ", scipen = 100L, 
          digits = 4L, digits.d = 2L, max.print = 100L, pillar.width = 80, 
          show.signif.stars = TRUE, citation.bibtex.max = 999L,
          ...
          #devtools.desc.author = "person('Nicholas', 'Spyrison',\n        email = 'spyrison@gmail.com',\n        role = c('aut', 'cre'))", 
          #devtools.name = "Nicholas Spyrison", devtools.desc.license = "MIT", 
          #bookdown.clean_book = TRUE, blogdown.hugo.version = "0.79.1"
  )
  "Session-specific options set."
}

#'Open local R profile
#'
#'Opens the .Rprofile local to a repository. This run upon R start up.
#'Use with caution, options() calls or 99-functions like content are all
#'that should be added.
#'@examples
#'nsRprofile()
nsRprofile <<- function() 
  file.edit(file.path("~", ".Rprofile"))

#'Open local R environ
#'
#'Opens the .Renviron local to a repository. This run upon R start up.
#'R environment files it meant to facilitate environment variables and store API
#'credentials.
#'@examples
#'nsRenviron()
nsRenviron <- function() 
  file.edit(file.path("~", ".Renviron"))

#'Sightly more convient head()
#'
#'Minor convenience function that consolidates an interface for calling head()
#'on tibbles and data.frames.
#'@examples
#'nsRenviron()
nsHead <- function(obj, n, width = Inf) {
  if (class(obj)[1] == "tbl_df") {
    print(obj, width = width, n = n)
  }
  else {
    prev_max_print <- getOption("max.print")
    options(max.print = n)
    print(obj)
    options(max.print = prev_max_print)
  }
  obj[1:n, ]
}


## Small potatos ----

#'Package help()
#'
#'Opens the help pane page for the packages and lists the functions to the 
#'console.
#'@examples
#'nsHelp(pkg="dplyr")
# nsHelp <- function(pkg, ...){
#   ##TODO ls won't work without namespace, but wont correctly substitute pkg;
#   #Error in if (!loaded) { : the condition has length > 1
#   require(package = substitute(pkg))
#   help(package = pkg, ...)
#   ls(paste0("package:", pkg))
# }

#'Package help()
#'
#'Prints the str() and skimr::skim() of the object
#'@examples
#'nsView(mtcars)
nsView <- function(obj){
  str(obj) |> print()
  skimr::skim(obj) |> print()
}


#'Load a small set of packages
#'
#'Similar to library(tidyverse), except much more selective for
#'development quality of life, which may not belong in the code itself.
#'@examples
#'nsLibs()
nsLibs <- function(other_lib_nms=NULL) {
  lib_v <- c("tictoc", "beepr", "microbenchmark", "fcuk",
             "ggplot2", "dplyr", "tidyr", "tibble",
             other_lib_nms
             #"spinifex", "tourr", "cheem"
  )
  lapply(lib_v, library, character.only = TRUE) |>
    suppressPackageStartupMessages()
  paste0(length(lib_v), " packages loaded; ",
         paste(lib_v, collapse = ", "), ".") |>
    message()
}


#' #'Change the options(error) for one error
#' #'
#' #'Similar to undebugonce() only debugs a function for one call, 
#' #'this will change what happens upon the NEXT error only.
#' #'@examples
#' #'nsOnErr_once(browser)
#' #'dummy <- function(){ ## Dummy anonymous function
#' #'  var <- "Only defined in function"
#' #'  stop()
#' #'  1+1
#' #'}
#' #'dummy() ##
#' nsOnErr_once <- function(
#'     func_on_err = c(browser, recover, NULL)
#' ){
#'   ## Not working atm!
#'   .errOpt <- function(func_on_err2 = func_on_err[[1]],
#'                       prev_err = getOption("error")
#'   ) {
#'     func_on_err2
#'     options(error = prev_err)
#'   }
#'   options(error = .errOpt)
#' }
