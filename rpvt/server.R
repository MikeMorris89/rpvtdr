############################################
# Server
############################################
server = function(input, output, session) {
  output$pivot <- renderRpivotTable({
    rdata <<- readRDS(paste("./data/",input$dataset,".rda",sep=""))
    rpivotTable(data =   
                 rdata   
                ,aggregatorName = "Sum"
                ,rendererName = "Table"
                ,width="100%"
                ,height="100%")
  })
  
}

shinyServer(server)