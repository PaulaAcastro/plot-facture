
uiEdition <- tags$div(
  class = "edition",
  sideBarPanel(id = "sideBarPanelEdition"),
  mainPanel(
    mainText = mainText(
      title = "Edição",
      text = "Por fim, é preciso editar o gráfico. Adicionar um bom título, 
              cores equilibradas, legendas bem indicadas e uma visualização 
              dinâmica gera uma combinação harmoniosa e chamativa. São esses 
              detalhes que fazem o seu gráfico ser diferenciado."
    ),
    editionPanel(id = "editionPanelEdition"),
    forwardBackwardButtons(id= "forwardBackwardButtonsEdition")
  )
)

serverEdition <- function(input, output, session){
  sideBarPanelServer(id = "sideBarPanelEdition")
  plot <- editionPanelServer(id = "editionPanelEdition")
  
  observe({
    forwardBackwardButtonsServer(
      id= "forwardBackwardButtonsEdition",
      backward = "type",
      forward = "result",
      {
        req(session$userData$plotOptions$type)
        req(plot$plotOptions$title, plot$plotOptions$subtitle)
        if(is.null(session$userData$plotOptions$groupBy)){
          req(plot$plotOptions$hexColor)
        }else{
          req(plot$plotOptions$typeColor)
        }
        
        session$userData$plotOptions$title <- plot$plotOptions$title
        session$userData$plotOptions$subtitle <- plot$plotOptions$subtitle
        session$userData$plotOptions$hexColor <- plot$plotOptions$hexColor
        session$userData$plotOptions$typeColor <- plot$plotOptions$typeColor
        
        session$userData$plotConfig$subtitles$state <- plot$plotConfig$subtitles$state
        session$userData$plotConfig$fixedRange$state <- plot$plotConfig$fixedRange$state
      }
    )
  })
}