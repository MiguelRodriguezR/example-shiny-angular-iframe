#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
#install.packages("request")
library("request")
#install.packages("rjson")
library("rjson")
#install.packages("jsonlite")
library(jsonlite)
#install.packages("tidyverse")
library(tidyverse)

setwd("D:\\R\\Example Angular Shiny\\R-shiny") 
pum_salida <-"prueba3.csv" #nombre del archivo
#ru2 <- ("/home/luis/Documentos/dirR/prueba1.csv"
lect <- read_csv(pum_salida)

function(input, output, session) {
  
    regFormula <- reactive({
      req(input$texto)
      pum_salida <- input$texto
      read_csv(pum_salida)
    })
    
    output$mytable = DT::renderDataTable({
        lect <- regFormula()
        lect
    })
    
    getGraphicPlot <- reactive({
      req(input$graphX)
      req(input$graphfill)
      req(input$graphType)
      print(regFormula())
      switch(input$graphType, 
             "bar" = ggplot(( data = regFormula())) +
               geom_bar(mapping = aes_string( x = input$graphX, fill = input$graphfill)), 
             "pie" = pie(regFormula()$estado_cotizacion, labels = regFormula()$estado_cotizacion, radius = 1),
             "vertical" = ggplot(regFormula(), aes_string( x = "''", y = input$graphX, fill = input$graphfill)) +
               geom_bar(width = 1, stat = "identity") 
      )
    })
    
    output$distPlot <- renderPlot({
      p <- getGraphicPlot()
      print(p)
    })
    
    output$text <- renderText({
      req(input$texto)
      req(input$tipo)
      
      paste("desde archivo: ", input$texto, " tipo: ", input$tipo)
    })
}