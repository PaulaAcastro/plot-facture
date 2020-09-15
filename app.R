
## DIA 1

install.packages("shiny")
install.packages("tidyverse")
install.packages("ggplot2")
library(shiny)
library(ggplot2)
library(tidyverse)

runExample("01_Hello") # carregando um exemplo de shiny
 
# ui é a parte do usuário
# server é a parte dos cálculos e operações

bcl <- read.csv("bcl.csv", stringsAsFactors = FALSE)
# banco de dados de produtos vendidos pela BCL

# Tem sempre que salvar antes de rodar
# Rodar pelo comando pq meu R é doido


ui <- fluidPage(
  titlePanel("BC Liquor Store prices"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("priceInput", "Price", 0, 100, c(25, 40), pre = "$"),
      radioButtons("typeInput", "Product type",
                   choices = c("BEER", "REFRESHMENT", "SPIRITS", "WINE"),
                   selected = "WINE"),
      selectInput("countryInput", "Country",
                  choices = c("CANADA", "FRANCE", "ITALY"))
    ),
    mainPanel(
      plotOutput("coolplot"),
      br(), br(),
      tableOutput("results")
    )
  )
)

# Posso definir uma va reativa(filtered), fora do output e imput p/ não
# precisar declarar duas vezes ou mais.

# A funçãpo reactive({}) cria a va reativa. Após isso, posso usar a função
# criada dentro de ambientes reativos com (). Devo criar dentro do server

server <- function(input, output){
  filtered <- reactive({
    req(input$priceInput, input$typeInput, input$countryInput) 
    # só vai calcular abaixo se eu tiver essas variáveis
      bcl %>% 
      filter(Price >= input$priceInput[1], # vou definir os outputs pelos
             Price <= input$priceInput[2], # inputs definidos
             Type == input$typeInput,
             Country == input$countryInput
      )
  })
  #ctrl+shift+m = >%>
  output$coolplot <- renderPlot({ # defino gráfico, retorno gráfico *
    req(filtered)
    ggplot(filtered(), aes(Alcohol_Content))+ # *
      geom_histogram()
  })
  output$results <- renderTable({ # o output sempre recebe uma função render
    req(filtered)
    filtered() # *
  })
}

shinyApp(ui, server)








