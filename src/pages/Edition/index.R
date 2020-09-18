
uiEdition <- tags$div(
  class = "edition",
  sideBarPanel(id = "sideBarPanelEdition")
)

serverEdition <- function(input, output, session){
  sideBarPanelServer(id = "sideBarPanelEdition")
}