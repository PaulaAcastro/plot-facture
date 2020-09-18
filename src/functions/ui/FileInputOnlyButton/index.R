
fileInputOnlyButton <- function(..., label = "", class= NULL){
  temp <- fileInput(..., label = label)
  temp$children[[1]] <- NULL
  temp$children[[1]]$children[[2]] <- NULL
  temp$children[[1]]$attribs$class <- NULL
  temp$children[[1]]$children[[1]]$attribs$class <- class
  temp
}