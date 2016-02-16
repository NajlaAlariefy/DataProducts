library(shinyjs)
diabetes <- read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/pima-indians-diabetes/pima-indians-diabetes.data",sep = ",",header=FALSE)
names(diabetes) <-c('Number of Times Pregnant','Plasma Glucose Concentration','Diastolic Blood Pressure','Triceps Skin Fold Thinkness','2-Hour Serum Insulin','Body Mass Index (BMI)','Diabetes Pedigree Function','Age','Class')

flag <- 0
shinyServer(  
        function(input, output,session) {    
               v <- reactiveValues( flag = 0)
                observeEvent(input$PC, {
                        shinyjs::disable("xcol") 
                        shinyjs::disable("ycol") 
                        shinyjs::toggleClass("PC","grey")
                        shinyjs::toggleClass("VARs","grey")
                        
                        v$flag <- 1
                 } )
                observeEvent(input$VARs, {
                        shinyjs::enable("xcol") 
                        shinyjs::enable("ycol")  
                        shinyjs::toggleClass("PC","grey")
                        shinyjs::toggleClass("VARs","grey")
                        v$flag <- 0
                } )
            
                output$plot <- renderPlot({ 
                       
                        if (v$flag == 0)
                        {
                   shinyjs::addClass("VARs", "grey")
                        cl <- kmeans(  diabetes[, c(input$xcol, input$ycol)], input$clusters)
                        x <- input$xcol
                        y <- input$ycol
                        plot(diabetes[, input$xcol], diabetes[, input$ycol],col=cl$cluster, main= "K-means Clustering on Individual Attributes", xlab=x, ylab=y)
                        points(cl$centers, pch=16) 
                        
                        }
                        
                        else
                        {
                                attributes <- diabetes[,1:8]
                                p <- princomp(attributes, cor=T)  
                                PC1 <- -1*p$scores[,1]  
                                PC2 <- -1*p$scores[,2]  
                                X <- cbind(PC1, PC2)
                                cl <- kmeans(X,input$clusters)
                                cl$cluster   
                                plot(PC1, PC2,col=cl$cluster,main="K-means Clustering by PCA", xlab="Principal Component 1", ylab="Principal Component 2")
                                points(cl$centers, pch=16) 
                        }
                }) 
              
              
        
        }
     
)