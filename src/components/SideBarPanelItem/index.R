
sideBarPanelItem <- function(id){
  ns <- NS(id)
  
  uiOutput(ns("item")) # nomeando
}

sideBarPanelItemServer <- function(id, label, ref){ # label é o nome da pag
  moduleServer(
    id,
    function(input, output, session){
      output$item <- renderUI({
        tags$div(
          class = "sideBarPanelItem",
          img(src = "./assets/icons/grayTriangle.svg"),
          tags$a(
            label,
            id = session$ns("button"),
            class = if(is_page(ref)) "action_button active" else "action_button"
            # Se estou na pag. de referência o marcador fica ativo
          )
        )
      })
      onclick("button", if(!is_page(ref)) change_page(ref))
    }
  )
}

