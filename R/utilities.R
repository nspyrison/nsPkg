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


#'Lorem Ipsum text
#'
#'Returns cat() of the desired number of words of Lorem Ipsum. Lorem Ipsum is 
#'non-sense English used as placeholder text to view the structure of documents.
#'@examples
#'nsLipsum()
#'nsLipsum(nwords = 10)
nsLipsum <- function(
    nwords = 50 ## 1 paragraph
) {
  # A string of 20 paragraphs of lorem ipsum
  lipsum <- "Lorem ipsum dolor sit amet. Ad velit natus rem similique quibusdam qui dolorem atque qui assumenda eaque. Qui dolorum inventore a eveniet dolorem aut quia quia cum voluptas quisquam et dolor consequuntur et voluptate cumque. Ab deleniti sunt est doloribus dolorem et dolore fugit est quae dolores.

Sit error iste qui perferendis quisquam et blanditiis mollitia! Sit voluptas repudiandae qui dolorem voluptatem qui nemo inventore.

Ut cumque nulla eum nulla cumque et animi quia. Ea sunt distinctio aut iste facilis hic reprehenderit voluptatem vel architecto debitis At fugit reiciendis eum praesentium suscipit.

Aut perferendis voluptate eum sint officia est officiis Quis sit voluptatum tenetur non consequatur distinctio est omnis adipisci ab molestiae dolorem. Et accusantium voluptatibus non nobis culpa qui corrupti rerum eos consequatur ipsa qui nesciunt culpa. Ut possimus minima aut fugiat explicabo est consectetur sint eos voluptas quae aut autem porro sed deserunt sint et omnis aliquam.

Et eaque alias et sunt libero qui quia maxime. Eum quod odit et possimus accusamus et debitis exercitationem ab optio debitis 33 aliquid cupiditate. Eos deleniti quibusdam et quibusdam illum est dignissimos blanditiis aut laudantium quasi.

Ut incidunt autem et itaque quidem et vitae libero et incidunt iusto. Ut eius velit ut dolorem consequatur ut nulla totam ut ullam accusamus ex tempora tempore. Eos quaerat atque et nihil repellendus in aliquid voluptatum.

Ut provident quia qui vero alias et nisi ipsam. Et magni quisquam non voluptas internos et dolor pariatur.

Hic placeat consequatur hic perspiciatis consequatur qui ullam galisum et quia molestiae ut enim rerum et provident repellendus. Et officia sapiente est praesentium accusamus et culpa eaque non aperiam voluptas et exercitationem voluptatem? Eum porro inventore sit natus animi ad aspernatur libero. At dolores quibusdam aut pariatur dolorem et perferendis deleniti et nemo necessitatibus qui internos repudiandae est debitis doloremque?

Est modi impedit in consequatur sunt sit minima eligendi ea reiciendis fugiat quo modi nihil non quia iste? Aut praesentium exercitationem quo itaque ipsam qui asperiores vero aut omnis vero. Et voluptatibus dolorum aut molestiae pariatur qui consequuntur assumenda in nostrum repellendus et rerum corporis. Ut tempore veritatis ut vitae dolor non totam debitis est sint maiores et laboriosam facilis ea sint tempore.

Qui provident delectus et voluptatem natus qui fuga aliquam est dignissimos voluptatibus eos eligendi possimus? Aut corrupti quae ex repellendus tempora non odit blanditiis sit possimus eligendi qui dignissimos mollitia qui blanditiis fuga.

Quo voluptas voluptatem non dolorem assumenda a minus debitis ea delectus accusamus aut voluptas quibusdam At dolorem voluptatem. Et harum nihil ea libero vero cum quam consectetur et natus tempora qui sint voluptatem. Vel recusandae dolores rem deserunt optio ut soluta enim sed nemo similique.

Ut voluptas ipsam et tenetur praesentium qui odit dolorem et ullam doloribus sed magni repellat. Qui doloremque nihil ut omnis iusto sit neque labore At nostrum praesentium sit distinctio fugiat sed mollitia fuga At repellat minus. Eum voluptatum voluptatibus sed tempora aspernatur qui voluptas dolores qui laboriosam omnis ut exercitationem mollitia quo sunt fuga est sint voluptas.

Qui sapiente dolore ut sunt natus sed quidem consequuntur ex dolores asperiores ut laudantium distinctio et temporibus excepturi et optio magnam. Et enim beatae aut nesciunt assumenda aut tempora libero ex tenetur galisum est soluta voluptatibus qui dolor numquam ut dolores voluptas. Et praesentium omnis eos modi veritatis ab alias reprehenderit ab obcaecati atque! Est nihil nemo ut accusantium quia At impedit voluptatibus eos quod consequatur sed temporibus consequatur!

Eum ipsum dolores ut necessitatibus adipisci cum molestiae nulla ut officiis temporibus. Sit perspiciatis doloremque sed perferendis amet eos minima voluptate in quia ducimus ut cupiditate consequatur. Qui repudiandae nulla et harum alias aut enim eius ut eligendi vero et quas excepturi eos impedit voluptatibus et veritatis dolore!

Sit Quis ullam aut minus quia in tempora aliquam in dignissimos deserunt ut dignissimos alias ut suscipit error! Eos exercitationem molestiae ut error harum non Quis eveniet. At rerum libero et illum quia ex rerum molestias. Cum officia asperiores ut numquam sunt non similique corrupti et vero esse in nobis veritatis id corporis sapiente!

Est Quis magnam est totam tempora aut nisi necessitatibus aut perferendis dolore vel sunt enim ad necessitatibus iure. In maiores omnis ut debitis rerum et enim eius hic incidunt cupiditate et delectus autem et quaerat quidem et rerum totam. Sed commodi molestiae eum consequuntur accusantium eos magni molestiae eos quam obcaecati! Qui nisi iure est voluptatem accusamus non voluptatibus neque non perferendis quas ut consequatur voluptatum ut deleniti enim id molestias eveniet?

Et veniam nostrum qui explicabo eaque quo laborum quia id voluptas velit. Est rerum accusantium rem beatae porro qui maiores galisum ea quam magni eos eligendi commodi est pariatur quasi sit dolore optio.

Et quasi molestiae eos minima omnis aut temporibus maxime qui quam vitae ut similique ipsam! Quo doloremque aliquid ut dolorem magni non libero tempora ea eveniet asperiores. Quo consequatur deserunt ut repellat deleniti cum tenetur repellat id veniam amet ut corporis rerum eum voluptas natus! Nam voluptas neque hic facilis inventore qui culpa placeat est velit illo et quos animi?

Qui voluptas ipsam ab optio autem vel totam galisum est velit iusto ab tempora perferendis. Eos delectus voluptas in magnam dolores sed vero quasi est enim error.

Nam corrupti veritatis est maiores deserunt et asperiores dolores est inventore reprehenderit aut nesciunt alias sit iusto perferendis qui quam provident. Et ipsam omnis id perspiciatis distinctio et consectetur consequatur ut quia consequuntur qui laboriosam quod qui cumque rerum. Et culpa maiores et quia dolores sed voluptatibus exercitationem quo quos quae At quisquam velit? Qui porro sapiente ut doloribus quam aut numquam officiis."
  # A vector of spaces in the string
  spaces <- unlist(gregexpr(' ', lipsum))
  
  # Return the cat() of a single string of words
  cat(substr(lipsum, 1, spaces[min(nwords - 1, length(spaces))]))
}
LoremIpsum4(999)


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

