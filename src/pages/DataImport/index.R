
uiDataImport <- tags$div(
  class = "dataImport",
  sideBarPanel(id = "sideBarPanelDataImport"),
    mainPanel(
      mainText = mainText(
        title = "Importando Dados",
        text = "O primeiro passo para a construção de qualquer gráfico é
        importar o banco de dados. Para isso, clique no botão abaixo para 
        selecionar o arquivo de interesse.",
        
        p(
          "É importante ressaltar que os dados devem estar livres de erros 
          e com a formatação correta de suas variáveis. Para que isso ocorra, 
          exigimos que a base de dados esteja na formatação .RDS"
        )
      ),
      importPanel(id = "importPanelDataImport"),
      forwardBackwardButtons(id = "forwardBackwardButtonsDataImport")
  )
)

serverDataImport <- function(input, output, session){
  sideBarPanelServer(id = "sideBarPanelDataImport")
  dataframe <- importPanelServer(id = "importPanelDataImport")
  
  observe({
    forwardBackwardButtonsServer(
      id = "forwardBackwardButtonsDataImport",
      backward = "/",
      forward = "type",
      {
        req(dataframe$data) # só vai p/ edição gráfica se tenho um banco de dados selecionado
        session$userData$dataframe$data <- dataframe$data
      }
    )    
  })
}