
importPanel <- function(id){
  ns <- NS(id)
  
  tags$div(
    class = "importPanel",
    mainButton(
      mainButton = importDataButton(id=ns("button"), label = "Selecionar")
    ),
    displayDataframe(id = ns("display"))
  )
}


importPanelServer <- function(id){
  moduleServer(
    id,
    function(input, output, session){
    dataframe <- importDataButtonServer(id = "button")
    displayDataframeServer(id = "display", dataframe = dataframe)
  
  #    observe({
  #      print(dataframe$data)  visualizo no console o 
  #    })                       dataframe lido    
    }
  )
}


