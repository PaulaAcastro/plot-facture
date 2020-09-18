
uiType <- tags$div(
  class = "type",
  sideBarPanel(id = "sideBarPanelType"),
  mainPanel(
    mainText = mainText(
      title = "Tipo de Gráfico",
      text = "Definida a base de dados, o próximo passo é escolher quais serão 
              as variáveis a serem analisadas e também qual o tipo do gráfico a ser 
              exibido. Lembre-se que um bom gráfico necessita de boas variáveis e 
              também da formatação correta."
    ),
    typePanel(id = "typePanelType"),
    forwardBackwardButtons(id= "forwardBackwardButtonsType")
  )
)

serverType <- function(input, output, session){
  sideBarPanelServer(id = "sideBarPanelType")
  plotOptions <- typePanelServer(id = "typePanelType")
  
  observe({
    forwardBackwardButtonsServer(
      id= "forwardBackwardButtonsType",
      backward = "dataImport",
      forward = "edition",
      {
        req(plotOptions$type)

       if(plotOptions$type == "markers+lines" | plotOptions$type == "lines" | plotOptions$type == "markers"){
          req(plotOptions$x, plotOptions$y)
        }else if(plotOptions$type == "pie"){
          req(plotOptions$x, plotOptions$groupBy)
        }else{
         req(plotOptions$x)
        }        
        
        session$userData$plotOptions$type <- plotOptions$type 
        session$userData$plotOptions$x <- plotOptions$x
        session$userData$plotOptions$y <- plotOptions$y
        session$userData$plotOptions$groupBy <- plotOptions$groupBy
      }
    )
  })
}