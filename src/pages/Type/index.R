
uiType <- tags$div(
  class = "type",
  sideBarPanel(id = "sideBarPanelType")
)

serverType <- function(input, output, session){
  sideBarPanelServer(id = "sideBarPanelType")
}