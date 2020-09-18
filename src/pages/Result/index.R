

uiResult <- tags$div(
  class = "result",
  sideBarPanel(id = "sideBarPanelResult")
)

serverResult <- function(input, output, session){
  sideBarPanelServer(id = "sideBarPanelResult")
}