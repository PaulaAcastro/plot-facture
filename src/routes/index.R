
source("./src/pages/Home/index.R", encoding = "UTF-8")
source("./src/pages/DataImport/index.R", encoding = "UTF-8")
#p/ não dar problema com acentuações e ect
source("./src/pages/Edition/index.R", encoding = "UTF-8")
source("./src/pages/Result/index.R", encoding = "UTF-8")
source("./src/pages/Type/index.R", encoding = "UTF-8")

# Criando a rota

router <- make_router(
  route("/", uiHome, serverHome),
  route("dataImport", uiDataImport, serverDataImport),
  route("edition", uiEdition, serverEdition),
  route("result", uiResult, serverResult),
  route("type", uiType, serverType)
)


## Arquivo já está pronto









