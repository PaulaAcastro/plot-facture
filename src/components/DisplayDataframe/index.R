
displayDataframe <- function(id){
  ns <- NS(id)
  
  tags$div(
    class = "displayDataframe",
    dataTableOutput(ns("dataframe"), height = "400px", width="500px")
  )
}

displayDataframeServer <- function(id, dataframe){
  moduleServer(
    id,
    function(input, output, session){
      output$dataframe <- renderDataTable({
        datatable(dataframe$data)
      })
    }
  )
}





