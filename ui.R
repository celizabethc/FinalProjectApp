library(shiny)

m1<-glm(ncases~.,data=esoph)
m2<-glm(ncases~alcgp,data=esoph)
m3<-glm(ncases~tobgp,data=esoph)
m4<-glm(ncases~agegp,data=esoph)
data1<-data.frame(m1$resid,m2$resid,m3$resid,m4$resid) 

#Building the UI
shinyUI(
  fluidPage(    
    # Give the page a title
    titlePanel("Esophogeal Cancer Analysis"),   
    sidebarLayout(          
      # Define the sidebar with one input
      sidebarPanel(
        selectInput("model", "Predictors:", 
                    choices=colnames(data1)),
        hr(),
        helpText("Residuals from Modeling")
      ),
      
      # Create a spot for the barplot
      mainPanel(
        plotOutput("residPlot")  
      )
      
    )
  )
)



