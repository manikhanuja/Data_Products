shinyUI(pageWithSidebar(
  headerPanel("Iris - Predict Speicies based on Sepal & Petal Characteristics"),
  sidebarPanel(
    numericInput(inputId = "seplen", label = "Sepal Length", value = "5.4"),
    numericInput(inputId = "sepwid", label = "Sepal Width", value = "3.9"),
    numericInput(inputId = "petlen", label = "Petal Length", value = "1.7"),
    numericInput(inputId = "petwid", label = "Petal Width", value = "0.4"),
    submitButton("Submit")
  ),
  mainPanel(
    
    tableOutput("species"),
    p('Predicted Species Using ClassificationTrees Algorithm'),
    h4(textOutput("result")),
    p('Note:'),
    p('1: Setosa'),
    p('2: Versicolor'),
    p('3: Virginica')
  )
))
