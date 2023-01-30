if(F){
  library(openai)
  help(package="openai")
  ls("package:openai")
  
  ## Text prompt
  create_completion(
    model = "text-davinci-002",
    prompt = "Say this is a test",
    max_tokens = 5
  )
  
  out <- create_completion(
    model = "code-davinci-002",
    prompt = "# R code creating a correlation plot of mtcars",
    max_tokens = 100, temperature = 1.5
  )
  cat(out$choices$text)
  
  ## Image creation
  create_image("frogs on pogo sticks")
  ## Text embeddings
  ?create_embedding
  
  list_models(
    openai_api_key = Sys.getenv("OPENAI_API_KEY"),
    openai_organization = NULL
  )
}

# R language
# Calculate the mean distance between an array of points