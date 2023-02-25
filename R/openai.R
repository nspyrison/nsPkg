library(openai)

if(F){
  ## about
  help(package="openai")
  ls("package:openai")
  browseURL("https://platform.openai.com/playground")
  
  ## Custom simplified printing
  nsPull <- function(openai_return){
    stopifnot(class(openai_return) == "list")
    txt <- out$choices$text
    
    ## Text/code
    if("choices" %in% names(openai_return)){
      
      ## Assume code & try to eval?
      if(grepl('\\(', txt) & grepl('\\)', txt)){
        try(eval(parse(text = out$choices$text)), silent = TRUE)
        message("Tried to silently evaluate the text as code.")
      }
      
      return(cat(openai_return$choices$text))
    }
    
    ## Images
    if("data" %in% names(openai_return)){
      browseURL(ret$data$url)
      return(cat(ret$data$url))
    }
    
    warning("Didn't meet the assumptions for text, code, or image output. Please review the function and object structure.")
    FALSE
  }
  
  ## Text prompt ----
  ret <- create_completion(
    model = "text-davinci-002",
    prompt = "Say this is a test",
    max_tokens = 100
  )
  ret
  str(ret)
  summary(ret)
  
  ## More functionally
  cat(ret$choices$text)
  ret |> nsPull()
  
  
  ret <- create_completion(
    model = "text-davinci-003",
    prompt = "Tell me a story about Geishas.",
    max_tokens = 250, ## int in [1, 4000]. input and output can each be 2048.
    temperature = .2, ## in [0, 1], don't use with top_p
    #top_p = .9, ## percentile [0, 1], don't use with temperature
    best_of = 2, ## int in [0, 20]
    frequency_penalty = 1 ## in [-2, 2]
  )
  ret |> nsPull() ## Cat() text output
  
  ## Image creation -----
  ret <- create_image(
    prompt = "Cartoon image of dogs playing poker",
    n = 1,
    size = "512x512", ## c("512x512", "1024x1024", "256x256"),
    response_format = "url" ## "b64_json" may cause RStudio to crash
  )
  summary(ret)
  browseURL(ret$data$url)
  ret |> nsPull() ## Open url to browser and cat() URL
  
  ## Text embeddings -----
  ?create_embedding
  
  ## Model options -----
  ## Vector of models
  list_models(
    openai_api_key = Sys.getenv("OPENAI_API_KEY"),
    openai_organization = NULL
  )$data$id
  ## View a df of models
  View(list_models()$data)
}

## Code ----
out <- create_completion(
  model = "text-davinci-003",
  prompt = "R function that returns the quartiles of the numeric columns of a data frame",
  max_tokens = 1000, ## int in [1, 4000]. input and output can each be 2048.
  temperature = .1, ## in [0, 1], don't use with top_p
  #top_p = .9, ## percentile [0, 1], don't use with temperature
  best_of = 2, ## int in [0, 20]
  frequency_penalty = 1 ## in [-2, 2]
)
cat(out$choices$text)
try(eval(parse(text = out$choices$text)), silent = TRUE) ## try to eval
ret |> nsPull() ## Try to eval and cat() code output


