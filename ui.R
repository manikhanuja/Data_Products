library(shinyjs)
shinyUI(pageWithSidebar(
  headerPanel("Iris - Predict Species based on Petal Length"),
  sidebarPanel(
    useShinyjs(),
    disabled(numericInput(inputId = "seplen", label = "Sepal Length", value = "5.4")),
    disabled(numericInput(inputId = "sepwid", label = "Sepal Width", value = "3.9")),
    numericInput(inputId = "petlen", label = "Petal Length", value = "1.7"),
    disabled(numericInput(inputId = "petwid", label = "Petal Width", value = "0.4")),
    submitButton("Submit")
  ),
 
    mainPanel(
      tabsetPanel(
      
        tabPanel("Result",h4(p('Input from User')),tableOutput("species"), h4(p('Predicted Species')),h4(textOutput("result")),
                 p('Note:'),
                 p('1: Setosa'),
                 p('2: Versicolor'),
                 p('3: Virginica')),
        tabPanel("Plot", plotOutput("classification")),
        tabPanel("Help", h2('Help Documentation'),
                 h4(p('About Iris Dataset')),
                 p('The Iris flower data set is a multivariate data set introduced by Ronald Fisher in his 1936 paper.'),
                 p('The data set consists of 50 samples from each of three species of Iris (Iris setosa, Iris virginica and Iris versicolor).'),
                 h4('Features of Application'),
                 p('1. Identify the species based on Petal Length'),
                 p('2. Algorithm used: <b>Classification Trees</b>'),
                 p('3. Simple Application which performs Predictive Analytics'),
                 h4('How to Use?'),
                 h5('Result Tab'),
                 p('1. For viewing the algorithm result, make sure you are on "Result" tab'),
                 p('2. Enter Petal length between 1 to 10, in the textbox on left sidebar.'),
                 p('3. Press "submit" button.'),
                 p('4. Species class will be displayed on right sidebar on "Result" tab.'),
                 h5('Plot Tab'),
                 p('Classification logic is displayed on "Plot" tab.')
                    )
    
)
  )
   )
    )
