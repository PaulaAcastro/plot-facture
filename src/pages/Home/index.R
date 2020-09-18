
uiHome <- tags$div(
  class = "home",
  sideBarPanel(id = "sideBarPanelHome"),
  mainPanel(
    mainText = mainText(
      title = "Seja Bem-vindo(a)!",
      text = "A Plot Factory é uma plataforma voltada para a criação de 
      gráficos interativos através da ferramenta estatística shiny disponível
      no R."
    ),
    mainButton(
      mainButton = pageTransitionButton(
        id = "pageTransitionButtonHome",
        label = "Importar Dados"
      ),
        p("Clique aqui para começar")
    )
  )
)

serverHome <- function(input, output, session){
  sideBarPanelServer(id = "sideBarPanelHome")
  
  pageTransitionButtonServer(id = "pageTransitionButtonHome", 
                             page = "dataImport")
}
