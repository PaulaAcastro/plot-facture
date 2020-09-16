
library(shiny) #p/ dar o library sem as mensagens que aparecem
library(shiny.router) # cria diferentes rotas. Abas em um site
library(shinyjs)

addResourcePath("assets", "./src/assets") # assim, tudo que está dentro de 
#assests pode ser utilizado em outras guias

#Temos que cuidar da ordem 

source("./src/components/SideBarPanel/index.R")
source("./src/components/SideBarPanelItem/index.R")
source("./src/routes/index.R")

