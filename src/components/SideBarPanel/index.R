

##
sideBarPanel <- function(id){
  ns <- NS(id) # os nomes
  tags$div(
    class = "sideBarPanel",
    img(src = "./assets/logos/logoWithTagline.svg", class = "logo"),
    tags$div(
      class = "navigation",
      sideBarPanelItem(id = ns("home")),
      sideBarPanelItem(id = ns("dataImport")),
      sideBarPanelItem(id = ns("edition")),
      sideBarPanelItem(id = ns("type")),
      sideBarPanelItem(id = ns("result"))
    ),
    tags$div(
      class = "footer",
      img(src = "./assets/icons/copyright.svg"),
      p("Todos os Direitos Reservados")
    )
  )
  }

sideBarPanelServer <- function(id){
  moduleServer(
    id,
    function(input, output, session){
      sideBarPanelItemServer(
        id = "home", ref = "/", label = "Página Inicial"
      )
      sideBarPanelItemServer(
        id = "dataImport", ref = "dataImport", label = "Importando Dados"
      )
      sideBarPanelItemServer(
        id = "edition", ref = "edition", label = "Edição"
      )
      sideBarPanelItemServer(
        id = "type", ref = "type", label = "Tipo de Dado"
      )
      sideBarPanelItemServer(
        id = "result", ref = "result", label = "Resultado"
      )
    }
  )
}

#escopo de components
##