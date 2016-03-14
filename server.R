# Load Required Libraries
library(caret)
library(AppliedPredictiveModeling)
library(ggplot2)
library(rpart)
library(lattice)
#library(jsonlite)
library(shiny)
library(e1071)
library(rpart.plot)
library(shinyjs)

#Set Seed and Load Data
set.seed(3433)
data(iris)

#Partition Data
inTrain = createDataPartition(iris$Species, p = 3/4, list = FALSE)
training = iris[ inTrain,]
testing = iris[-inTrain,]
modFit <- train(Species ~., method = "rpart", data = training)


shinyServer(
  function(input,output){
    irisT1 <- reactive({df <- data.frame()
                        df <- rbind(df,c(input$seplen,input$sepwid,input$petlen,input$petwid))
                        df})
    
    irisT2 <- reactive({s <- c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")
                        d <- irisT1()
                        colnames(d) <- s
                        d
})
   
    output$species <- renderTable({irisT2()})
    predictfinal <- reactive({pre <- predict(modFit, irisT2(), type="raw")
                           
                             })
    output$result <- renderText({ predictfinal()
                                 })
    output$classification <- renderPlot({
      prp(modFit$finalModel,  main = "Classification Tree", varlen = 20, split.box.col = "lightblue",box.col = "lightyellow")
    })
  })
