## DIA 2



source("./src/config/index.R") # meio que copiando o index.R para cá


ui <- tags$html(
  tags$head(
    useShinyjs()
  ),
  tags$body(
    router_ui() # vai pegar todos os ui de cada rota por vez. #shiny.router
  )
)

server <- function(input, output, session){
  router(input, output, session) #shiny.router
}


options(shiny.port = 3333)

shinyApp(ui, server)





