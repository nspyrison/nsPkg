


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
