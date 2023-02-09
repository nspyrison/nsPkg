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
#'Similar to loading the tidyverse, except much more selective, and primarily 
#'for development quality of life, which likely does not belong in prduction 
#'code.
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



#'Test the truthiness of an object
#'
#'Checks the existence, NULL values, and NA values in that order.
#'Returns element-wise boolean, TRUE is defined, non-NULL, and non-NULL, 
#'else FALSE. NULL elements have 0 length.
#'@examples
#'nsTru(missing_obj)
#'nsTru(NULL)
#'nsTru(c(1, NA, NULL)) ## Note that NULL has 0 length
#'nsTru(mtcars) ## n by p boolean matrix
nsTru <- function(obj){
  ## Is defined?
  if(!(class(substitute(obj)) %in% c("call", "NULL")))
    if(exists(as.character(substitute(obj))) == FALSE)
      return(FALSE)
  ## Is non-NULL?
  if(is.null(obj))
    return(FALSE)
  ## Is non-NA?
  !is.na(obj)
}



## More niche functions ----

#'Count the lines of code in a repository
#'
#'Identifies all r/R files in a directory, provides a summary message and 
#'returns a named vector with the number of lines in each file.
#' 
#'@examples
#'nsCountRepoRLines()
#'nsCountRepoRLines("./R/utilities.R")
nsCountRepoRLines <- function(
    repo_path = "."
){
  browser()
  files <- list.files(path = repo_path, recursive = TRUE, full.names = TRUE)
  r_files <- stringr::str_subset(files, ".[Rr]$")
  file_lines <- sapply(r_files, function(x) x |>
                         readLines() |> length() |> suppressWarnings())
  message(paste0("In summary, ", length(file_lines),
                 " r/R files contained ", sum(file_lines),
                 " lines within ", normalizePath(repo_path), "."))
  file_lines
}

#'Perform a CRAN check with {rhub}
#'
#'On the existing project, perform a CRAN package check using 
#'rhub::check_for_cran().
#'@examples
#'if(F){ ## Don't accidentally run package checks.
#'  nsCheckPkg()
#'  nsCheckPkg(platforms_to_check = "windows-x86_64-devel",
#'             validated_email = "my_email\@gmail.com")
#'}
nsCheckPkg <- function(
    platforms_to_check = rhub:::default_cran_check_platforms("."),
    validated_email = as.character(rhub::list_validated_emails()[1]),
    ...
){
  message(paste0("nsCheckRhub() started ", Sys.time(), 
                 ". Hit escape to regain console control, but lose detailed messaging from teh check. Results will be emailed either way."))
  rhub::check_for_cran(platform = platforms_to_check,
                       email = validated_email, ...)
}

#'Check previous package check package results
#'
#'Check the result of previous rhub package checks.
#'@examples
#'nsPrevCheckPkg()
#'nsPrevCheckPkg("my_pkg_nm", "my_email\@gmail.com", last_n = 3)
nsPrevCheckPkg <- function(
    pkg_nm = normalizePath(".") |> basename(),
    validated_email = as.character(rhub::list_validated_emails()[1]),
    last_n = 5L
){
  rhub::list_package_checks(pkg_nm, email = validated_email, howmany = last_n)
}

#'Pastes a file to a specified path
#'
#'Copy and Paste (CnP) a file to a specified path. 
#'Optionally open/edit the moved file with `open`.
#'Originally used to move a repo bib files to the download folder.
#'@examples
#'nsHTMLToPDF() ## In project directory.
#'nsHTMLToPDF("C:/Users/spyri/Downloads") ## In downloads folder.
nsCnP <- function(
    from = dir()[endsWith(dir(), ".bib")][1],
    to = paste0(normalizePath("../../../Downloads/"),
                dir()[endsWith(dir(), ".bib")]),
    remove = FALSE,
    open = FALSE
){
  ## Check file existence
  if(is.na(from) !file.exists(from) | length(from) == 0)
    stop(paste0("nsCnP_bib: File '", from, "' doesn't exist."))
  ## Copy file
  file.copy(from = from, to = to)
  ## Remove from source?
  if(file.exists(to) & remove)
    file.remove(to)
  ## Open/edit file?
  if(open)
    file.edit(to)
  message(paste0("BibTex file copied to '", to, "'."))
  to
}



#'Convert an html file to pdf.
#'
#'Tries to convert the first html file in the specified directory to a pdf 
#'webshot::webshot() of it. Does not delete the html file.
#'Originally used to convert {xaringan} html 
#'slides to pdf slides.
#'@examples
#'nsHTMLToPDF() ## In project directory.
#'nsHTMLToPDF("C:/Users/spyri/Downloads") ## In downloads folder.
nsHTMLToPDF <- function(
    path = normalizePath(".")
){
  ## Don't try to generalize extension paths;
  ## webshot is not the way to do all file conversions
  files <- dir(path)
  bool_from_ext <- files |>
    endsWith(suffix = ".html")
  first_file <- files[bool_from_ext][1]
  out_file <- paste0(substr(first_file, 1, nchar(first_file) - 4), ".pdf")
  webshot::webshot(dir, out_file)
  message(paste0(first_file, " file converted to'", out_file, "'."))
}




## _nsUndebugNamespaces dev -----

#' #'Undebug functions from loaded packages (namespaces)
#' #'
#' #'Generalized version of undebug(function_name). Tries to undebug all
#' #'functions from all attached namespaces, ie. loaded packages. Will not
#' #'undebug sourced or defined functions.
#' #'@examples
#' #'library(dplyr)
#' #'mtcars |> count(cyl)
#' #'\donttest{
#' #'debug(count)
#' #'mtcars |> count(cyl)  ## Stays in debug state
#' #'nsUndebugNamespaces() ## A generalized undebug(count)
#' #'mtcars |> count(cyl)  ## no debug
#' #'}
#' nsUndebugNamespaces <- function(where = search()) {
#'   ## Current error:
#'   ## Error in get(x, envir = ns, inherits = FALSE) : invalid first argument
#'   ## Doesn't like search() within function?
#'   isdebugged_safe <- function(x, ns = NULL) {
#'     g <- if(is.null(ns))
#'       get(x)
#'     else getFromNamespace(x, ns)
#'     is.function(g) && isdebugged(g)
#'   }
#'   which_debugged <- function(objnames, ns = NULL) {
#'     if (!length(objnames)) 
#'       return(character(0L))
#'     objnames[sapply(objnames, isdebugged_safe, ns = ns)]
#'   }
#'   all_debugged <- function(where = search(), show_empty = FALSE) {
#'     ap <- setNames(lapply(where, function(x) {
#'       which_debugged(ls(x, all.names = TRUE))
#'     }), gsub("package:", "", where))
#'     ns <- unlist(sapply(gsub("package:", "", where), 
#'                         function(x) {
#'                           if (inherits({
#'                             n <- try(getNamespace(x), silent = TRUE)
#'                           }, "try-error")) 
#'                             NULL
#'                           else x
#'                         }))
#'     ap_ns <- setNames(lapply(ns, function(x) {
#'       objects <- ls(getNamespace(x), all.names = TRUE)
#'       which_debugged(objects, ns = x)
#'     }), ns)
#'     if (!show_empty) {
#'       ap <- ap[sapply(ap, length) > 0L]
#'       ap_ns <- ap_ns[sapply(ap_ns, length) > 0L]
#'     }
#'     for (i in names(ap)) ap_ns[[i]] <- setdiff(ap_ns[[i]], 
#'                                                ap[[i]])
#'     list(env = ap, ns = ap_ns)
#'   }
#'   aa <- all_debugged(where)
#'   lapply(aa$env, undebug)
#'   invisible(mapply(function(ns, fun) {
#'     undebug(getFromNamespace(fun, ns))
#'   }, names(aa$ns), aa$ns))
#' }



## _nsErrOpts dev ----

#' #'Change what happens upon errors
#' #'
#' #'For this session only, change what function should be run upon any error.
#' #'This is a debugging tool.
#' #'@examples
#' #'my_func <- function(){a<-1; stop("intentional error"); return("end")}
#' #'my_func()
#' #'
#' #'nsErrOpts(browser)
#' #'my_func()
#' #'nsHTMLToPDF("C:/Users/spyri/Downloads") ## In downloads folder.
#' nsErrOpts <- function(
#'     func = c(browser, recover, NULL)
#' ){
#'   ## Doesn't want to work in a function (env specific?)
#'   ## Could provide as an expression or call, but eval(X) is less known.
#'   ## Is there a cleaver class method that could be used?
#'   options(error = recover)
#' }


## _nsOnErr_once dev ----

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

