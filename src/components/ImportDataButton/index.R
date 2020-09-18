
importDataButton <- function(id, label){
  ns <- NS(id)
  
  tags$div(
    class = "importDataButton",
    tags$a(
      fileInputOnlyButton(
        inputId = ns("button"),
        label = NULL,
        buttonLabel = label,
        accept = ".RDS",
        class = "green-button"
      )
    )
  )
}

importDataButtonServer <- function(id, label){
  moduleServer(
    id,
    function(input, output, session){
      dataframe <- reactiveValues(data = NULL)
      
      observeEvent(input$button, {
        dataframe$data <- readRDS(input$button$datapath)
      })
      return(dataframe)
    }
  )
}