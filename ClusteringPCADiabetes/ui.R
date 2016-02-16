diabetes <- read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/pima-indians-diabetes/pima-indians-diabetes.data",sep = ",",header=FALSE)
names(diabetes) <-c('Number of Times Pregnant','Plasma Glucose Concentration','Diastolic Blood Pressure','Triceps Skin Fold Thinkness','2-Hour Serum Insulin','Body Mass Index (BMI)','Diabetes Pedigree Function','Age','Class')
require(markdown)

shinyUI(
        
        navbarPage("K-means Clustering on PCA of Pima Indians Diabetes Dataset",
                   tabPanel("Plots", 
                            sidebarPanel(                                           
                                    sliderInput("clusters", "Number of clusters(K):",   min=2, max=20, value=13),
                                          shinyjs::useShinyjs(), 
                                          shinyjs::inlineCSS(list(.grey = "background: silver")),
                                          actionButton("PC",  "Use Principal Components"),
                                          actionButton("VARs","Use Individual Attributes"),
                                          selectInput('xcol', 'X Axis', names(diabetes[,-9])),
                                          selectInput('ycol', 'Y Axis', names(diabetes[,-9]),
                                          selected=names(diabetes)[[2]])      
                                        ),
                             mainPanel(plotOutput('plot'))
                   ),
                   tabPanel("Getting Started",
                            mainPanel(
                                    includeMarkdown("GettingStarted.md")
                            )
                   )
        )
)