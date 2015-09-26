install.packages("shiny")
library(shiny)
data(esoph)
attach(esoph)

# Server for Shiny App
shinyServer(function(input, output) {
  # Render Viz
  output$residPlot <- renderPlot({
    attach(esoph)
    m1<-glm(ncases~.,data=esoph)
    m2<-glm(ncases~alcgp)
    m3<-glm(ncases~tobgp)
    m4<-glm(ncases~agegp)
    data1<-data.frame(m1$resid,m2$resid,m3$resid,m4$resid)   
    # Render a barplot
    plot(data1[,input$model], 
            main=input$model,
            ylab="Residuals",
            xlab="Observations")
  })
})




