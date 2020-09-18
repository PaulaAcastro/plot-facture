
typePanel <- function(id){
  ns <- NS(id) # garante a unicidade dos nomes
  
  tags$div(
    class = "typePanel",
    h2("Selecionando Componentes"),
    tags$div(
      class = "typeChoices",
      selectInput(
        ns("type"),
        h4("Tipo de Gráfico"),
        choices = ""
      ),
      selectInput(
        ns("x"),
        h4("Variável eixo X"),
        choices = ""
      ),
      selectInput(
        ns("y"),
        h4("Variável eixo Y"),
        choices = ""
      ),
      selectInput(
        ns("groupBy"),
        h4("Agrupar por"),
        choices = ""
      )
    )
  )
}

typePanelServer <- function(id){
  moduleServer(
    id,
    function(input, output, session){
      choices <- c(
        "Escolha um tipo" = "",
        "Gráfico de linha (com pontos)" = "markers+lines",
        "Gráfico de dispersão" = "markers",
        "Gráfico de pizza" = "pie",
        "Gráfico de boxplot" = "box"
      )
      
      observe({
        req(session$userData$dataframe$data)
        
        updateSelectInput(
          session,
          "type",
          choices = choices,
          selected = session$userData$plotOptions$type
        )
        
        updateSelectInput(
          session,
          "x",
          choices = c("Escolha uma variável" = "", names(session$userData$dataframe$data)),
          selected = session$userData$plotOptions$x
        )
        
        updateSelectInput(
          session,
          "y",
          choices = c("Escolha uma variável" = "", names(session$userData$dataframe$data)),
          selected = session$userData$plotOptions$y
        )
        
        updateSelectInput(
          session,
          "groupBy",
          choices = c("Escolha uma variável" = "", names(session$userData$dataframe$data)),
          selected = session$userData$plotOptions$groupBy
        )
        
      })
      
      observeEvent(input$type, { # desabilitar eixos quando não for necessário
        req(input$type)
          
          if(input$type == "pie" | input$type == "box"){
            updateSelectInput(
              session,
              "y",
              choices = c("Escolha uma variável" = "", names(session$userData$dataframe$data)), # continua com as opções p/ que quando eu volte p/ um gráfico                                                                                  #que aceita duas variáveis as opções retornarem na caixa de seleção
              selected = ""
            )
            disable("y") # função do shinyjs
          }else{
            enable("y")
          }
        })
      
      plotOptions <- reactiveValues(
        type = NULL,
        x = NULL,
        y = NULL,
        groupBy = NULL
      )
      
      observeEvent(input$type, { # reage a cada input
        plotOptions$type <- defaultSetPlotOptions(input = input$type)
      })
      
      observeEvent(input$x, { # reage a cada input
        plotOptions$x <- defaultSetPlotOptions(input = input$x)
      })
      
      observeEvent(input$y, { # reage a cada input
        plotOptions$y <- defaultSetPlotOptions(input = input$y)
      })
      
      observeEvent(input$groupBy, { # reage a cada input
        plotOptions$groupBy <- defaultSetPlotOptions(input = input$groupBy)
      })
      
      return(plotOptions)
    }
  )
}