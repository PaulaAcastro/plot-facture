
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
    
  #  session$userData$dataframe$data <- dataframe # está atribuindo p/ session o obj local que antes tínhamos,
                                                 # porém se escolhermos um dataframe não poderá ser modificado mais por
                                                 # ser caracterizado como agora como variável global
    
    displayDataframeServer(id = "display", dataframe = dataframe)
    
    return(dataframe)
  
  #    observe({
  #      print(dataframe$data)  visualizo no console o 
  #    })                       dataframe lido    
    }
  )
}


