library(shiny)
require(datasets)
data(esoph)
attach(esoph)

m1<-glm(ncases~.,data=esoph)
m2<-glm(ncases~alcgp,data=esoph)
m3<-glm(ncases~tobgp,data=esoph)
m4<-glm(ncases~agegp,data=esoph)
data1<-data.frame(m1$resid,m2$resid,m3$resid,m4$resid)  


# Server for Shiny App
shinyServer(function(input, output) {
  # Render Viz
  output$residPlot <- renderPlot({
    attach(esoph)
    m1<-glm(ncases~.,data=esoph)
    m2<-glm(ncases~alcgp,data=esoph)
    m3<-glm(ncases~tobgp,data=esoph)
    m4<-glm(ncases~agegp,data=esoph)
    data1<-data.frame(All=m1$resid,Alcohol=m2$resid,Tobacco=m3$resid,Age=m4$resid)   
    
    # Render a barplot
    plot(data1[,input$model], 
            main=input$model,
            ylab="Residuals",
            xlab="Observations", col="blue")
  })
})




