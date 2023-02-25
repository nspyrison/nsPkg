### ./inst/shiny_apps/faceoff/app.r ###
#' @author Nicholas Spyrison
#' Feb 2023
source("ui.r", local = TRUE, encoding = "utf-8")

# server.R



server <- function(input, output, session){
  ## Reactives ----
  
  ### load_ls ----
  load_ls <- reactive({
    dat <- req(input$dat_char)
    if(dat %in% expected_data_char == FALSE)
      stop("data string not matched.")
    
    ## Do some work
    
    ## Return loaded cheem_ls
    ret
  })

  
  ## Observe/event -----
  
  ### 1st Obs ----
  
  
  ## Outputs -----
  
  ### Header and text ----
  output$desc_rows <- renderText({
    ## Create some header and text
    
    ## Return
    HTML(paste(he, l1))
  })
  outputOptions(output, "desc_rows",
                suspendWhenHidden = FALSE, priority = 90L) ## Eager evaluation
  
  ### DT table of df ----
  output$selected_df <- DT::renderDT({ ## Original data of selection
    idx_rownum <- sel_rownums() ## NULL is no selection
    if(is.null(idx_rownum)) return(NULL)
    .df <- req(load_ls())$decode_df
    .df_r <- data.frame(lapply(
      .df, function(c) if(is.numeric(c)) round(c, 2L) else c))
    DT::datatable(.df_r[idx_rownum,, drop = FALSE], rownames = FALSE)
  })
  outputOptions(output, "selected_df",
                suspendWhenHidden = FALSE, priority = 10L) ## Eager evaluation
} ## Close function, assigning server object.



## Run app ----
shinyApp(ui = ui, server = server)
