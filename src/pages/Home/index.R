
uiHome <- tags$div(
  class = "home",
  sideBarPanel(id = "sideBarPanelHome")
)

serverHome <- function(input, output, session){
  sideBarPanelServer(id = "sideBarPanelHome")
}
