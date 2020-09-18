
pageTransitionButton <- function(id, label){
  ns <- NS(id)
  
  tags$div(
    class = "pageTransitionButton",
    tags$a(
      id = ns("button"),
      class = "green-button action-button",
      label
    )
  )
}

pageTransitionButtonServer <- function(id, page, ...){
  moduleServer(
    id,
    function(input, output, session){
      onclick("button", {
        list(...)
        change_page(page)
      })
    }
  )
} 



