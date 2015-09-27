
library(shiny)

m1<-glm(ncases~.,data=esoph)
m2<-glm(ncases~alcgp,data=esoph)
m3<-glm(ncases~tobgp,data=esoph)
m4<-glm(ncases~agegp,data=esoph)
data1<-data.frame(All=m1$resid,Alcohol=m2$resid,Tobacco=m3$resid,Age=m4$resid)   



#Building the UI
shinyUI(
  fluidPage(    
    # Give the page a title
    titlePanel("Esophogeal Cancer Analysis"),   
    sidebarLayout(          

      sidebarPanel(
        selectInput("model", "Predictors:", 
                    choices=colnames(data1)),
        hr(),
        helpText("Please select Model predictor to view residuals")
      ),
      
      # Create a spot for the barplot
      mainPanel(
        tabsetPanel(type = "tabs", 
                    tabPanel("Plot of Residuals", plotOutput("residPlot")), 
                    tabPanel("Summary of Esoph Data", verbatimTextOutput("summary")), 
                    tabPanel("Table of Esoph Data", tableOutput("table"))
              )
      
    )
  )
))


