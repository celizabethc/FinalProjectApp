library(shiny)

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



