
editionPanel <- function(id){
  ns <- NS(id)
  
  tags$div(
    class = "editionPanel",
    h2("Estilizando componentes"),
    tags$div(
      class = "main",
      tags$div(
        class = "titles", 
        textAreaInput(
          ns("title"),
          label = h4("Escolha um título"),
          width = "100%",
          value = "",
          resize = "none"
        ),
        textAreaInput(
          ns("subtitle"),
          label = h4("Escolha um subtítulo"),
          width = "100%",
          value = "",
          resize = "none"
        )
      ),
      tags$div(
        class = "color",
        uiOutput(ns("color")) #p/ poder desabilitat e habilitar cores
      )
    ),
    tags$div(
      class = "config",
      h2("Configurações"),
      tags$div(
        tags$div(
          class = "content",
          switchCheckBox(id = ns("subtitles"), label = "Legendas")
        ),
        tags$div(
          class = "content",
          switchCheckBox(id = ns("fixedRange"), label = "Zoom fixo")
        )
      )
    )
  )
}

editionPanelServer <- function(id){
  moduleServer(
    id,
    function(input, output, session){
      output$color <- renderUI({
        req(session$userData$plotOptions$type)
        
        if(session$userData$plotOptions$type == "pie"){
          tagList( #p/ retornar
            disabled(
              colourInput(
                session$ns("hexColor"),
                label = h4("Escolha uma cor"),
                value = "#FFFFFF"
              )
            ),
            selectInput(
              session$ns("typeColor"),
              label = h4("Tom de cores"),
              choices = c("Escolha um tom de cor" = "", "Set1", "Set2", "Set3", "Pastel1", "Pastel2", "Paired", "Dark2", "Accent"),
              selected = session$userData$plotOptions$typeColor
            )
          )
        }else{
          if(is.null(session$userData$plotOptions$groupBy)){
            tagList(
              colourInput(
                session$ns("hexColor"),
                label = ("Escolha uma cor"),
                value = session$userData$plotOptions$hexColor
              ),
              disabled(
                selectInput(
                  session$ns("typeColor"),
                  label = h4("Tom de cores"),
                  choices = c("Escolha um tom de cor" = "", "Set1", "Set2", "Set3", "Pastel1", "Pastel2", "Paired", "Dark2", "Accent"),
                  selected = ""
                )
              )
            )
          }else{
            tagList( #p/ retornar
              disabled(
                colourInput(
                  session$ns("hexColor"),
                  label = h4("Escolha uma cor"),
                  value = "#FFFFFF"
                )
              ),
              selectInput(
                session$ns("typeColor"),
                label = h4("Tom de cores"),
                choices = c("Escolha um tom de cor" = "", "Set1", "Set2", "Set3", "Pastel1", "Pastel2", "Paired", "Dark2", "Accent"),
                selected = session$userData$plotOptions$typeColor
              )
            )
          }
        }
      })
      observe({
        updateTextAreaInput(
          session,
          "title",
          value = session$userData$plotOptions$title
        )
        updateTextAreaInput(
          session,
          "subtitle",
          value = session$userData$plotOptions$subtitle
        )
      })
      
      plotOptions <- reactiveValues(
        title = NULL,
        subtitle = NULL,
        hexColor = "#FFFFFF",
        typeColor = NULL
      )
      
      observeEvent(input$title, {
        plotOptions$title <- defaultSetPlotOptions(input = input$title)
      })
      
      observeEvent(input$subtitle, {
        plotOptions$subtitle <- defaultSetPlotOptions(input = input$subtitle)
      })
      
      observeEvent(input$hexColor, {
        plotOptions$hexColor <- defaultSetPlotOptions(input = input$hexColor)
      })
      
      observeEvent(input$typeColor, {
        plotOptions$typeColor <- defaultSetPlotOptions(input = input$typeColor)
      })
      
      plotConfig <- reactiveValues(
        subtitles = switchCheckBoxServer(id = "subtitles", ref = session$userData$plotConfig$subtitles),
        fixedRange = switchCheckBoxServer(id = "fixedRange", ref = session$userData$plotConfig$fixedRange)
      )
      
      return(list(plotOptions = plotOptions, plotConfig = plotConfig))
    }
  )
}


