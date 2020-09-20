
suppressMessages(library(shiny)) #p/ dar o library sem as mensagens que aparecem
suppressMessages(library(shiny.router)) # cria diferentes rotas. Abas em um site
suppressMessages(library(shinyjs))
suppressMessages(library(sass))
suppressMessages(library(DT))
suppressMessages(library(colourpicker))
suppressMessages(library(plotly))
suppressMessages(library(tidyverse))

addResourcePath("assets", "./src/assets") # assim, tudo que está dentro de 
#assests pode ser utilizado em outras guias

#Temos que cuidar da ordem 

source("./src/components/SideBarPanel/index.R", encoding = "UTF-8")
source("./src/components/SideBarPanelItem/index.R", encoding = "UTF-8")
source("./src/components/PageTransitionButton/index.R", encoding = "UTF-8")
source("./src/components/ImportPanel/index.R", encoding = "UTF-8")
source("./src/components/ImportDataButton/index.R", encoding = "UTF-8")
source("./src/components/DisplayDataframe/index.R", encoding = "UTF-8")
source("./src/components/ForwardBackwardButtons/index.R", encoding = "UTF-8")
source("./src/components/TypePanel/index.R", encoding = "UTF-8")
source("./src/components/EditionPanel/index.R", encoding = "UTF-8")
source("./src/components/SwitchCheckBox/index.R", encoding = "UTF-8")
source("./src/components/ResultPanel/index.R", encoding = "UTF-8")
source("./src/components/DisplayPlot/index.R", encoding = "UTF-8")
source("./src/components/CodePlot/index.R", encoding = "UTF-8")



source("./src/functions/ui/MainPanel/index.R", encoding = "UTF-8")
source("./src/functions/ui/MainText/index.R", encoding = "UTF-8")
source("./src/functions/ui/MainButton/index.R", encoding = "UTF-8")
source("./src/functions/ui/FileInputOnlyButton/index.R", encoding = "UTF-8")

source("./src/functions/server/DefaultSetPlotOptions/index.R", encoding = "UTF-8")
source("./src/functions/server/TypeOfPlot/index.R", encoding = "UTF-8")

source("./src/routes/index.R", encoding = "UTF-8")