
mainText <- function(title, text, ...){
  children <- tagList(...)
  
  tags$div(
    class = "mainText",
    h1(title),
    p(text),
    children
  )
}