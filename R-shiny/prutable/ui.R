#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
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

shinyUI(
  bootstrapPage(
    
    # include the message.js script so the JavaScript knows the custom message handler we have written
    includeScript("js/proxy.js"),
    
    div( id = "container",
      h2(textOutput("text")),
      conditionalPanel(
        condition = "input.tipo == 'table'",
        DT::dataTableOutput("mytable")
      ),
      conditionalPanel(
        condition = "input.tipo == 'graph'",
        plotOutput("distPlot")
      )
      
    )
    
  )
)


