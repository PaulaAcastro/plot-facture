
forwardBackwardButtons <- function(id, forward = TRUE){
  ns <- NS(id)
  
  tags$div(
    class = "forwardBackwardButtons",
    if(forward){
      mainButton(
        mainButton = pageTransitionButton(
          id = ns("backward"),
          label = "Voltar"
        ),
        button = pageTransitionButton(
          id = ns("forward"),
          label = "Avançar"
        )
      )
    }else{
      mainButton(
        mainButton = pageTransitionButton(
          id = ns("backward"),
          label = "Voltar"
        )
      )
    }
  )
}

forwardBackwardButtonsServer <- function(id, backward, forward, ...){
  moduleServer(
    id,
    function(input, output, session){
      pageTransitionButtonServer(id = "backward", page = backward)
      pageTransitionButtonServer(id = "forward", page = forward, ...)
    }
  )
}